import 'dart:async';

import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

class SliderNSNumberParameter extends RangeNumberParameter {
  SliderNSNumberParameter(
    super.name,
    super.displayName,
    super.value, {
    super.min,
    super.max,
  });

  @override
  FutureOr<void> update(FilterConfiguration configuration) {}
}
