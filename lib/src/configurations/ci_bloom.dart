import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIBloomConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  CIBloomConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 0,
          max: 100,
        ),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          0.5,
          min: 0,
          max: 1,
        ),
        super('CIBloom');

  set radius(double value) {
    _radius.value = value;
  }

  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius, _intensity];
}
