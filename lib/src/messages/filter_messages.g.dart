// Copyright 2022
// Autogenerated from Pigeon (v25.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class FilterApi {
  /// Constructor for [FilterApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FilterApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : pigeonVar_binaryMessenger = binaryMessenger,
       pigeonVar_messageChannelSuffix =
           messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<int> create(String name) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.create$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[name],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as int?)!;
    }
  }

  Future<Uint8List> exportData(
    List<int> filters,
    String format,
    String context,
    List<double>? value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.exportData$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filters, format, context, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as Uint8List?)!;
    }
  }

  Future<void> exportImageFile(
    List<int> filters,
    String path,
    String format,
    String context,
    List<double>? value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.exportImageFile$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filters, path, format, context, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<int> exportVideoFile(
    List<int> filters,
    bool asset,
    String input,
    String output,
    String format,
    String context,
    String preset,
    double period,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.exportVideoFile$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filters, asset, input, output, format, context, preset, period],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as int?)!;
    }
  }

  Future<void> setInputData(int filterId, Uint8List data) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setInputData$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, data],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setInputAsset(int filterId, String path) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setInputAsset$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, path],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setInputFile(int filterId, String path) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setInputFile$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, path],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setNSNumberParameter(
    int filterId,
    String key,
    double value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setNSNumberParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setCIColorParameter(
    int filterId,
    String key,
    List<double> value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setCIColorParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setNSValueParameter(
    int filterId,
    String key,
    List<double> value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setNSValueParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setCIVectorParameter(
    int filterId,
    String key,
    List<double> value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setCIVectorParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setCIImageDataParameter(
    int filterId,
    String key,
    Uint8List data,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setCIImageDataParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, data],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setCIImageSourceParameter(
    int filterId,
    String key,
    bool asset,
    String path,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setCIImageSourceParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, asset, path],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setCIImageCubeDataParameter(
    int filterId,
    String key,
    Uint8List data,
    int size,
    int columns,
    int rows,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setCIImageCubeDataParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, data, size, columns, rows],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setCIImageCubeSourceParameter(
    int filterId,
    String key,
    bool asset,
    String path,
    int size,
    int columns,
    int rows,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setCIImageCubeSourceParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, asset, path, size, columns, rows],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setNSDataParameter(
    int filterId,
    String key,
    Uint8List data,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setNSDataParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, data],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setNSDataSourceParameter(
    int filterId,
    String key,
    bool asset,
    String path,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setNSDataSourceParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, asset, path],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setNSStringParameter(
    int filterId,
    String key,
    String value,
  ) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.setNSStringParameter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId, key, value],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> dispose(int filterId) async {
    final String pigeonVar_channelName =
        'dev.flutter.pigeon.flutter_core_image_filters.FilterApi.dispose$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel =
        BasicMessageChannel<Object?>(
          pigeonVar_channelName,
          pigeonChannelCodec,
          binaryMessenger: pigeonVar_binaryMessenger,
        );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(
      <Object?>[filterId],
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }
}
