import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIDisplacementDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;

  CIDisplacementDistortionConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          50,
          min: 0,
          max: 200,
        ),
        super('CIDisplacementDistortion');

  set scale(double value) {
    _scale.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scale];
}
