import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIHighlightShadowAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _highlightAmount;
  final NumberParameter _radius;
  final NumberParameter _shadowAmount;

  CIHighlightShadowAdjustConfiguration()
      : _highlightAmount = SliderNSNumberParameter(
          'inputHighlightAmount',
          'HighlightAmount',
          1,
          min: 0.3,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          0,
          min: 0,
          max: 10,
        ),
        _shadowAmount = SliderNSNumberParameter(
          'inputShadowAmount',
          'ShadowAmount',
          0,
          min: -1,
          max: 1,
        ),
        super('CIHighlightShadowAdjust');

  set highlightAmount(double value) {
    _highlightAmount.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set shadowAmount(double value) {
    _shadowAmount.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_highlightAmount, _radius, _shadowAmount];
}
