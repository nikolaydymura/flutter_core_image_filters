//
//  CIFilter+utils.m
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 28.05.2025.
//

#import "./include/flutter_core_image_filters_objc/CIFilterUtils.h"
#import <CoreImage/CoreImage.h>

@implementation CIFilter (Utils)

static NSMutableDictionary<NSNumber *, CIFilter*> *_pool = nil;
static id<CIFilterDelegate> _delegate;
static id<FlutterPluginRegistrar> _registrar;

+ (void)setDelegate:(id<CIFilterDelegate>)delegate {
    _delegate = delegate;
}

+ (id<CIFilterDelegate>)delegate {
    return _delegate;
}

+ (void)setRegistrar:(id<FlutterPluginRegistrar>)registrar {
    _registrar = registrar;
}

+ (id<FlutterPluginRegistrar>)registrar {
    return _registrar;
}

+(nullable CIFilter*)fromPool:(int64_t)key {
    if (!_pool) {
        return nil;
    }
    return [_pool objectForKey:@(key)];
}

-(int64_t)bindToPool{
    if (!_pool) {
        _pool = [NSMutableDictionary dictionary];
    }
    NSNumber *nextId = nil;
    
    for (NSNumber *key in _pool) {
        if (nextId == nil || [key longLongValue] > [nextId longLongValue]) {
            nextId = key;
        }
    }
    if (nextId) {
        nextId = @1;
    } else {
        nextId = @(nextId.longLongValue + 1);
    }
    [_pool setObject:self forKey:nextId];
    return nextId.longLongValue;
}

-(void)unbindFromPool{
    if (!_pool) {
        return;
    }
    NSArray *keysToRemove = [_pool.allKeys filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id key, NSDictionary *bindings) {
        return [bindings[key] isEqual: self];
    }]];
    
    // Remove keys
    for (id key in keysToRemove) {
        [_pool removeObjectForKey:key];
    }
}

- (void)setNSNumberValue:(nonnull NSNumber *)value forKey:(nonnull NSString *)key {
    [self setValue:value forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void)setNSStringValue:(nonnull NSString *)value forKey:(nonnull NSString *)key {
    if ([key isEqualToString: @"inputColorSpace"]) {
        //[self setValue: value.toColorSpace() forKey:key];
    }
    [self setValue:value forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void)setCIColorValue:(nonnull CIColor *)value forKey:(nonnull NSString *)key {
    [self setValue:value forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void)setCGAffineTransformValue:(CGAffineTransform)value forKey:(NSString *)key{
#if TARGET_OS_IOS
    [self setValue:[NSValue valueWithCGAffineTransform:value] forKey:key];
#else
    [self setValue:[NSValue valueWithBytes:&value objCType:@encode(CGAffineTransform)] forKey:key];
#endif
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void)setCIVectorFromCGPointValue:(CGPoint)value forKey:(NSString *)key {
    [self setValue:[CIVector vectorWithCGPoint:value] forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void)setCIVectorFromCGRectValue:(CGRect)value forKey:(NSString *)key {
    [self setValue:[CIVector vectorWithCGRect:value] forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void)setCIVectorFromNSArray:(NSArray*)value forKey:(NSString *)key {
    NSUInteger count = value.count;
    CGFloat values[count];
    
    for (NSUInteger i = 0; i < count; i++) {
        NSNumber *number = value[i];
        values[i] = [number floatValue];
    }
    [self setValue:[CIVector vectorWithValues:values count:count] forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void) setCIVectorFromArray:(CGFloat *)value count:(NSUInteger)count forKey:(NSString *)key {
    
}

- (void) setCIImageDataValue:(NSData *)value forKey:(NSString *)key{
    CIImage *ciImage = [CIImage imageWithData: value];
    if (ciImage) {
        [self setValue:ciImage forKey:key];
    }
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}
-(void) setCIImageFileValue:(NSString *)value forKey:(NSString *)key {
    NSURL* url = [NSURL fileURLWithPath:value];
    CIImage *ciImage = [CIImage imageWithContentsOfURL: url];
    if (ciImage) {
        [self setValue:ciImage forKey:key];
    }
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void) setCIImageAssetValue:(NSString *)value forKey:(NSString *)key {
#if TARGET_OS_IOS
    NSString *assetKey = [_registrar lookupKeyForAsset: value];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:assetKey ofType:nil];
    if (filePath) {
        [self setCIImageFileValue:filePath forKey:key];
    }
#endif
}
- (void) setNSDataValue:(NSData *)value forKey:(NSString *)key{
    [self setValue:value forKey:key];
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}
-(void) setNSDataFileValue:(NSString *)value forKey:(NSString *)key {
    NSData *data = [NSData dataWithContentsOfFile:value];
    if (data) {
        [self setValue:data forKey:key];
    }
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}

- (void) setNSDataAssetValue:(NSString *)value forKey:(NSString *)key {
#if TARGET_OS_IOS
    NSString *assetKey = [_registrar lookupKeyForAsset: value];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:assetKey ofType:nil];
    if (filePath) {
        [self setNSDataFileValue:filePath forKey:key];
    }
#endif
}

- (void) setCIImageCubeDataValue:(NSData *)value withSize: (NSNumber*) size andWithColumns: (NSNumber*) columns andWithRows: (NSNumber*) rows forKey: (NSString *)key {
    
}

- (void) setCIImageCubeFileValue:(NSString *)value withSize: (NSNumber*) size andWithColumns: (NSNumber*) columns andWithRows: (NSNumber*) rows forKey: (NSString *)key {
    NSURL* url = [NSURL fileURLWithPath:value];
    CIImage *ciImage = [CIImage imageWithContentsOfURL: url];
    NSNumber* cubeDimension = [self valueForKey: @"inputCubeDimension"];
    if (cubeDimension){
        if (ciImage) {
            if (rows.intValue == columns.intValue) {
                //CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                //[ciImage cubeDataExport:cubeDimension colorSpace:colorSpace];
                //CGColorSpaceRelease(colorSpace);
            }
            [self setValue:ciImage forKey:key];
        }
    }
    if (_delegate) {
        [_delegate filterDidUpdated:self];
    }
}
- (void) setCIImageCubeAssetValue:(NSString *)value withSize: (NSNumber*) size andWithColumns: (NSNumber*) columns andWithRows: (NSNumber*) rows forKey: (NSString *)key {
#if TARGET_OS_IOS
    NSString *assetKey = [_registrar lookupKeyForAsset: value];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:assetKey ofType:nil];
    if (filePath) {
        [self setCIImageCubeFileValue:filePath withSize:size andWithColumns:columns andWithRows:rows forKey:key];
    }
#endif
}
@end


@interface NSString (ColorSpace)

- (CGColorSpaceRef)toColorSpace;

@end

@implementation NSString (ColorSpace)

- (CGColorSpaceRef)toColorSpace {
    if ([self isEqualToString:@"genericCMYK"]) {
        return CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK);
    } else if ([self isEqualToString:@"displayP3"]) {
        return CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
    } /*else if ([self isEqualToString:@"genericRGBLinear"]) {
       return CGColorSpaceCreateWithName(kCGColorSpaceLinearRGB);
       } */else if ([self isEqualToString:@"adobeRGB1998"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceAdobeRGB1998);
       } else if ([self isEqualToString:@"sRGB"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
       } else if ([self isEqualToString:@"genericGrayGamma2_2"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceGenericGrayGamma2_2);
       } else if ([self isEqualToString:@"genericXYZ"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceGenericXYZ);
       } else if ([self isEqualToString:@"genericLab"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceGenericLab);
       } else if ([self isEqualToString:@"acescgLinear"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceITUR_709); // Note: no "acescgLinear" constant, use closest
       } else if ([self isEqualToString:@"itur_709"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceITUR_709);
       } else if ([self isEqualToString:@"itur_2020"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceITUR_2020);
       } else if ([self isEqualToString:@"rommrgb"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceROMMRGB);
       } else if ([self isEqualToString:@"dcip3"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
       } else if ([self isEqualToString:@"extendedLinearITUR_2020"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearITUR_2020);
       } else if ([self isEqualToString:@"extendedLinearDisplayP3"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearDisplayP3);
       } else if ([self isEqualToString:@"displayP3_HLG"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3_HLG);
       } else if ([self isEqualToString:@"extendedSRGB"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
       } else if ([self isEqualToString:@"linearSRGB"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
       } else if ([self isEqualToString:@"extendedLinearSRGB"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearSRGB);
       } else if ([self isEqualToString:@"extendedGray"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceExtendedGray);
       } else if ([self isEqualToString:@"linearGray"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceLinearGray);
       } else if ([self isEqualToString:@"extendedLinearGray"]) {
           return CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearGray);
       } else {
           return NULL;
       }
}

@end
