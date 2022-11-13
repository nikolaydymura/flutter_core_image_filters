import 'dart:async';

import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import '../configurations/ci_filter_configuration.dart';

class NSNumberParameter extends NumberParameter {
  NSNumberParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) {
  }
}
