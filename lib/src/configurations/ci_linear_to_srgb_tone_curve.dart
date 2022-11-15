import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'ci_filter_configuration.dart';

class CILinearToSRGBToneCurveConfiguration extends CIFilterConfiguration {
  CILinearToSRGBToneCurveConfiguration() : super('CILinearToSRGBToneCurve');
  @override
  List<ConfigurationParameter> get parameters => [];
}
