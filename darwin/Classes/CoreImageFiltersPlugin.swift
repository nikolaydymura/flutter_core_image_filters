#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
import Cocoa
#else
#error("Unsupported platform.")
#endif

public class CoreImageFiltersPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
        CILookupTableFilterRegister.register()
        CISquareLookupTableFilterRegister.register()
        CIColorCubeWithIntensityFilterRegister.register()
        let filtersApi = CoreImageFilters(registrar: registrar)
        let imagePreview = ImagePreview(registrar: registrar, filters: filtersApi)
        let videoPreview = VideoPreview(registrar: registrar, filters: filtersApi)

        filtersApi.filterDelegate = imagePreview
        #if os(iOS)
        FilterApiSetup.setUp(binaryMessenger: registrar.messenger(), api: filtersApi)
        ImagePreviewApiSetup.setUp(binaryMessenger: registrar.messenger(), api: imagePreview)
        VideoPreviewApiSetup.setUp(binaryMessenger: registrar.messenger(), api: videoPreview)
        #elseif os(macOS)
        FilterApiSetup.setUp(binaryMessenger: registrar.messenger, api: filtersApi)
        ImagePreviewApiSetup.setUp(binaryMessenger: registrar.messenger, api: imagePreview)
        VideoPreviewApiSetup.setUp(binaryMessenger: registrar.messenger, api: videoPreview)
        #else
        #error("Unsupported platform.")
        #endif
  }
}
