import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIEdgeWorkConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIEdgeWorkConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          3,
          min: 0,
          max: 20,
        ),
        super('CIEdgeWork');

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
