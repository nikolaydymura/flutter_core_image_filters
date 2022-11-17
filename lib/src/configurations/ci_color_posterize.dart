import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIColorPosterizeConfiguration extends CIFilterConfiguration {
  final NumberParameter _levels;

  CIColorPosterizeConfiguration()
      : _levels = SliderNSNumberParameter(
          'inputLevels',
          'Levels',
          6,
          min: 2,
          max: 30,
        ),
        super('CIColorPosterize');

  set levels(double value) {
    _levels.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_levels];
}
