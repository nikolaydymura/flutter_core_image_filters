import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import '../../core_image_filters_platform_interface.dart';

abstract class CIFilterConfiguration extends FilterConfiguration {
  static final CoreImageFiltersPlatform api =
      CoreImageFiltersPlatform.instance;

  int? _filterId;
  int? textureId;
  final String name;

  bool get ready => _filterId != null;

  CIFilterConfiguration(this.name);

  Future<void> prepare() async {
    _filterId ??= await api.prepareFilter(name);
  }

  Future<void> dispose() async {
    final filterId = _filterId;
    if (filterId != null) {
      await api.disposeFilter(filterId);
    }
    _filterId = null;
  }
}
