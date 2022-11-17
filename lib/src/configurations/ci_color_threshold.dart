import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIColorThresholdConfiguration extends CIFilterConfiguration {
  final NumberParameter _threshold;

  CIColorThresholdConfiguration()
      : _threshold = SliderNSNumberParameter(
          'inputThreshold',
          'Threshold',
          0.5,
          min: 0,
          max: 1,
        ),
        super('CIColorThreshold');

  set threshold(double value) {
    _threshold.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_threshold];
}
