import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIMotionBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _angle;

  CIMotionBlurConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          20,
          min: 0,
          max: 100,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIMotionBlur');

  set radius(double value) {
    _radius.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius, _angle];
}
