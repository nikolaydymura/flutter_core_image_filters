// Copyright 2022
// Autogenerated from Pigeon (v4.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "PreviewMessages.g.h"
#import <FlutterMacOS/FlutterMacOS.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface FLTSourcePreviewMessage ()
+ (FLTSourcePreviewMessage *)fromMap:(NSDictionary *)dict;
+ (nullable FLTSourcePreviewMessage *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface FLTDataPreviewMessage ()
+ (FLTDataPreviewMessage *)fromMap:(NSDictionary *)dict;
+ (nullable FLTDataPreviewMessage *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTSourcePreviewMessage
+ (instancetype)makeWithTextureId:(NSNumber *)textureId
    path:(NSString *)path
    asset:(NSNumber *)asset {
  FLTSourcePreviewMessage* pigeonResult = [[FLTSourcePreviewMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.path = path;
  pigeonResult.asset = asset;
  return pigeonResult;
}
+ (FLTSourcePreviewMessage *)fromMap:(NSDictionary *)dict {
  FLTSourcePreviewMessage *pigeonResult = [[FLTSourcePreviewMessage alloc] init];
  pigeonResult.textureId = GetNullableObject(dict, @"textureId");
  NSAssert(pigeonResult.textureId != nil, @"");
  pigeonResult.path = GetNullableObject(dict, @"path");
  NSAssert(pigeonResult.path != nil, @"");
  pigeonResult.asset = GetNullableObject(dict, @"asset");
  NSAssert(pigeonResult.asset != nil, @"");
  return pigeonResult;
}
+ (nullable FLTSourcePreviewMessage *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [FLTSourcePreviewMessage fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"textureId" : (self.textureId ?: [NSNull null]),
    @"path" : (self.path ?: [NSNull null]),
    @"asset" : (self.asset ?: [NSNull null]),
  };
}
@end

@implementation FLTDataPreviewMessage
+ (instancetype)makeWithTextureId:(NSNumber *)textureId
    data:(FlutterStandardTypedData *)data {
  FLTDataPreviewMessage* pigeonResult = [[FLTDataPreviewMessage alloc] init];
  pigeonResult.textureId = textureId;
  pigeonResult.data = data;
  return pigeonResult;
}
+ (FLTDataPreviewMessage *)fromMap:(NSDictionary *)dict {
  FLTDataPreviewMessage *pigeonResult = [[FLTDataPreviewMessage alloc] init];
  pigeonResult.textureId = GetNullableObject(dict, @"textureId");
  NSAssert(pigeonResult.textureId != nil, @"");
  pigeonResult.data = GetNullableObject(dict, @"data");
  NSAssert(pigeonResult.data != nil, @"");
  return pigeonResult;
}
+ (nullable FLTDataPreviewMessage *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [FLTDataPreviewMessage fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"textureId" : (self.textureId ?: [NSNull null]),
    @"data" : (self.data ?: [NSNull null]),
  };
}
@end

@interface FLTImagePreviewApiCodecReader : FlutterStandardReader
@end
@implementation FLTImagePreviewApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTDataPreviewMessage fromMap:[self readValue]];
    
    case 129:     
      return [FLTSourcePreviewMessage fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTImagePreviewApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTImagePreviewApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTDataPreviewMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[FLTSourcePreviewMessage class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTImagePreviewApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTImagePreviewApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTImagePreviewApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTImagePreviewApiCodecReader alloc] initWithData:data];
}
@end


NSObject<FlutterMessageCodec> *FLTImagePreviewApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FLTImagePreviewApiCodecReaderWriter *readerWriter = [[FLTImagePreviewApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void FLTImagePreviewApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTImagePreviewApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ImagePreviewApi.create"
        binaryMessenger:binaryMessenger
        codec:FLTImagePreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(create:)], @"FLTImagePreviewApi api (%@) doesn't respond to @selector(create:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSNumber *output = [api create:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ImagePreviewApi.connect"
        binaryMessenger:binaryMessenger
        codec:FLTImagePreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(connect: :error:)], @"FLTImagePreviewApi api (%@) doesn't respond to @selector(connect: :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 1);
        FlutterError *error;
        [api connect:arg_textureId  :arg_filterId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ImagePreviewApi.disconnect"
        binaryMessenger:binaryMessenger
        codec:FLTImagePreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(disconnect:error:)], @"FLTImagePreviewApi api (%@) doesn't respond to @selector(disconnect:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api disconnect:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ImagePreviewApi.setSource"
        binaryMessenger:binaryMessenger
        codec:FLTImagePreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setSource:error:)], @"FLTImagePreviewApi api (%@) doesn't respond to @selector(setSource:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTSourcePreviewMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setSource:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ImagePreviewApi.setData"
        binaryMessenger:binaryMessenger
        codec:FLTImagePreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setData:error:)], @"FLTImagePreviewApi api (%@) doesn't respond to @selector(setData:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTDataPreviewMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setData:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.ImagePreviewApi.dispose"
        binaryMessenger:binaryMessenger
        codec:FLTImagePreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(dispose:error:)], @"FLTImagePreviewApi api (%@) doesn't respond to @selector(dispose:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api dispose:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface FLTVideoPreviewApiCodecReader : FlutterStandardReader
@end
@implementation FLTVideoPreviewApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTSourcePreviewMessage fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTVideoPreviewApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTVideoPreviewApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTSourcePreviewMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTVideoPreviewApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTVideoPreviewApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTVideoPreviewApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTVideoPreviewApiCodecReader alloc] initWithData:data];
}
@end


NSObject<FlutterMessageCodec> *FLTVideoPreviewApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FLTVideoPreviewApiCodecReaderWriter *readerWriter = [[FLTVideoPreviewApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void FLTVideoPreviewApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTVideoPreviewApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.create"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(create:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(create:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSNumber *output = [api create:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.connect"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(connect: :error:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(connect: :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 1);
        FlutterError *error;
        [api connect:arg_textureId  :arg_filterId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.disconnect"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(disconnect:error:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(disconnect:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api disconnect:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.setSource"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setSource:error:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(setSource:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTSourcePreviewMessage *arg_msg = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api setSource:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.resume"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(resume:error:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(resume:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api resume:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.pause"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(pause:error:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(pause:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api pause:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.VideoPreviewApi.dispose"
        binaryMessenger:binaryMessenger
        codec:FLTVideoPreviewApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(dispose:error:)], @"FLTVideoPreviewApi api (%@) doesn't respond to @selector(dispose:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_textureId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api dispose:arg_textureId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
