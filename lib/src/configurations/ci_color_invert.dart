import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'ci_filter_configuration.dart';

class CIColorInvertConfiguration extends CIFilterConfiguration {
  CIColorInvertConfiguration() : super('CIColorInvert');
  @override
  List<ConfigurationParameter> get parameters => [];
}
