import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIAztecCodeGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _compactStyle;
  final NumberParameter _correctionLevel;
  final NumberParameter _layers;

  CIAztecCodeGeneratorConfiguration()
      : _compactStyle = SliderNSNumberParameter(
          'inputCompactStyle',
          'CompactStyle',
          0,
          min: 0,
          max: 1,
        ),
        _correctionLevel = SliderNSNumberParameter(
          'inputCorrectionLevel',
          'CorrectionLevel',
          23,
          min: 5,
          max: 95,
        ),
        _layers = SliderNSNumberParameter(
          'inputLayers',
          'Layers',
          1,
          min: 1,
          max: 32,
        ),
        super('CIAztecCodeGenerator');

  set compactStyle(double value) {
    _compactStyle.value = value;
  }

  set correctionLevel(double value) {
    _correctionLevel.value = value;
  }

  set layers(double value) {
    _layers.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_compactStyle, _correctionLevel, _layers];
}
