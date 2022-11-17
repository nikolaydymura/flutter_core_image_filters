import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CINoiseReductionConfiguration extends CIFilterConfiguration {
  final NumberParameter _noiseLevel;
  final NumberParameter _sharpness;

  CINoiseReductionConfiguration()
      : _noiseLevel = SliderNSNumberParameter(
          'inputNoiseLevel',
          'NoiseLevel',
          0.02,
          min: 0,
          max: 0.1,
        ),
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.4,
          min: 0,
          max: 2,
        ),
        super('CINoiseReduction');

  set noiseLevel(double value) {
    _noiseLevel.value = value;
  }

  set sharpness(double value) {
    _sharpness.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_noiseLevel, _sharpness];
}
