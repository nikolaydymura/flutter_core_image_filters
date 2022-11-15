import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'ci_filter_configuration.dart';

class CIDepthToDisparityConfiguration extends CIFilterConfiguration {
  CIDepthToDisparityConfiguration() : super('CIDepthToDisparity');
  @override
  List<ConfigurationParameter> get parameters => [];
}
