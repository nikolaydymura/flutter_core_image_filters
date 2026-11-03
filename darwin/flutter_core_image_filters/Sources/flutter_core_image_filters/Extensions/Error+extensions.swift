import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

extension FlutterError: Error {}

extension FlutterPluginRegistrar {
    func lookupURL(forAsset asset: String) throws -> URL {
        let assetKey = lookupKey(forAsset: asset)
        #if os(iOS)
        guard let path = Bundle.main.path(forResource: assetKey, ofType: nil) else {
            throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
        }
        return URL(fileURLWithPath: path)
        #else
        guard let frameworkBundle = Bundle.main.privateFrameworksURL?
            .appendingPathComponent("App.framework") else {
            throw FlutterError(code: "core-image-filters", message: "Framework not found", details: nil)
        }
        let appBundle = Bundle(url: frameworkBundle)
        let normalizedPath = assetKey.components(separatedBy: "/")
            .drop(while: { $0 !=  "flutter_assets" }).joined(separator: "/")
        let resource = normalizedPath.components(separatedBy: "/").last?.components(separatedBy: ".").first
        let ext = normalizedPath.components(separatedBy: "/").last?.components(separatedBy: ".").last
        let subdirectory = normalizedPath.components(separatedBy: "/")
            .dropLast().joined(separator: "/")
        guard let url = appBundle?.url(forResource: resource, withExtension: ext, subdirectory: subdirectory) else {
            throw FlutterError(code: "core-image-filters", message: "Asset not found", details: nil)
        }
        return url
        #endif
    }
}
