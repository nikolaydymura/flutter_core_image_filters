part of '../../flutter_core_image_filters.dart';

abstract class CIFilterPlatform extends PlatformInterface {
  /// Constructs a ImagePreviewPlatform.
  CIFilterPlatform() : super(token: _token);

  static final Object _token = Object();

  static CIFilterPlatform _instance = CIFilterPlatformStub();

  /// The default instance of [CIFilterPlatform] to use.
  ///
  /// Defaults to [CIFilterPlatformStub].
  static CIFilterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CIFilterPlatform] when
  /// they register themselves.
  static set instance(CIFilterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> create(String name) {
    throw UnimplementedError('create() has not been implemented.');
  }

  Future<Uint8List> exportData(
    int filterId,
    String format,
    String context,
    List<double>? crop,
  ) {
    throw UnimplementedError('exportData() has not been implemented.');
  }

  Future<void> exportImageFile(
    int filterId,
    String path,
    String format,
    String context,
    List<double>? crop,
  ) {
    throw UnimplementedError('exportImageFile() has not been implemented.');
  }

  Future<int> exportVideoFile(
    int filterId,
    bool asset,
    String input,
    String output,
    String format,
    String context,
    String preset,
    int period,
  ) {
    throw UnimplementedError('exportVideoFile() has not been implemented.');
  }

  Future<void> setInputData(int filterId, Uint8List data) {
    throw UnimplementedError('setInputData() has not been implemented.');
  }

  Future<void> setInputAsset(int filterId, String path) {
    throw UnimplementedError('setInputAsset() has not been implemented.');
  }

  Future<void> setInputFile(int filterId, String path) {
    throw UnimplementedError('setInputFile() has not been implemented.');
  }

  Future<void> setNSNumberParameter(int filterId, String key, double value) {
    throw UnimplementedError(
      'setNSNumberParameter() has not been implemented.',
    );
  }

  Future<void> setCIColorParameter(
    int filterId,
    String key,
    List<double> value,
  ) {
    throw UnimplementedError('setCIColorParameter() has not been implemented.');
  }

  Future<void> setNSValueParameter(
    int filterId,
    String key,
    List<double> value,
  ) {
    throw UnimplementedError('setNSValueParameter() has not been implemented.');
  }

  Future<void> setCIVectorParameter(
    int filterId,
    String key,
    List<double> value,
  ) {
    throw UnimplementedError(
      'setCIVectorParameter() has not been implemented.',
    );
  }

  Future<void> setCIImageDataParameter(
    int filterId,
    String key,
    Uint8List data,
  ) {
    throw UnimplementedError(
      'setCIImageDataParameter() has not been implemented.',
    );
  }

  Future<void> setCIImageSourceParameter(
    int filterId,
    String key,
    bool asset,
    String path,
  ) {
    throw UnimplementedError(
      'setCIImageSourceParameter() has not been implemented.',
    );
  }

  Future<void> setNSDataParameter(int filterId, String key, Uint8List data) {
    throw UnimplementedError('setNSDataParameter() has not been implemented.');
  }

  Future<void> setNSDataSourceParameter(
    int filterId,
    String key,
    bool asset,
    String path,
  ) {
    throw UnimplementedError(
      'setNSDataSourceParameter() has not been implemented.',
    );
  }

  Future<void> setNSStringParameter(int filterId, String key, String value) {
    throw UnimplementedError(
      'setNSStringParameter() has not been implemented.',
    );
  }

  Future<void> dispose(int filterId) {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}

class CIFilterPlatformStub extends CIFilterPlatform {}
