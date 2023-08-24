// Copyright 2022
// Autogenerated from Pigeon (v10.1.6), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN


/// The codec used by FLTFilterApi.
NSObject<FlutterMessageCodec> *FLTFilterApiGetCodec(void);

@protocol FLTFilterApi
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)createFilter:(NSString *)name error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable FlutterStandardTypedData *)exportData:(NSNumber *)filterId  :(NSString *)format  :(NSString *)context  :(nullable NSArray<NSNumber *> *)value error:(FlutterError *_Nullable *_Nonnull)error;
- (void)exportImageFile:(NSNumber *)filterId  :(NSString *)path  :(NSString *)format  :(NSString *)context  :(nullable NSArray<NSNumber *> *)value error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)exportVideoFile:(NSNumber *)filterId  :(NSNumber *)asset  :(NSString *)input  :(NSString *)output  :(NSString *)format  :(NSString *)context  :(NSString *)preset  :(NSNumber *)period error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setInputData:(NSNumber *)filterId  :(FlutterStandardTypedData *)data error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setInputAsset:(NSNumber *)filterId  :(NSString *)path error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setInputFile:(NSNumber *)filterId  :(NSString *)path error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setNSNumberParameter:(NSNumber *)filterId  :(NSString *)key  :(NSNumber *)value error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setCIColorParameter:(NSNumber *)filterId  :(NSString *)key  :(NSArray<NSNumber *> *)value error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setNSValueParameter:(NSNumber *)filterId  :(NSString *)key  :(NSArray<NSNumber *> *)value error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setCIVectorParameter:(NSNumber *)filterId  :(NSString *)key  :(NSArray<NSNumber *> *)value error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setCIImageDataParameter:(NSNumber *)filterId  :(NSString *)key  :(FlutterStandardTypedData *)data error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setCIImageSourceParameter:(NSNumber *)filterId  :(NSString *)key  :(NSNumber *)asset  :(NSString *)path error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setNSDataParameter:(NSNumber *)filterId  :(NSString *)key  :(FlutterStandardTypedData *)data error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setNSDataSourceParameter:(NSNumber *)filterId  :(NSString *)key  :(NSNumber *)asset  :(NSString *)path error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setNSStringParameter:(NSNumber *)filterId  :(NSString *)key  :(NSString *)value error:(FlutterError *_Nullable *_Nonnull)error;
- (void)disposeFilter:(NSNumber *)filterId error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void FLTFilterApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTFilterApi> *_Nullable api);

NS_ASSUME_NONNULL_END
