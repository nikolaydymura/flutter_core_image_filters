//
//  CoreImageFilters.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import AVFoundation
import FlutterMacOS

extension CIFilter {
    var originImage: CIImage? {
        if inputKeys.contains(kCIInputImageKey) {
           return value(forKey: kCIInputImageKey) as? CIImage
        }
        return nil
    }
}

extension [NSNumber] {
    var rect: CGRect {
        CGRect(x: self[0].intValue,
               y: self[1].intValue,
               width: self[2].intValue,
               height: self[3].intValue)
    }
}
extension [CIFilter] {
    func process(source: CIImage? = nil, extent: CGRect? = nil) -> CIImage? {
        guard let filter = first else {
            return nil
        }
        var frame: CIImage? = source ?? filter.originImage
        
        guard let extent = extent ?? frame?.extent else {
            return nil
        }
        
        for filter in self {
            filter.setValue(frame, forKey: kCIInputImageKey)
            frame = filter.outputImage?.cropped(to: extent)
            if frame == nil {
                break
            }
        }
        return frame
    }
}

protocol FiltersLocator {
    subscript (ids: [NSNumber]) -> [CIFilter] { get }
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
    
    subscript(ids: [NSNumber]) -> [CIFilter] {
        return filters.filter { e in
            ids.map { $0.int64Value }.contains(e.key)
        }.map { $0.value }
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
        if targetClass == "CIVector" {
            let values = value.map { CGFloat($0.doubleValue) }
            let vector = CIVector(values: values, count: values.count)
            filter.setValue(vector, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
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
        if targetClass == "CGAffineTransform" {
            let values = value.map { CGFloat($0.doubleValue) }
            let transform = CGAffineTransform(a: values[0], b: values[1], c: values[2], d: values[3], tx: values[4], ty: values[5])
            filter.setValue(transform, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
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
                guard let cubeDimension = filter.value(forKey: "inputCubeDimension") as? Int else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Cube Dimension must be defined", details: nil)
                    return
                }
                
                guard let image = CIImage(data: data.data) else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                    return
                }
                let result = image.cubeData(dimension: cubeDimension)
                if let data = result.0 {
                    filter.setValue(data, forKey: key)
                    filterDelegate?.didUpdated(filter: filter)
                } else if let message = result.1 {
                    error.pointee = FlutterError(code: "core-image-filters", message: message, details: nil)
                }
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
                guard let cubeDimension = filter.value(forKey: "inputCubeDimension") as? Int else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Cube Dimension must be defined", details: nil)
                    return
                }
                var fileURL = URL(fileURLWithPath: path)
                if asset.boolValue {
#if os(iOS)
                    let assetKey = registrar.lookupKey(forAsset: path)
                    
                    guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                        error.pointee = FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
                        return
                    }
                    fileURL = URL(fileURLWithPath: filePath)
#endif
                }
                guard let image = CIImage(contentsOf: fileURL) else {
                    error.pointee = FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                    return
                }
                let result = image.cubeData(dimension: cubeDimension)
                if let data = result.0 {
                    filter.setValue(data, forKey: key)
                    filterDelegate?.didUpdated(filter: filter)
                } else if let message = result.1 {
                    error.pointee = FlutterError(code: "core-image-filters", message: message, details: nil)
                }
            }
        }
    }
    
    func setNSStringParameter(_ filterId: NSNumber, _ key: String, _ value: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
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
        if targetClass == "NSObject" {
            if key == "inputColorSpace" {
                filter.setValue(value.toColorSpace(), forKey: key)
            }
        }
    }
    
    func disposeFilter(_ filterId: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        filters.removeValue(forKey: filterId.int64Value)
    }
    
}


extension CoreImageFilters {
    
    func exportData(_ filters: [NSNumber], _ format: String, _ context: String, _ value: [NSNumber]?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterStandardTypedData? {
        let filter = self[filters]
        guard !filter.isEmpty else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return nil
        }
        guard var image = filter.process(extent: value?.rect) else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
            return nil
        }
        
        let context = CIContext.selectImageContext(context)
        let colorSpace = context.currentColorSpace
        if format == "png" {
            if let data = context.pngRepresentation(of: image, format: CIFormat.RGBA8, colorSpace: image.colorSpace ?? colorSpace) {
                return FlutterStandardTypedData(bytes: data)
            } else {
                error.pointee = FlutterError(code: "core-image-filters", message: "Failed to create PNG data", details: nil)
            }
        } else if format == "jpeg" {
            if let data = context.jpegRepresentation(of: image, colorSpace: image.colorSpace ?? colorSpace,
                                                     options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0]) {
                return FlutterStandardTypedData(bytes: data)
            } else {
                error.pointee = FlutterError(code: "core-image-filters", message: "Failed to create JPEG data", details: nil)
            }
        } else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
        }
        
        return nil
        
    }
    
    func exportImageFile(_ filters: [NSNumber], _ path: String, _ format: String, _ context: String, _ value: [NSNumber]?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        let flutterError = error
        let filter = self[filters]
        guard !filter.isEmpty else {
            flutterError.pointee = FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
            return
        }
        guard var image = filter.process(extent: value?.rect) else {
            flutterError.pointee = FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
            return
        }
        
        let context = CIContext.selectImageContext(context)
        let colorSpace = context.currentColorSpace
        if format == "png" {
            do {
                try context.writePNGRepresentation(of: image, to: URL(fileURLWithPath: path), format: CIFormat.RGBA8, colorSpace: image.colorSpace ?? colorSpace)
            } catch {
                flutterError.pointee = FlutterError(code: "core-image-filters", message: "Failed to create PNG data", details: error)
            }
        } else if format == "jpeg" {
            do {
                try context.writeJPEGRepresentation(of: image, to: URL(fileURLWithPath: path), colorSpace: image.colorSpace ?? colorSpace,
                                                    options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0])
            } catch {
                flutterError.pointee = FlutterError(code: "core-image-filters", message: "Failed to create JEPG data", details: error)
            }
        } else {
            error.pointee = FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
        }
    }
    func exportVideoFile(_ filters: [NSNumber], _ asset: NSNumber, _ input: String, _ output: String, _ format: String, _ context: String, _ preset: String, _ period: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        let filter = self[filters]
        guard !filter.isEmpty else {
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
            let output = filter.process(source: source, extent: request.sourceImage.extent)
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
        eventChannel.setStreamHandler(AVAssetExportSessionStreamHandler(session: exporter, withTimeInterval: period.doubleValue))
        return NSNumber(value: exportId)
        
    }
    
}

class AVAssetExportSessionStreamHandler: NSObject, FlutterStreamHandler {
    private let session: AVAssetExportSession
    private var eventSink: FlutterEventSink?
    private var timer: Timer?
    private let timeInterval: TimeInterval
    
    init(session: AVAssetExportSession, withTimeInterval timeInterval: Double) {
        self.session = session
        self.timeInterval = timeInterval / 1000.0
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: updateProgess(_:))
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
