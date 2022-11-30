import Flutter
import UIKit
import Accelerate
import AVFoundation

protocol FiltersLocator {
    subscript (id: Int64) -> CIFilter? { get }
}

public class SwiftCoreImageFiltersPlugin: NSObject, FlutterPlugin, FiltersLocator {
    subscript(id: Int64) -> CIFilter? {
        return filters[id]
    }
    
    private var filters: [Int64: CIFilter] = [:]
    private var filterSequenceId: Int64 = 0
    private let registry: FlutterTextureRegistry
    private let registrar: FlutterPluginRegistrar
    private var imagePreview: ImagePreview!
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
        self.registry = registrar.textures()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        CILookupTableFilterRegister.register()
        let instance = SwiftCoreImageFiltersPlugin(registrar: registrar)
        instance.imagePreview = ImagePreview(registrar: registrar, filters: instance)
        
        let videoPreview = VideoPreview(registrar: registrar, filters: instance)
        
        let channel = FlutterMethodChannel(name: "core_image_filters", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: channel)
        FLTImagePreviewApiSetup(registrar.messenger(), instance.imagePreview)
        FLTVideoPreviewApiSetup(registrar.messenger(), videoPreview)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "prepareFilter":
            guard let name = call.arguments as? String else {
                result(FlutterError.init())
                return
            }
            let filterId = filterSequenceId
            filterSequenceId += 1
            filters[filterId] = CIFilter(name: name)
            result(filterId)
        case "disposeFilter":
            guard let filterId = call.arguments as? Int64 else {
                result(FlutterError.init())
                return
            }
            filters.removeValue(forKey: filterId)
            result(nil)
        case "updateParameter":
            guard let arguments = call.arguments as? [Any],
                  let filterId = arguments[0] as? Int64,
                  let key = arguments[1] as? String else {
                result(FlutterError.init())
                return
            }
            guard let filter = filters[filterId] else {
                result(FlutterError.init())
                return
            }
            guard let attributes = filter.attributes[key] as? [AnyHashable: Any] else {
                result(FlutterError.init())
                return
            }
            guard let targetClass = attributes[kCIAttributeClass] as? String else {
                result(FlutterError.init())
                return
            }
            if targetClass == "NSData" {
                if let value = arguments[2] as? String {
                    let asset = registrar.lookupKey(forAsset: value)
                    
                    let path = Bundle.main.path(forResource: asset, ofType: nil) ?? value
                    
                    if key == "inputCubeData" {
                        let data = try? UIImage(contentsOfFile: path)?.colorCubeData(cubeDimension: 64)
                        updateFilterValue(filter, value: data, forKey: key)
                    } else {
                        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
                        updateFilterValue(filter, value: data, forKey: key)
                    }
                } else if let value = arguments[2] as? FlutterStandardTypedData {
                    if key == "inputCubeData" {
                        let data = try? UIImage(data: value.data)?.colorCubeData(cubeDimension: 64)
                        updateFilterValue(filter, value: data, forKey: key)
                    } else {
                        updateFilterValue(filter, value: value.data, forKey: key)
                    }
                }
                result(nil)
                return
            }
            if targetClass == "CIImage" {
                if let value = arguments[2] as? String {
                    let asset = registrar.lookupKey(forAsset: value)
                    
                    let path = Bundle.main.path(forResource: asset, ofType: nil) ?? value
                    
                    let image = CIImage(contentsOf: URL(fileURLWithPath: path))
                    updateFilterValue(filter, value: image, forKey: key)
                } else if let value = arguments[2] as? FlutterStandardTypedData {
                    let image = CIImage(data: value.data)
                    updateFilterValue(filter, value: image, forKey: key)
                }
                result(nil)
                return
            }
            if targetClass == "CIColor" {
                guard let value = arguments[2] as? [Double] else {
                    result(FlutterError.init())
                    return
                }
                let color = CIColor(red: value[0], green: value[1], blue: value[2])
                updateFilterValue(filter, value: color, forKey: key)
                result(nil)
                return
            }
            let value = arguments[2]
            updateFilterValue(filter, value: value, forKey: key)
            result(nil)
        default:
            result(FlutterError.init())
            
        }
        result("iOS " + UIDevice.current.systemVersion)
    }
    
    func updateFilterValue(_ filter: CIFilter, value: Any?, forKey key: String) {
        filter.setValue(value, forKey: key)
        imagePreview.textureFrameAvailable(filter: filter)
    }
}

extension UIImage {
    public enum ColorCubeError: Error {
        case incorrectImageSize
        case missingImageData
        case unableToCreateDataProvider
        case unableToGetBitmpaDataBuffer
    }
    
    public func colorCubeData(cubeDimension: Int) throws -> NSData {
        
        // Set up some variables for calculating memory size.
        let imageSize = size
        let dim = Int(imageSize.width)
        let pixels = dim * dim
        let channels = 4
        
        // If the number of pixels doesn't match what's needed for the supplied cube dimension, abort.
        guard pixels == cubeDimension * cubeDimension * cubeDimension else {
            throw ColorCubeError.incorrectImageSize
        }
        
        // We don't need a sizeof() because uint_8t is explicitly 1 byte.
        let memSize = pixels * channels
        
        // Get the UIImage's backing CGImageRef
        guard let img = cgImage else {
            throw ColorCubeError.missingImageData
        }
        
        // Get a reference to the CGImage's data provider.
        guard let inProvider = img.dataProvider else {
            throw ColorCubeError.unableToCreateDataProvider
        }
        
        let inBitmapData = inProvider.data
        guard let inBuffer = CFDataGetBytePtr(inBitmapData) else {
            throw ColorCubeError.missingImageData
        }
        
        // Calculate the size of the float buffer and allocate it.
        let floatSize = memSize *  MemoryLayout<Float>.size
        let finalBuffer = unsafeBitCast(malloc(floatSize), to: UnsafeMutablePointer<Float>.self)
        
        // Convert the uint_8t to float. Note: a uint of 255 will convert to 255.0f.
        vDSP_vfltu8(inBuffer, 1, finalBuffer, 1, UInt(memSize))
        
        // Divide each float by 255.0 to get the 0-1 range we are looking for.
        var divisor = Float(255.0)
        vDSP_vsdiv(finalBuffer, 1, &divisor, finalBuffer, 1, UInt(memSize))
        
        // Don't copy the bytes, just have the NSData take ownership of the buffer.
        let cubeData = NSData(bytesNoCopy: finalBuffer, length: floatSize, freeWhenDone: true)
        
        return cubeData
        
    }
}
