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
    var filter: CIFilter?
    lazy var currentContext: CIContext = CIContext.selectImageContext("")
    
    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let image = self.image else {
            return nil
        }
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
        
        if let buffer = pixelBuffer {
            let context = currentContext
            if let filter = self.filter {
                filter.setValue(image, forKey: kCIInputImageKey)
                let processed = filter.outputImage ?? image
                context.render(processed, to: buffer)
            } else {
                context.render(image, to: buffer)
            }
            return Unmanaged.passRetained(buffer)
        }
        return nil
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
    
    func connect(_ textureId: NSNumber, _ filterId: NSNumber, _ context: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.currentContext = CIContext.selectImageContext(context)
        preview.filter = filter
    }
    
    func disconnect(_ textureId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        preview.currentContext = CIContext.selectImageContext("")
        preview.filter = nil
    }
    
    func setSource(_ msg: FLTSourcePreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        var path = msg.path
        if msg.asset.boolValue {
            #if os(iOS)
            let assetKey = registrar.lookupKey(forAsset: msg.path)
            
            guard let assetPath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                error.pointee = FlutterError()
                return
            }
            path = assetPath
            #endif
        }
        let url = URL(fileURLWithPath: path)
        guard let image = CIImage(contentsOf: url) else {
            error.pointee = FlutterError()
            return
        }
        preview.image = image
    }
    
    func setData(_ msg: FLTDataPreviewMessage, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let preview = previews[msg.textureId.int64Value] else {
            error.pointee = FlutterError()
            return
        }
        guard let image = CIImage(data: msg.data.data) else {
            error.pointee = FlutterError()
            return
        }
        preview.image = image
    }
    
    func dispose(_ textureId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        
        let preview = previews.removeValue(forKey: textureId.int64Value)
        preview?.filter = nil
        preview?.image = nil
    }
    
    func didUpdated(filter: CIFilter) {
        let texture = previews.first { _, texture in
            texture.filter == filter
        }
        guard let textureId = texture?.key else {
            return
        }
        registry.textureFrameAvailable(textureId)
    }
}
