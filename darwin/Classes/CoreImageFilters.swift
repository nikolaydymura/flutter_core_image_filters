//
//  CoreImageFilters.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import AVFoundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

extension CIFilter {
    var originImage: CIImage? {
        if inputKeys.contains(kCIInputImageKey) {
           return value(forKey: kCIInputImageKey) as? CIImage
        }
        return nil
    }
}

extension [Double] {
    var rect: CGRect {
        CGRect(x: self[0],
               y: self[1],
               width: self[2],
               height: self[3])
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
    
    func copy() -> [CIFilter]{
        return map {
            var parameters: [String: Any] = [:]
            for key in $0.inputKeys.filter({ $0 != kCIInputImageKey }) {
                if let v = $0.value(forKey: key) {
                    parameters[key] = v
                }
            }
            return CIFilter(name: $0.name, parameters: parameters)
        }.compactMap { $0 }
    }
}

protocol FiltersLocator {
    subscript (ids: [Int64]) -> [CIFilter] { get }
}

protocol FilterDelegate {
    func didUpdated(filter: CIFilter)
}

class CoreImageFilters: NSObject, FilterApi, FiltersLocator {
    private var filters: [Int64: CIFilter] = [:]
    private var filterSequenceId: Int64 = 0
    private var exporterSequenceId: Int64 = 0
    private let registrar: FlutterPluginRegistrar
    var filterDelegate: FilterDelegate?
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
    }
    
    subscript(ids: [Int64]) -> [CIFilter] {
        return filters.filter { e in
            ids.contains(e.key)
        }.map { $0.value }
    }
    
    func createFilter(_ name: String) throws -> Int64 {
        let filterId = filterSequenceId
        filterSequenceId += 1
        filters[filterId] = CIFilter(name: name)
        return filterId
    }
    
    func setInputData(_ filterId: Int64, _ data: FlutterStandardTypedData) throws {
        return try setCIImageDataParameter(filterId, kCIInputImageKey, data)
    }
    
    func setInputAsset(_ filterId: Int64, _ path: String) throws {
        return try setCIImageSourceParameter(filterId, kCIInputImageKey, true, path)
    }
    
    func setInputFile(_ filterId: Int64, _ path: String) throws {
        return try setCIImageSourceParameter(filterId, kCIInputImageKey, false, path)
    }
    
    func setNSNumberParameter(_ filterId: Int64, _ key: String, _ value: Double) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "NSNumber" {
            filter.setValue(value, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    
    func setCIColorParameter(_ filterId: Int64, _ key: String, _ value: [Double]) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "CIColor" {
            let color = CIColor(red: CGFloat(value[0]),
                                green: CGFloat(value[1]),
                                blue: CGFloat(value[2]),
                                alpha: CGFloat(value[3]))
            filter.setValue(color, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setCIVectorParameter(_ filterId: Int64, _ key: String, _ value: [Double]) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "CIVector" {
            let values = value.map { CGFloat($0) }
            let vector = CIVector(values: values, count: values.count)
            filter.setValue(vector, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setNSValueParameter(_ filterId: Int64, _ key: String, _ value: [Double]) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "CGAffineTransform" {
            let values = value.map { CGFloat($0) }
            let transform = CGAffineTransform(a: values[0], b: values[1], c: values[2], d: values[3], tx: values[4], ty: values[5])
            filter.setValue(transform, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setCIImageDataParameter(_ filterId: Int64, _ key: String, _ data: FlutterStandardTypedData) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "CIImage" {
            guard let image = CIImage(data: data.data) else {
                throw FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
            }
            filter.setValue(image, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setCIImageSourceParameter(_ filterId: Int64, _ key: String, _ asset: Bool, _ path: String) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "CIImage" {
            if asset {
#if os(iOS)
                let assetKey = registrar.lookupKey(forAsset: path)
                
                guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                    throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
                }
                guard let image = CIImage(contentsOf: URL(fileURLWithPath: filePath)) else {
                    throw FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                }
                filter.setValue(image, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
#endif
            } else {
                guard let image = CIImage(contentsOf: URL(fileURLWithPath: path)) else {
                    throw FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
                }
                filter.setValue(image, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            }
        }
    }
    
    func setNSDataParameter(_ filterId: Int64, _ key: String, _ data: FlutterStandardTypedData) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "NSData" {
            filter.setValue(data.data, forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setNSDataSourceParameter(_ filterId: Int64, _ key: String, _ asset: Bool, _ path: String) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "NSData" {
            var fileURL = URL(fileURLWithPath: path)
            if asset {
#if os(iOS)
                let assetKey = registrar.lookupKey(forAsset: path)
                
                guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                    throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
                }
                fileURL = URL(fileURLWithPath: filePath)
#endif
            }
            filter.setValue(try? Data(contentsOf: fileURL), forKey: key)
            filterDelegate?.didUpdated(filter: filter)
        }
    }
    
    func setCIImageCubeDataParameter(_ filterId: Int64, _ key: String, _ data: FlutterStandardTypedData, _ size: Int64, _ columns: Int64, _ rows: Int64) throws {
        
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        guard targetClass == "NSData" else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not match", details: nil)
        }
        
        guard let cubeDimension = filter.value(forKey: "inputCubeDimension") as? Int else {
            throw FlutterError(code: "core-image-filters", message: "Cube Dimension must be defined", details: nil)
        }
        
        guard let image = CIImage(data: data.data) else {
            throw FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
        }
        if rows == columns {
            let result = image.cubeData(dimension: cubeDimension, colorSpace: CGColorSpaceCreateDeviceRGB())
            if let data = result.0 {
                filter.setValue(data, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            } else if let message = result.1 {
                throw FlutterError(code: "core-image-filters", message: message, details: nil)
            }
        } else if rows == 64 && columns == 8 {
            let result = image.cubeData(dimension: cubeDimension)
            if let data = result.0 {
                filter.setValue(data, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            } else if let message = result.1 {
                throw FlutterError(code: "core-image-filters", message: message, details: nil)
            }
        }
    }
    
    func setCIImageCubeSourceParameter(_ filterId: Int64, _ key: String, _ asset: Bool, _ path: String, _ size: Int64, _ columns: Int64, _ rows: Int64) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        guard targetClass == "NSData" else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not match", details: nil)
        }

        guard let cubeDimension = filter.value(forKey: "inputCubeDimension") as? Int else {
            throw FlutterError(code: "core-image-filters", message: "Cube Dimension must be defined", details: nil)
        }
        var fileURL = URL(fileURLWithPath: path)
        if asset {
#if os(iOS)
            let assetKey = registrar.lookupKey(forAsset: path)
            
            guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
            }
            fileURL = URL(fileURLWithPath: filePath)
#endif
        }
        guard let image = CIImage(contentsOf: fileURL) else {
            throw FlutterError(code: "core-image-filters", message: "Image failed", details: nil)
        }
        if rows == columns {
            let result = image.cubeData(dimension: cubeDimension,
                                        colorSpace: image.colorSpace ?? CGColorSpaceCreateDeviceRGB())
            if let data = result.0 {
                filter.setValue(data, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            } else if let message = result.1 {
                throw FlutterError(code: "core-image-filters", message: message, details: nil)
            }
        } else if rows == 64 && columns == 8 {
            let result = image.cubeData(dimension: cubeDimension)
            if let data = result.0 {
                filter.setValue(data, forKey: key)
                filterDelegate?.didUpdated(filter: filter)
            } else if let message = result.1 {
                throw FlutterError(code: "core-image-filters", message: message, details: nil)
            }
        }
    }
    
    func setNSStringParameter(_ filterId: Int64, _ key: String, _ value: String) throws {
        guard let filter = filters[filterId] else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
            throw FlutterError(code: "core-image-filters", message: "Attribute not present: \(key)", details: nil)
        }
        guard let targetClass = attributes[kCIAttributeClass] as? String else {
            throw FlutterError(code: "core-image-filters", message: "Attribute class not found", details: nil)
        }
        if targetClass == "NSObject" {
            if key == "inputColorSpace" {
                filter.setValue(value.toColorSpace(), forKey: key)
            }
        }
    }
    
    func disposeFilter(_ filterId: Int64) throws {
        filters.removeValue(forKey: filterId)
    }
    
}


extension CoreImageFilters {
    
    func exportData(_ filters: [Int64], _ format: String, _ context: String, _ value: [Double]?) throws -> FlutterStandardTypedData {
        let filter = self[filters]
        guard !filter.isEmpty else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let image = filter.process(extent: value?.rect) else {
            throw FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
        }
        
        let context = CIContext.selectImageContext(context)
        let colorSpace = context.currentColorSpace
        if format == "png" {
            if let data = context.pngRepresentation(of: image, format: CIFormat.RGBA8, colorSpace: image.colorSpace ?? colorSpace) {
                return FlutterStandardTypedData(bytes: data)
            } else {
                throw FlutterError(code: "core-image-filters", message: "Failed to create PNG data", details: nil)
            }
        } else if format == "jpeg" {
            if let data = context.jpegRepresentation(of: image, colorSpace: image.colorSpace ?? colorSpace,
                                                     options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0]) {
                return FlutterStandardTypedData(bytes: data)
            } else {
                throw FlutterError(code: "core-image-filters", message: "Failed to create JPEG data", details: nil)
            }
        }
        
        throw FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
        
    }
    
    func exportImageFile(_ filters: [Int64], _ path: String, _ format: String, _ context: String, _ value: [Double]?) throws {
        let filter = self[filters]
        guard !filter.isEmpty else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        guard let image = filter.process(extent: value?.rect) else {
            throw FlutterError(code: "core-image-filters", message: "Output image failed", details: nil)
        }
        
        let context = CIContext.selectImageContext(context)
        let colorSpace = context.currentColorSpace
        if format == "png" {
            do {
                try context.writePNGRepresentation(of: image, to: URL(fileURLWithPath: path), format: CIFormat.RGBA8, colorSpace: image.colorSpace ?? colorSpace)
            } catch {
                throw FlutterError(code: "core-image-filters", message: "Failed to create PNG data", details: error)
            }
        } else if format == "jpeg" {
            do {
                try context.writeJPEGRepresentation(of: image, to: URL(fileURLWithPath: path), colorSpace: image.colorSpace ?? colorSpace,
                                                    options: [CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 1.0])
            } catch {
                throw FlutterError(code: "core-image-filters", message: "Failed to create JEPG data", details: error)
            }
        } else {
            throw FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
        }
    }
    
    func exportVideoFile(_ filters: [Int64], _ asset: Bool, _ input: String, _ output: String, _ format: String, _ context: String, _ preset: String, _ period: Double) throws -> Int64 {
        let filter = self[filters].copy()
        guard !filter.isEmpty else {
            throw FlutterError(code: "core-image-filters", message: "Filter not found", details: nil)
        }
        var path = input
        if asset {
#if os(iOS)
            let assetKey = registrar.lookupKey(forAsset: path)
            
            guard let filePath = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
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
            throw FlutterError(code: "core-image-filters", message: "Invalid exporter", details: nil)
        }
        
        exporter.videoComposition = videoComposition
        exporter.outputURL = URL(fileURLWithPath: output)
        
        if format == "mp4" {
            exporter.outputFileType = .mp4
        } else if format == "mov" {
            exporter.outputFileType = .mov
        } else {
            throw FlutterError(code: "core-image-filters", message: "Output format not supported", details: nil)
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
        eventChannel.setStreamHandler(AVAssetExportSessionStreamHandler(session: exporter,  withTimeInterval: period))
        return exportId
        
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
        DispatchQueue.main.async { [weak self] in
            if self?.session.error == nil && self?.session.status == .completed {
                self?.eventSink?(-100.0)
            } else {
                let message = String(describing: self?.session.error)
                self?.eventSink?(FlutterError.init(code: "core-image-filters",
                                                   message: message,
                                                   details: nil))
            }
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
