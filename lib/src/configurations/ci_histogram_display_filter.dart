import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIHistogramDisplayFilterConfiguration extends CIFilterConfiguration {
  final NumberParameter _lowLimit;
  final NumberParameter _highLimit;
  final NumberParameter _height;

  CIHistogramDisplayFilterConfiguration()
      : _lowLimit = SliderNSNumberParameter(
          'inputLowLimit',
          'LowLimit',
          0,
          min: 0,
          max: 1,
        ),
        _highLimit = SliderNSNumberParameter(
          'inputAspectRatio',
          'AspectRatio',
          1,
          min: 0,
          max: 1,
        ),
        _height = SliderNSNumberParameter(
          'inputPitch',
          'Pitch',
          100,
          min: 1,
          max: 100,
        ),
        super('CIHistogramDisplayFilter');

  set lowLimit(double value) {
    _lowLimit.value = value;
  }

  set highLimit(double value) {
    _highLimit.value = value;
  }

  set height(double value) {
    _height.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_lowLimit, _highLimit, _height];
}
