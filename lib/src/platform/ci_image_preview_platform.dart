part of '../../flutter_core_image_filters.dart';

abstract class CIImagePreviewPlatform extends PlatformInterface {
  /// Constructs a ImagePreviewPlatform.
  CIImagePreviewPlatform() : super(token: _token);

  static final Object _token = Object();

  static CIImagePreviewPlatform _instance = CIImagePreviewPlatformStub();

  /// The default instance of [CIImagePreviewPlatform] to use.
  ///
  /// Defaults to [CIImagePreviewPlatformStub].
  static CIImagePreviewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CIImagePreviewPlatform] when
  /// they register themselves.
  static set instance(CIImagePreviewPlatform instance) {
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

  Future<void> setData(int textureId, Uint8List data) {
    throw UnimplementedError('setData() has not been implemented.');
  }

  Future<void> setOutput(int textureId, List<double> rect) {
    throw UnimplementedError('setOutput() has not been implemented.');
  }

  Future<void> dispose(int textureId) {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}

class CIImagePreviewPlatformStub extends CIImagePreviewPlatform {}
