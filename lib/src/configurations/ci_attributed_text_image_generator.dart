import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIAttributedTextImageGeneratorConfiguration
    extends CIFilterConfiguration {
  final NumberParameter _scaleFactor;

  CIAttributedTextImageGeneratorConfiguration()
      : _scaleFactor = SliderNSNumberParameter(
          'inputScaleFactor',
          'ScaleFactor',
          50,
          min: 0,
          max: 200,
        ),
        super('CIAttributedTextImageGenerator');

  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scaleFactor];
}
