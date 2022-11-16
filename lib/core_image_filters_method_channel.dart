import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core_image_filters_platform_interface.dart';

/// An implementation of [CoreImageFiltersPlatform] that uses method channels.
class MethodChannelCoreImageFilters extends CoreImageFiltersPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_image_filters');

  @override
  Future<int> prepareFilter(String name) async {
    final filterId =
        await methodChannel.invokeMethod<int>('prepareFilter', name);
    if (filterId == null) {
      throw NullThrownError();
    }
    return filterId;
  }

  @override
  Future<void> disposeFilter(int id) async {
    await methodChannel.invokeMethod<int>('disposeFilter', id);
  }

  @override
  Future<void> updateParameter(int id, String name, dynamic value) async {
    await methodChannel.invokeMethod<int>('updateParameter', [id, name, value]);
  }
}

/// An implementation of [CoreImageFiltersPlatform] that uses method channels.
class MethodChannelCoreImagePreview extends CoreImagePreviewsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_image_previews');

  @override
  Future<int> createPreview({bool video = false}) async {
    final textureId = await methodChannel
        .invokeMethod<int>(video ? 'createVideoPreview' : 'createImagePreview');
    if (textureId == null) {
      throw NullThrownError();
    }
    return textureId;
  }

  @override
  Future<void> setPreviewAsset(
    int textureId,
    String asset, {
    bool video = false,
  }) async {
    await methodChannel.invokeMethod(
      video ? 'setVideoPreviewAsset' : 'setImagePreviewAsset',
      [textureId, asset],
    );
  }

  @override
  Future<void> setPreviewData(
    int textureId,
    Uint8List data, {
    bool video = false,
  }) async {
    await methodChannel.invokeMethod(
      video ? 'setVideoPreviewData' : 'setImagePreviewData',
      [textureId, data],
    );
  }

  @override
  Future<void> setPreviewFile(
    int textureId,
    File file, {
    bool video = false,
  }) async {
    await methodChannel.invokeMethod(
      video ? 'setVideoPreviewFile' : 'setImagePreviewFile',
      [textureId, file.absolute.path],
    );
  }

  @override
  Future<void> setPreviewConfiguration(
    int textureId,
    int filterId, {
    bool video = false,
  }) async {
    await methodChannel.invokeMethod(
      video ? 'setVideoPreviewConfiguration' : 'setImagePreviewConfiguration',
      [textureId, filterId],
    );
  }

  @override
  Future<void> resumePreview(int textureId, {bool video = false}) async {
    if (video) {
      await methodChannel.invokeMethod(
        'resumeVideoPreview',
        textureId,
      );
    }
  }

  @override
  Future<void> pausePreview(int textureId, {bool video = false}) async {
    if (video) {
      await methodChannel.invokeMethod(
        'pauseVideoPreview',
        textureId,
      );
    }
  }

  @override
  Future<void> destroyPreview(int textureId, {bool video = false}) async {
    await methodChannel.invokeMethod(
      video ? 'destroyVideoPreview' : 'destroyImagePreview',
      textureId,
    );
  }
}
