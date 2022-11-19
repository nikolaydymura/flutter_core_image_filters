import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIVignetteConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIVignetteConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0,
          min: -1,
          max: 1,
        ),
        super('CIVignette');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
