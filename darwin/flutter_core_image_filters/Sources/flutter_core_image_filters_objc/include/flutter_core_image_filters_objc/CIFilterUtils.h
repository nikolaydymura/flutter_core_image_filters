#ifndef CIFILTERUTILS_H
#define CIFILTERUTILS_H

#ifdef __OBJC__
//
//  CIFilter+utils.h
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 28.05.2025.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IOS
#import <Flutter/Flutter.h>
#else
#import <FlutterMacOS/FlutterMacOS.h>
#endif
#import <CoreImage/CoreImage.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CIFilterDelegate <NSObject>
@optional
- (void)filterDidUpdated:(CIFilter *)filter;
@end

@interface CIFilter (Utils)

@property (class, nonatomic, weak) id<CIFilterDelegate> delegate;
@property (class, nonatomic, weak) id<FlutterPluginRegistrar> registrar;

+ (nullable CIFilter*)fromPool:(int64_t)key;
- (int64_t)bindToPool;
- (void)unbindFromPool;
- (void)setNSNumberValue:(NSNumber *)value forKey: (NSString *)key;
- (void)setNSStringValue:(NSString *)value forKey: (NSString *)key;
- (void)setCIColorValue:(CIColor *)value forKey: (NSString *)key;
- (void)setCGAffineTransformValue:(CGAffineTransform)value forKey: (NSString *)key;
- (void)setCIVectorFromCGRectValue:(CGRect)value forKey: (NSString *)key;
- (void)setCIVectorFromCGPointValue:(CGPoint)value forKey: (NSString *)key;
- (void)setCIVectorFromNSArray:(NSArray*)value forKey: (NSString *)key;
- (void)setCIVectorFromArray: (CGFloat*) value count:(NSUInteger) count forKey: (NSString *)key;
- (void)setCIImageDataValue:(NSData*)value forKey: (NSString *)key;
- (void)setCIImageFileValue:(NSString*)value forKey: (NSString *)key;
- (void)setCIImageAssetValue:(NSString*)value forKey: (NSString *)key;
- (void)setNSDataValue:(NSData*)value forKey: (NSString *)key;
- (void)setNSDataFileValue:(NSString*)value forKey: (NSString *)key;
- (void)setNSDataAssetValue:(NSString*)value forKey: (NSString *)key;
- (void)setCIImageCubeDataValue:(NSData*)value withSize: (NSNumber*) size andWithColumns: (NSNumber*) columns andWithRows: (NSNumber*) rows forKey: (NSString *)key;
- (void)setCIImageCubeFileValue:(NSString*)value withSize: (NSNumber*) size andWithColumns: (NSNumber*) columns andWithRows: (NSNumber*) rows forKey: (NSString *)key;
- (void)setCIImageCubeAssetValue:(NSString*)value withSize: (NSNumber*) size andWithColumns: (NSNumber*) columns andWithRows: (NSNumber*) rows forKey: (NSString *)key;

@end

NS_ASSUME_NONNULL_END

#endif /* __OBJC__ */

#endif /* CIFILTERUTILS_H*/
