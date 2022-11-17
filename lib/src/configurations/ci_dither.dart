import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIDitherConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  CIDitherConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.1,
          min: 0,
          max: 1,
        ),
        super('CIDither');

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
