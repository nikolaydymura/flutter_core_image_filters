import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIStraightenFilterConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;

  CIStraightenFilterConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          3.141592653589793,
          min: 0,
          max: 6.283185307179586,
        ),
        super('CIStraightenFilter');

  set angle(double value) {
    _angle.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_angle];
}
