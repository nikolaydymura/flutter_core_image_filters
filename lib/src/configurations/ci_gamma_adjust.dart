import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIGammaAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _power;

  CIGammaAdjustConfiguration()
      : _power = SliderNSNumberParameter(
          'inputPower',
          'Power',
          1,
          min: 0.25,
          max: 4,
        ),
        super('CIGammaAdjust');

  set power(double value) {
    _power.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_power];
}
