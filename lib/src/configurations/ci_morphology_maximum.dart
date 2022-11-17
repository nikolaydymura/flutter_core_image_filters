import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIMorphologyMaximumConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  CIMorphologyMaximumConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          0,
          min: 0,
          max: 50,
        ),
        super('CIMorphologyMaximum');

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
