import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIExposureAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _eV;

  CIExposureAdjustConfiguration()
      : _eV = SliderNSNumberParameter(
          'inputEV',
          'EV',
          0,
          min: -10,
          max: 10,
        ),
        super('CIExposureAdjust');

  set eV(double value) {
    _eV.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_eV];
}
