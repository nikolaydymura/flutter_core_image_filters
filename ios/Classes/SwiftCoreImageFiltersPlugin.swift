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
      let channel = FlutterMethodChannel(name: "core_image_filters", binaryMessenger: registrar.messenger())
        let instance = SwiftCoreImageFiltersPlugin(registrar: registrar)
      registrar.addMethodCallDelegate(instance, channel: channel)
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
            guard let imageSource = imageSources[textureId],
                  let filter = filters[filterId] else {
                result(FlutterError.init())
                return
            }
            imageSource.filter = filter
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
