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

  Future<int> prepareFilter(String name) {
    throw UnimplementedError('prepareFilter() has not been implemented.');
  }

  Future<void> disposeFilter(int id) {
    throw UnimplementedError('disposeFilter() has not been implemented.');
  }

  Future<int> createImageSource() {
    throw UnimplementedError('createImageSource() has not been implemented.');
  }
}
