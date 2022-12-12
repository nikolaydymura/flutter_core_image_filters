//
//  CoreImageFilters.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import AVFoundation
import Flutter

protocol FiltersLocator {
    subscript (id: Int64) -> CIFilter? { get }
}

protocol FilterDelegate {
    func didUpdated(filter: CIFilter)
}

class CoreImageFilters: NSObject, FLTFilterApi, FiltersLocator {
    private var filters: [Int64: CIFilter] = [:]
    private var filterSequenceId: Int64 = 0
    private let registrar: FlutterPluginRegistrar
    var filterDelegate: FilterDelegate?
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
    }
    
    subscript(id: Int64) -> CIFilter? {
        return filters[id]
    }
    
    func createFilter(_ name: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        let filterId = filterSequenceId
        filterSequenceId += 1
        filters[filterId] = CIFilter(name: name)
        return NSNumber(value: filterId)
    }
    
    func setInputData(_ filterId: NSNumber, _ data: FlutterStandardTypedData, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        return setCIImageDataParameter(filterId, kCIInputImageKey, data, error: error)
    }
    
    func setInputAsset(_ filterId: NSNumber, _ path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        return setCIImageSourceParameter(filterId, kCIInputImageKey, true, path, error: error)
    }
    
    func setInputFile(_ filterId: NSNumber, _ path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        return setCIImageSourceParameter(filterId, kCIInputImageKey, false, path, error: error)
    }
    
    func setNSNumberParameter(_ filterId: NSNumber, _ key: String, _ value: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attributes not present", details: nil)
            return
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
            return
        }
        if targetClass == "NSNumber" {
            filter.setValue(value, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }

    func setCIColorParameter(_ filterId: NSNumber, _ key: String, _ value: [NSNumber], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attributes not present", details: nil)
            return
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
            return
        }
        if targetClass == "CIColor" {
            let color = CIColor(red: CGFloat(truncating: value[0]),
                                green: CGFloat(truncating: value[1]),
                                blue: CGFloat(truncating: value[2]))
            filter.setValue(color, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setCIVectorParameter(_ filterId: NSNumber, _ key: String, _ value: [NSNumber], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attributes not present", details: nil)
            return
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
            return
        }
    }
    
    func setCIImageDataParameter(_ filterId: NSNumber, _ key: String, _ data: FlutterStandardTypedData, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attributes not present", details: nil)
            return
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
            return
        }
        if targetClass == "CIImage" {
            guard let image = CIImage(data: data.data) else {
                error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                return
            }
            filter.setValue(image, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setCIImageSourceParameter(_ filterId: NSNumber, _ key: String, _ asset: NSNumber, _ path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attributes not present", details: nil)
            return
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
            return
        }
        if targetClass == "CIImage" {
            if asset.boolValue {
                let assetKey = registrar.lookupKey(forAsset: path)
                
                guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
                    return
                }
                guard let image = CIImage(contentsOf: URL(fileURLWithPath: filePath)) else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                    return
                }
                filter.setValue(image, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            } else {
                guard let image = CIImage(contentsOf: URL(fileURLWithPath: path)) else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                    return
                }
                filter.setValue(image, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            }
        }
    }
    
    func setNSDataParameter(_ filterId: NSNumber, _ key: String, _ data: FlutterStandardTypedData, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        
    }
    
    func setNSDataSourceParameter(_ filterId: NSNumber, _ key: String, _ asset: NSNumber, _ path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        
    }
    
    func disposeFilter(_ filterId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        filters.removeValue(forKey: filterId.int64Value)
    }
    
}


extension CoreImageFilters {
    func exportData(_ filterId: NSNumber, _ format: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterStandardTypedData? {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return nil
        }
        guard let image = filter.outputImage else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
            return nil
        }
        
        let context = CIContext.defaultGLContext
        let colorSpace = CGColorSpace(name: CGColorSpace.sRGB)!
        if format == "png" {
            if let data = context.pngRepresentation(of: image, format: CIFormat.RGBA8, colorSpace: image.colorSpace ?? colorSpace) {
                return FlutterStandardTypedData(bytes: data)
            } else {
                error.pointee = FlutterError(code: "core-image-filters", message: "Failed to create PNG data", details: nil)
            }
        } else if format == "jpeg" {
            if let data = context.jpegRepresentation(of: image, colorSpace: image.colorSpace ?? colorSpace) {
                return FlutterStandardTypedData(bytes: data)
            } else {
                error.pointee = FlutterError(code: "core-image-filters", message: "Failed to create JPEG data", details: nil)
            }
        } else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
        }
        
        return nil
        
    }
    
    func exportImageFile(_ filterId: NSNumber, _ path: String, _ format: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let flutterError = error
        guard let filter = filters[filterId.int64Value] else {
            flutterError.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let image = filter.outputImage else {
            flutterError.pointee = FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
            return
        }
        
        let context = CIContext.defaultGLContext
        let colorSpace = CGColorSpace(name: CGColorSpace.sRGB)!
        if format == "png" {
            do {
                try context.writePNGRepresentation(of: image, to: URL(fileURLWithPath: path), format: CIFormat.RGBA8, colorSpace: image.colorSpace ?? colorSpace)
            } catch {
                flutterError.pointee = FlutterError(code: "core-image-filters", message: "Failed to create PNG data", details: nil)
            }
        } else if format == "jpeg" {
            do {
                try context.writeJPEGRepresentation(of: image, to: URL(fileURLWithPath: path), colorSpace: image.colorSpace ?? colorSpace)
            } catch {
                flutterError.pointee = FlutterError(code: "core-image-filters", message: "Failed to create JEPG data", details: nil)
            }
        } else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
        }
    }

    func exportVideoFile(_ filterId: NSNumber, _ asset: NSNumber, _ input: String, _ output: String, _ format: String, completion: @escaping (FlutterError?) -> Void) {

        guard let filter = filters[filterId.int64Value] else {
            completion(FlutterError(code: "core-image-filters", message: "Filter not found", details: nil))
            return
        }
        var path = input
        if asset.boolValue {
            let assetKey = registrar.lookupKey(forAsset: path)
            
            guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                completion(FlutterError(code: "core-image-filters", message: "Asset not found", details: nil))
                return
            }
            path = filePath
        }
        let asset = AVAsset(url: URL(fileURLWithPath: path))
        let videoComposition = AVVideoComposition(asset: asset) { request in
            let source = request.sourceImage.clampedToExtent()
            filter.setValue(source, forKey: kCIInputImageKey)
            let output = filter.outputImage?.cropped(to: request.sourceImage.extent)
            request.finish(with: output ?? source, context: CIContext.defaultGLContext)
        }
        guard let exporter = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) else {
            completion(FlutterError(code: "core-image-filters", message: "Invalid exporter", details: nil))
            return
        }
        
        exporter.videoComposition = videoComposition
        exporter.outputURL = URL(fileURLWithPath: output)
        
        if format == "mp4" {
            exporter.outputFileType = .mp4
        } else if format == "mov" {
            exporter.outputFileType = .mov
        } else {
            completion(FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil))
            return
        }
        exporter.exportAsynchronously { () -> Void in
            if exporter.error == nil && exporter.status == .completed {
                completion(nil)

            } else {
                let message = String(describing: exporter.error)
                completion(FlutterError.init(code: "core-image-filters",
                                             message: message,
                                             details: nil))
            }
        }
    }
    
}
