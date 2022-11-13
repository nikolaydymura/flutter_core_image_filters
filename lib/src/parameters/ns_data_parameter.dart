import 'dart:async';

import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

class NSDataParameter extends DataParameter {
  NSDataParameter(super.name, super.displayName);

  @override
  FutureOr<void> update(FilterConfiguration configuration) {}
}
