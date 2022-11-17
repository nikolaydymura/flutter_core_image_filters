import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIMorphologyRectangleMinimumConfiguration extends CIFilterConfiguration {
  final NumberParameter _height;
  final NumberParameter _width;

  CIMorphologyRectangleMinimumConfiguration()
      : _height = SliderNSNumberParameter(
          'inputHeight',
          'Height',
          5,
          min: 1,
          max: 49,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          5,
          min: 1,
          max: 49,
        ),
        super('CIMorphologyRectangleMinimum');

  set height(double value) {
    _height.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_height, _width];
}
