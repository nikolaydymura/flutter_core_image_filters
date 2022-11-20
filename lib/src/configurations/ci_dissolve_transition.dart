import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIDissolveTransitionConfiguration extends CIFilterConfiguration {
  final NumberParameter _time;

  CIDissolveTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        super('CIDissolveTransition');

  set time(double value) {
    _time.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_time];
}
