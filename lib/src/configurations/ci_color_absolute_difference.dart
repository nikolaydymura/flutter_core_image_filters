import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'ci_filter_configuration.dart';

class CIColorAbsoluteDifferenceConfiguration extends CIFilterConfiguration {
  CIColorAbsoluteDifferenceConfiguration() : super('CIColorAbsoluteDifference');
  @override
  List<ConfigurationParameter> get parameters => [];
}
