//
//  ImagePreview.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 22.11.2022.
//
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif
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

class ImagePreview: NSObject, ImagePreviewApi, FilterDelegate {
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
    
    
    func create() throws -> Int64 {
        let preview = ImagePreviewTexture()
        let textureId = registry.register(preview)
        previews[textureId] = preview
        return textureId
    }
    
    func connect(_ textureId: Int64, _ filters: [Int64], _ context: String) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.currentContext = CIContext.selectImageContext(context)
        preview.filters = self.filters[filters]
    }
    
    func disconnect(_ textureId: Int64) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.currentContext = CIContext.selectImageContext()
        preview.filters = []
    }
    
    func setOutput(_ textureId: Int64, _ value: [Double]) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        preview.outputRect = CGRect(x: CGFloat(value[0]),
                                    y: CGFloat(value[1]),
                                    width: CGFloat(value[2]),
                                    height: CGFloat(value[3]))
        registry.textureFrameAvailable(textureId)
    }
    
    func setSource(_ textureId: Int64, asset: String) throws {
        #if os(iOS)
        let assetKey = registrar.lookupKey(forAsset: asset)

        guard let path = Bundle.main.path(forResource: assetKey, ofType: nil) else {
            throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
        }
        try setSource(textureId, path: path)
        #else
        try setSource(textureId, path: asset)
        #endif
    }
    
    func setSource(_ textureId: Int64, path: String) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        let url = URL(fileURLWithPath: path)
        guard let image = CIImage(contentsOf: url) else {
            throw FlutterError(code: "core-image-filters", message: "Image not loaded", details: nil)
        }
        preview.image = image
        registry.textureFrameAvailable(textureId)
    }
    
    func setSource(_ textureId: Int64, data: FlutterStandardTypedData) throws {
        guard let preview = previews[textureId] else {
            throw FlutterError(code: "core-image-filters", message: "Preview not found", details: nil)
        }
        guard let image = CIImage(data: data.data) else {
            throw FlutterError(code: "core-image-filters", message: "Image not loaded", details: nil)
        }
        preview.image = image
        registry.textureFrameAvailable(textureId)
    }
    
    func dispose(_ textureId: Int64) throws {
        let preview = previews.removeValue(forKey: textureId)
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
