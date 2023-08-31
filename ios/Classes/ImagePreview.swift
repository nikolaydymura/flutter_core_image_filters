//
//  ImagePreview.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 22.11.2022.
//
import Flutter
import UIKit
import Foundation

fileprivate class ImagePreviewTexture: NSObject, FlutterTexture {
    var image: CIImage?
    var filters: [CIFilter] = []
    lazy var outputRect = CGRect(x: 0, y: 0, width: 300, height: 300)
    lazy var currentContext: CIContext = CIContext.selectImageContext()
    
    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        let context = currentContext
        guard !filters.isEmpty else {
            if let image = image,
                let buffer = createPixelBuffer(from: image) {
                context.render(image, to: buffer, bounds: image.extent, colorSpace: context.currentColorSpace)
                return Unmanaged.passRetained(buffer)
            } else {
                return nil
            }
        }
        if filters.first?.inputKeys.contains(kCIInputImageKey) == true {
            if let image = image {
                
                guard var processed = filters.process(source: image) else {
                    return nil
                }
                if processed.extent.isInfinite {
                    processed = processed.cropped(to: image.extent)
                }
                if processed.extent.origin.x != 0 || processed.extent.origin.y != 0 {
                    let translationX = processed.extent.origin.x * -1
                    let translationY = processed.extent.origin.y * -1
                    processed = processed.transformed(by:
                                                        CGAffineTransform(
                                                            translationX: translationX,
                                                            y: translationY)
                    )
                }
                if let buffer = createPixelBuffer(from: processed) {
                    context.render(processed, to: buffer, bounds: processed.extent, colorSpace: context.currentColorSpace)
                    return Unmanaged.passRetained(buffer)
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            if var processed = filters.process() {
                if processed.extent.isInfinite {
                    processed = processed.cropped(to: outputRect)
                }
                if processed.extent.origin.x != 0 || processed.extent.origin.y != 0 {
                    let translationX = processed.extent.origin.x * -1
                    let translationY = processed.extent.origin.y * -1
                    processed = processed.transformed(by:
                                                        CGAffineTransform(
                                                            translationX: translationX,
                                                            y: translationY)
                    )
                }
                if let buffer = createPixelBuffer(from: processed) {
                    context.render(processed, to: buffer, bounds: processed.extent, colorSpace: context.currentColorSpace)
                    return Unmanaged.passRetained(buffer)
                }
            }
            return nil
        }
    }
    
    private func createPixelBuffer(from image: CIImage) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let attrs = [ kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32RGBA,
                       kCVPixelBufferIOSurfacePropertiesKey as String : [:]] as CFDictionary
        
        let width:Int = Int(image.extent.width)
        let height:Int = Int(image.extent.height)
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                            width,
                            height,
                            kCVPixelFormatType_32BGRA,
                            attrs,
                            &pixelBuffer)
        guard status == kCVReturnSuccess else {
             return nil
        }
        return pixelBuffer
    }
}

class ImagePreview: NSObject, FLTImagePreviewApi, FilterDelegate {
    private let registrar: FlutterPluginRegistrar
    private let filters: FiltersLocator
    
    private var previews: [Int64: ImagePreviewTexture] = [:]
    private let registry: FlutterTextureRegistry
    
    init(registrar: FlutterPluginRegistrar, filters: FiltersLocator) {
        self.registrar = registrar
        self.filters = filters
        #if os(iOS)
        self.registry = registrar.textures()
        #else
        self.registry = registrar.textures
        #endif
    }
    
    
    func create(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        let preview = ImagePreviewTexture()
        let textureId = registry.register(preview)
        previews[textureId] = preview
        return NSNumber(value: textureId)
    }
    
    func connect(_ textureId: NSNumber, _ filters: [NSNumber], _ context: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.currentContext = CIContext.selectImageContext(context)
        preview.filters = self.filters[filters]
    }
    
    func disconnect(_ textureId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.currentContext = CIContext.selectImageContext()
        preview.filters = []
    }
    
    func setOutput(_ textureId: NSNumber, _ value: [NSNumber], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.outputRect = CGRect(x: CGFloat(value[0].floatValue),
                                    y: CGFloat(value[1].floatValue),
                                    width: CGFloat(value[2].floatValue),
                                    height: CGFloat(value[3].floatValue))
        registry.textureFrameAvailable(textureId.int64Value)
    }
    
    func setSource(_ textureId: NSNumber, asset path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        #if os(iOS)
        let assetKey = registrar.lookupKey(forAsset: path)

        guard let path = Bundle.main.path(forResource: assetKey, ofType: nil) else {
            error.pointee = FlutterError()
            return
        }
        #endif
        let url = URL(fileURLWithPath: path)
        guard let image = CIImage(contentsOf: url) else {
            error.pointee = FlutterError()
            return
        }
        preview.image = image
        registry.textureFrameAvailable(textureId.int64Value)
    }
    
    func setSource(_ textureId: NSNumber, path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        let url = URL(fileURLWithPath: path)
        guard let image = CIImage(contentsOf: url) else {
            error.pointee = FlutterError()
            return
        }
        preview.image = image
        registry.textureFrameAvailable(textureId.int64Value)
    }
    
    func setSource(_ textureId: NSNumber, data: FlutterStandardTypedData, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        guard let image = CIImage(data: data.data) else {
            error.pointee = FlutterError()
            return
        }
        preview.image = image
        registry.textureFrameAvailable(textureId.int64Value)
    }
    
    func dispose(_ textureId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        
        let preview = previews.removeValue(forKey: textureId.int64Value)
        preview?.filters = []
        preview?.image = nil
    }
    
    func didUpdated(filter: CIFilter) {
        let texture = previews.first { _, texture in
            texture.filters.contains(filter)
        }
        guard let textureId = texture?.key else {
            return
        }
        registry.textureFrameAvailable(textureId)
    }
}
