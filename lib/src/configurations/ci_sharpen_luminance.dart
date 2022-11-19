import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CISharpenLuminanceConfiguration extends CIFilterConfiguration {
  final NumberParameter _sharpness;
  final NumberParameter _radius;

  CISharpenLuminanceConfiguration()
      : _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.4,
          min: 0,
          max: 2,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          1.69,
          min: 0,
          max: 20,
        ),
        super('CISharpenLuminance');

  set sharpness(double value) {
    _sharpness.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_sharpness, _radius];
}
