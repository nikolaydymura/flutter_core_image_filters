import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'ci_filter_configuration.dart';

class CIDisparityToDepthConfiguration extends CIFilterConfiguration {
  CIDisparityToDepthConfiguration() : super('CIDisparityToDepth');
  @override
  List<ConfigurationParameter> get parameters => [];
}
