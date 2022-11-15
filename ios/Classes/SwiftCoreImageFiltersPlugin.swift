import Flutter
import UIKit

public class SwiftCoreImageFiltersPlugin: NSObject, FlutterPlugin {
    private var filters: [Int64: CIFilter] = [:]
    private var imageSources: [Int64: ImageSourceTexture] = [:]
    private var filterSequenceId: Int64 = 0
    private let registry: FlutterTextureRegistry
    private let registrar: FlutterPluginRegistrar
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar
        self.registry = registrar.textures()
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftCoreImageFiltersPlugin(registrar: registrar)
      let channel = FlutterMethodChannel(name: "core_image_filters", binaryMessenger: registrar.messenger())
      registrar.addMethodCallDelegate(instance, channel: channel)
        let channel1 = FlutterMethodChannel(name: "core_image_previews", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: channel1)
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
        case "createImagePreview":
            let source = ImageSourceTexture()
            let textureId = registry.register(source)
            imageSources[textureId] = source
            result(textureId)
        case "setImagePreviewAsset":
            guard let arguments = call.arguments as? [Any],
                  let textureId = arguments[0] as? Int64,
                  let asset = arguments[1] as? String else {
                result(FlutterError.init())
                return
            }
            guard let imageSource = imageSources[textureId] else {
                result(FlutterError.init())
                return
            }
            let assetKey = registrar.lookupKey(forAsset: asset)
                        
            guard let path = Bundle.main.path(forResource: assetKey, ofType: nil) else {
                result(FlutterError.init())
                return
            }
            guard let image = CIImage(contentsOf: URL(fileURLWithPath: path)) else {
                result(FlutterError.init())
                return
            }
            imageSource.image = image
            result(nil)
        case "setImagePreviewConfiguration":
            guard let arguments = call.arguments as? [Any],
                  let textureId = arguments[0] as? Int64,
                  let filterId = arguments[1] as? Int64 else {
                result(FlutterError.init())
                return
            }
            guard let imageSource = imageSources[textureId] else {
                result(FlutterError.init())
                return
            }
            
            guard filterId >= 0, let filter = filters[filterId] else {
                imageSource.filter = nil
                result(FlutterError.init())
                return
            }
            imageSource.filter = filter
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
            if targetClass == "CIColor" {
                guard let value = arguments[2] as? [Double] else {
                    result(FlutterError.init())
                    return
                }
                let color = CIColor(red: value[0], green: value[1], blue: value[2])
                filter.setValue(color, forKey: key)
                result(nil)
                return
            }
            let value = arguments[2]
            filter.setValue(value, forKey: key)
            result(nil)
        case "updatePreview":
            guard let textureId = call.arguments as? Int64 else {
                result(FlutterError.init())
                return
            }
            registry.textureFrameAvailable(textureId)
            result(nil)
        default:
            result(FlutterError.init())
            
        }
      result("iOS " + UIDevice.current.systemVersion)
    }

}

class ImageSourceTexture: NSObject, FlutterTexture {
    var image: CIImage?
    var filter: CIFilter?
    
    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let image = self.image else {
            return nil
        }
        var pixelBuffer: CVPixelBuffer?
        let attrs = [ kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
                     kCVPixelBufferIOSurfacePropertiesKey as String : [:]] as CFDictionary
        
        let width:Int = Int(image.extent.width)
        let height:Int = Int(image.extent.height)
        CVPixelBufferCreate(kCFAllocatorDefault,
                            width,
                            height,
                            kCVPixelFormatType_32BGRA,
                            attrs,
                            &pixelBuffer)
        
        if let buffer = pixelBuffer {
            let context = CIContext()
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
