import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIShadedMaterialConfiguration extends CIFilterConfiguration {
  final NumberParameter _scale;

  CIShadedMaterialConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          10,
          min: 0.5,
          max: 200,
        ),
        super('CIShadedMaterial');

  set scale(double value) {
    _scale.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scale];
}
