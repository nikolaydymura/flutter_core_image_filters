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
    private var exporterSequenceId: Int64 = 0
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
                                blue: CGFloat(truncating: value[2]),
                                alpha: CGFloat(truncating: value[3]))
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
    
    func setNSValueParameter(_ filterId: NSNumber, _ key: String, _ value: [NSNumber], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
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
#if os(iOS)
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
#endif
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
        if targetClass == "NSData" {
            if key.contains("Cube") {
#if os(iOS)
                guard let image = UIImage(data: data.data) else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                    return
                }
                filter.setValue(image.cubeData(dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB()), forKey: key)
                filterDelegate?.didUpdated(filter: filter)
#endif
            }
        }
    }
    
    func setNSDataSourceParameter(_ filterId: NSNumber, _ key: String, _ asset: NSNumber, _ path: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
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
        if targetClass == "NSData" {
            if key.contains("Cube") {
                if asset.boolValue {
#if os(iOS)
                    let assetKey = registrar.lookupKey(forAsset: path)
                    
                    guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                        error.pointee = FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
                        return
                    }
                    guard let image = UIImage(contentsOfFile: filePath) else {
                        error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                        return
                    }
                    filter.setValue(image.cubeData(dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB()), forKey: key)
                    filterDelegate?.didUpdated(filter: filter)
#endif
                } else {
#if os(iOS)
                    guard let image = UIImage(contentsOfFile: path) else {
                        error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                        return
                    }
                    filter.setValue(image.cubeData(dimension: 64, colorSpace: CGColorSpaceCreateDeviceRGB()), forKey: key)
                    
                    filterDelegate?.didUpdated(filter: filter)
#endif
                }
            }
        }
    }
    
    func disposeFilter(_ filterId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        filters.removeValue(forKey: filterId.int64Value)
    }
    
}


extension CoreImageFilters {
    func exportData(_ filterId: NSNumber, _ format: String, _ context: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterStandardTypedData? {
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return nil
        }
        guard let image = filter.outputImage else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
            return nil
        }
        
        let context = CIContext.selectImageContext(context)
        let colorSpace = (context.workingColorSpace ?? CGColorSpace(name: CGColorSpace.sRGB))!
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
    
    func exportImageFile(_ filterId: NSNumber, _ path: String, _ format: String, _ context: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let flutterError = error
        guard let filter = filters[filterId.int64Value] else {
            flutterError.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard let image = filter.outputImage else {
            flutterError.pointee = FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
            return
        }
        
        let context = CIContext.selectImageContext(context)
        let colorSpace = (context.workingColorSpace ?? CGColorSpace(name: CGColorSpace.sRGB))!
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
    
    func exportVideoFile(_ filterId: NSNumber, _ asset: NSNumber, _ input: String, _ output: String, _ format: String, _ context: String, _ preset: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        
        guard let filter = filters[filterId.int64Value] else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return nil
        }
        var path = input
        if asset.boolValue {
#if os(iOS)
            let assetKey = registrar.lookupKey(forAsset: path)
            
            guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                error.pointee = FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
                return nil
            }
            path = filePath
#endif
        }
        let asset = AVAsset(url: URL(fileURLWithPath: path))
        let ciContext = CIContext.selectVideoContext(context)
        let videoComposition = AVVideoComposition(asset: asset) { request in
            let source = request.sourceImage.clampedToExtent()
            filter.setValue(source, forKey: kCIInputImageKey)
            let output = filter.outputImage?.cropped(to: request.sourceImage.extent)
            request.finish(with: output ?? source, context: ciContext)
        }
        guard let exporter = AVAssetExportSession(asset: asset, presetName: preset) else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Invalid exporter", details: nil)
            return nil
        }
        
        exporter.videoComposition = videoComposition
        exporter.outputURL = URL(fileURLWithPath: output)
        
        if format == "mp4" {
            exporter.outputFileType = .mp4
        } else if format == "mov" {
            exporter.outputFileType = .mov
        } else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
            return nil
        }
        
        let exportId = exporterSequenceId
        exporterSequenceId += 1
#if os(iOS)
        let eventChannel = FlutterEventChannel(name: "AVAssetExportSession_\(exportId)",
                                               binaryMessenger: registrar.messenger())
        
#else
        let eventChannel = FlutterEventChannel(name: "AVAssetExportSession_\(exportId)",
                                               binaryMessenger: registrar.messenger)
#endif
        eventChannel.setStreamHandler(AVAssetExportSessionStreamHandler(session: exporter))
        return NSNumber(value: exportId)
        
    }
    
}

class AVAssetExportSessionStreamHandler: NSObject, FlutterStreamHandler {
    private let session: AVAssetExportSession
    private var eventSink: FlutterEventSink?
    private var timer: Timer?
    
    init(session: AVAssetExportSession) {
        self.session = session
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: updateProgess(_:))
        session.exportAsynchronously(completionHandler: export)
        return nil
    }
    
    func updateProgess(_ timer: Timer) {
        eventSink?(session.progress)
    }
    
    func export() {
        timer?.invalidate()
        if session.error == nil && session.status == .completed {
            eventSink?(-100.0)
            
        } else {
            let message = String(describing: session.error)
            eventSink?(FlutterError.init(code: "core-image-filters",
                                         message: message,
                                         details: nil))
        }
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        timer?.invalidate()
        session.cancelExport()
        eventSink = nil
        timer = nil
        return nil
    }
}
