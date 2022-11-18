import 'dart:io';
import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core_image_filters_method_channel.dart';

abstract class CoreImageFiltersPlatform extends PlatformInterface {
  /// Constructs a CoreImageFiltersPlatform.
  CoreImageFiltersPlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreImageFiltersPlatform _instance = MethodChannelCoreImageFilters();

  /// The default instance of [CoreImageFiltersPlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreImageFilters].
  static CoreImageFiltersPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreImageFiltersPlatform] when
  /// they register themselves.
  static set instance(CoreImageFiltersPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> prepareFilter(String name);

  Future<void> disposeFilter(int id);

  Future<void> updateParameter(int id, String name, dynamic value);
}

abstract class CoreImagePreviewsPlatform extends PlatformInterface {
  /// Constructs a CoreImageFiltersPlatform.
  CoreImagePreviewsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreImagePreviewsPlatform _instance = MethodChannelCoreImagePreview();

  /// The default instance of [CoreImageFiltersPlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreImageFilters].
  static CoreImagePreviewsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreImageFiltersPlatform] when
  /// they register themselves.
  static set instance(CoreImagePreviewsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> createPreview({bool video = false}) {
    throw UnimplementedError('createImageSource() has not been implemented.');
  }

  Future<void> setPreviewAsset(
    int textureId,
    String asset, {
    bool video = false,
  }) {
    throw UnimplementedError(
      'setImagePreviewAsset() has not been implemented.',
    );
  }

  Future<void> setPreviewFile(int textureId, File file, {bool video = false}) {
    throw UnimplementedError('setImagePreviewFile() has not been implemented.');
  }

  Future<void> setPreviewData(
    int textureId,
    Uint8List data, {
    bool video = false,
  }) {
    throw UnimplementedError('setImagePreviewData() has not been implemented.');
  }

  Future<void> setPreviewConfiguration(
    int textureId,
    int filterId, {
    bool video = false,
  });

  Future<void> destroyPreview(int textureId, {bool video = false});

  Future<void> pausePreview(int textureId, {bool video = false});

  Future<void> resumePreview(int textureId, {bool video = false});
}
