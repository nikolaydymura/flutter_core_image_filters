import 'dart:async';

import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

class CIColorParameter extends ColorParameter {
  CIColorParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(FilterConfiguration configuration) {
  }
}
