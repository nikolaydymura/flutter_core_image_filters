import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIPaletteCentroidConfiguration extends CIFilterConfiguration {
  final NumberParameter _perceptual;

  CIPaletteCentroidConfiguration()
      : _perceptual = SliderNSNumberParameter(
          'inputPerceptual',
          'Perceptual',
          0,
          min: 0,
          max: 1,
        ),
        super('CIPaletteCentroid');

  set perceptual(double value) {
    _perceptual.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_perceptual];
}
