#import "CoreImageFiltersPlugin.h"
#if __has_include(<core_image_filters/core_image_filters-Swift.h>)
#import <core_image_filters/core_image_filters-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "core_image_filters-Swift.h"
#endif

@implementation CoreImageFiltersPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCoreImageFiltersPlugin registerWithRegistrar:registrar];
}
@end
