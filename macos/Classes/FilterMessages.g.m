// Copyright 2022
// Autogenerated from Pigeon (v4.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "FilterMessages.g.h"
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



NSObject<FlutterMessageCodec> *FLTFilterApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  sSharedObject = [FlutterStandardMessageCodec sharedInstance];
  return sSharedObject;
}

void FLTFilterApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTFilterApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.FilterApi.create"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(createFilter:error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(createFilter:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_name = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        NSNumber *output = [api createFilter:arg_name error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.exportData"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(exportData: : : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(exportData: : : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_format = GetNullableObjectAtIndex(args, 1);
        NSString *arg_context = GetNullableObjectAtIndex(args, 2);
        NSArray<NSNumber *> *arg_value = GetNullableObjectAtIndex(args, 3);
        FlutterError *error;
        FlutterStandardTypedData *output = [api exportData:arg_filterId  :arg_format  :arg_context  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.exportImageFile"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(exportImageFile: : : : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(exportImageFile: : : : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_path = GetNullableObjectAtIndex(args, 1);
        NSString *arg_format = GetNullableObjectAtIndex(args, 2);
        NSString *arg_context = GetNullableObjectAtIndex(args, 3);
        NSArray<NSNumber *> *arg_value = GetNullableObjectAtIndex(args, 4);
        FlutterError *error;
        [api exportImageFile:arg_filterId  :arg_path  :arg_format  :arg_context  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.exportVideoFile"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(exportVideoFile: : : : : : : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(exportVideoFile: : : : : : : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSNumber *arg_asset = GetNullableObjectAtIndex(args, 1);
        NSString *arg_input = GetNullableObjectAtIndex(args, 2);
        NSString *arg_output = GetNullableObjectAtIndex(args, 3);
        NSString *arg_format = GetNullableObjectAtIndex(args, 4);
        NSString *arg_context = GetNullableObjectAtIndex(args, 5);
        NSString *arg_preset = GetNullableObjectAtIndex(args, 6);
        NSNumber *arg_period = GetNullableObjectAtIndex(args, 7);
        FlutterError *error;
        NSNumber *output = [api exportVideoFile:arg_filterId  :arg_asset  :arg_input  :arg_output  :arg_format  :arg_context  :arg_preset  :arg_period error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setInputData"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setInputData: :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setInputData: :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        FlutterStandardTypedData *arg_data = GetNullableObjectAtIndex(args, 1);
        FlutterError *error;
        [api setInputData:arg_filterId  :arg_data error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setInputAsset"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setInputAsset: :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setInputAsset: :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_path = GetNullableObjectAtIndex(args, 1);
        FlutterError *error;
        [api setInputAsset:arg_filterId  :arg_path error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setInputFile"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setInputFile: :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setInputFile: :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_path = GetNullableObjectAtIndex(args, 1);
        FlutterError *error;
        [api setInputFile:arg_filterId  :arg_path error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setNSNumberParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setNSNumberParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setNSNumberParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSNumber *arg_value = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setNSNumberParameter:arg_filterId  :arg_key  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setCIColorParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setCIColorParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setCIColorParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSArray<NSNumber *> *arg_value = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setCIColorParameter:arg_filterId  :arg_key  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setNSValueParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setNSValueParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setNSValueParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSArray<NSNumber *> *arg_value = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setNSValueParameter:arg_filterId  :arg_key  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setCIVectorParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setCIVectorParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setCIVectorParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSArray<NSNumber *> *arg_value = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setCIVectorParameter:arg_filterId  :arg_key  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setCIImageDataParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setCIImageDataParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setCIImageDataParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        FlutterStandardTypedData *arg_data = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setCIImageDataParameter:arg_filterId  :arg_key  :arg_data error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setCIImageSourceParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setCIImageSourceParameter: : : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setCIImageSourceParameter: : : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSNumber *arg_asset = GetNullableObjectAtIndex(args, 2);
        NSString *arg_path = GetNullableObjectAtIndex(args, 3);
        FlutterError *error;
        [api setCIImageSourceParameter:arg_filterId  :arg_key  :arg_asset  :arg_path error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setNSDataParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setNSDataParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setNSDataParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        FlutterStandardTypedData *arg_data = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setNSDataParameter:arg_filterId  :arg_key  :arg_data error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setNSDataSourceParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setNSDataSourceParameter: : : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setNSDataSourceParameter: : : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSNumber *arg_asset = GetNullableObjectAtIndex(args, 2);
        NSString *arg_path = GetNullableObjectAtIndex(args, 3);
        FlutterError *error;
        [api setNSDataSourceParameter:arg_filterId  :arg_key  :arg_asset  :arg_path error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.setNSStringParameter"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setNSStringParameter: : :error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(setNSStringParameter: : :error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        NSString *arg_key = GetNullableObjectAtIndex(args, 1);
        NSString *arg_value = GetNullableObjectAtIndex(args, 2);
        FlutterError *error;
        [api setNSStringParameter:arg_filterId  :arg_key  :arg_value error:&error];
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
        initWithName:@"dev.flutter.pigeon.FilterApi.dispose"
        binaryMessenger:binaryMessenger
        codec:FLTFilterApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(disposeFilter:error:)], @"FLTFilterApi api (%@) doesn't respond to @selector(disposeFilter:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_filterId = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api disposeFilter:arg_filterId error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
