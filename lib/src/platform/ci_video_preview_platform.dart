part of '../../flutter_core_image_filters.dart';

abstract class CIVideoPreviewPlatform extends PlatformInterface {
  /// Constructs a VideoPreviewPlatform.
  CIVideoPreviewPlatform() : super(token: _token);

  static final Object _token = Object();

  static CIVideoPreviewPlatform _instance = CIVideoPreviewPlatformStub();

  /// The default instance of [CIVideoPreviewPlatform] to use.
  ///
  /// Defaults to [CIVideoPreviewPlatformStub].
  static CIVideoPreviewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CIVideoPreviewPlatform] when
  /// they register themselves.
  static set instance(CIVideoPreviewPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> create() {
    throw UnimplementedError('create() has not been implemented.');
  }

  Future<void> connect(int textureId, int filterId, String context) {
    throw UnimplementedError('connect() has not been implemented.');
  }

  Future<void> disconnect(int textureId) {
    throw UnimplementedError('disconnect() has not been implemented.');
  }

  Future<void> setSource(int textureId, String path, [bool asset = false]) {
    throw UnimplementedError('setSource() has not been implemented.');
  }

  Future<void> resume(int textureId) {
    throw UnimplementedError('resume() has not been implemented.');
  }

  Future<void> pause(int textureId) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  Future<void> dispose(int textureId) {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}

class CIVideoPreviewPlatformStub extends CIVideoPreviewPlatform {}
