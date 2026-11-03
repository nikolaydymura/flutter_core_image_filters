#ifndef FLUTTERUTILS_H
#define FLUTTERUTILS_H

#ifdef __OBJC__
//
//  FlutterUtils.h
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 03.11.2026.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IOS
#import <Flutter/Flutter.h>
#else
#import <FlutterMacOS/FlutterMacOS.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Utils)
- (nullable NSURL*)lookupURLForAsset:(NSString*)asset
                               error:(FlutterError * _Nullable __autoreleasing * _Nullable)error;
@end

NS_ASSUME_NONNULL_END

#endif /* __OBJC__ */

#endif /* FLUTTERUTILS_H*/
