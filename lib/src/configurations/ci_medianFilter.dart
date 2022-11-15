import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import '../../flutter_core_image_filters.dart';

class CIMedianFilterConfiguration extends CIFilterConfiguration {
  CIMedianFilterConfiguration() : super('CIMedianFilter');
  @override
  List<ConfigurationParameter> get parameters => [];
}
