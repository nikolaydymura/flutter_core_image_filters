import Cocoa
import FlutterMacOS

public class CoreImageFiltersPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
        CILookupTableFilterRegister.register()
        let filtersApi = CoreImageFilters(registrar: registrar)
        let imagePreview = ImagePreview(registrar: registrar, filters: filtersApi)

        filtersApi.filterDelegate = imagePreview
        FLTFilterApiSetup(registrar.messenger, filtersApi)
        FLTImagePreviewApiSetup(registrar.messenger, imagePreview)
  }
}
