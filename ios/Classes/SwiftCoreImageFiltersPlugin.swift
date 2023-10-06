import Flutter

public class SwiftCoreImageFiltersPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        CILookupTableFilterRegister.register()
        CISquareLookupTableFilterRegister.register()
        let filtersApi = CoreImageFilters(registrar: registrar)
        let imagePreview = ImagePreview(registrar: registrar, filters: filtersApi)
        let videoPreview = VideoPreview(registrar: registrar, filters: filtersApi)

        filtersApi.filterDelegate = imagePreview
        FilterApiSetup.setUp(binaryMessenger: registrar.messenger(), api: filtersApi)
        ImagePreviewApiSetup.setUp(binaryMessenger: registrar.messenger(), api: imagePreview)
        VideoPreviewApiSetup.setUp(binaryMessenger: registrar.messenger(), api: videoPreview)
    }
}
