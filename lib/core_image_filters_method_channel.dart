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
