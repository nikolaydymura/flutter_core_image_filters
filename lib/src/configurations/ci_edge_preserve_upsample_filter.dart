import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIEdgePreserveUpsampleFilterConfiguration extends CIFilterConfiguration {
  final NumberParameter _lumaSigma;
  final NumberParameter _spatialSigma;

  CIEdgePreserveUpsampleFilterConfiguration()
      : _lumaSigma = SliderNSNumberParameter(
          'inputLumaSigma',
          'LumaSigma',
          0.15,
          min: 0,
          max: 1,
        ),
        _spatialSigma = SliderNSNumberParameter(
          'inputSpatialSigma',
          'SpatialSigma',
          3,
          min: 0,
          max: 5,
        ),
        super('CIEdgePreserveUpsampleFilter');

  set lumaSigma(double value) {
    _lumaSigma.value = value;
  }

  set spatialSigma(double value) {
    _spatialSigma.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_lumaSigma, _spatialSigma];
}
