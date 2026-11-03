#import "./include/flutter_core_image_filters_objc/FlutterUtils.h"

@implementation NSObject (Utils)

- (nullable NSURL*)lookupURLForAsset:(NSString*)asset error:(FlutterError * _Nullable __autoreleasing * _Nullable)error {
    if ([self conformsToProtocol:@protocol(FlutterPluginRegistrar)]) {
        // Cast self to the protocol to safely access framework methods
        id<FlutterPluginRegistrar> registrar = (id<FlutterPluginRegistrar>)self;
        NSString *assetKey = [registrar lookupKeyForAsset:asset];

#if TARGET_OS_IOS
            NSString *path = [[NSBundle mainBundle] pathForResource:assetKey
                                                   ofType:nil];
    if (!path) {
        if (error) {
            *error = [FlutterError errorWithCode:@"core-image-filters"
                                        message:@"Asset not found"
                                        details:nil];
        }
        return nil;
    }

    return [NSURL fileURLWithPath:path];
#else
            NSURL *frameworksURL = [NSBundle mainBundle].privateFrameworksURL;
            if (!frameworksURL) {
                if (error) {
                    *error = [FlutterError errorWithCode:@"core-image-filters"
                                                 message:@"Framework not found"
                                                 details:nil];
                }
                return nil;
            }

            NSURL *frameworkURL =
                    [frameworksURL URLByAppendingPathComponent:@"App.framework"];
            NSBundle *appBundle = [NSBundle bundleWithURL:frameworkURL];

            NSArray<NSString *> *components =
                    [assetKey componentsSeparatedByString:@"/"];
            NSUInteger index = [components indexOfObject:@"flutter_assets"];

            NSString *normalizedPath = @"";
            if (index != NSNotFound) {
                normalizedPath = [[components subarrayWithRange:
                        NSMakeRange(index, components.count - index)]
                        componentsJoinedByString:@"/"];
            }

            NSString *filename = normalizedPath.lastPathComponent;
            NSString *resource = filename.stringByDeletingPathExtension;
            NSString *extension = filename.pathExtension;
            NSString *subdirectory = normalizedPath.stringByDeletingLastPathComponent;

            NSURL *url = [appBundle URLForResource:resource
                                     withExtension:extension
                                      subdirectory:subdirectory];

            if (!url && error) {
                *error = [FlutterError errorWithCode:@"core-image-filters"
                                             message:@"Asset not found"
                                             details:nil];
            }

            return url;
#endif
    }
    return nil;
}

@end
