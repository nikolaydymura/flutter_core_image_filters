import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CICode128BarcodeGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _quietSpace;
  final NumberParameter _barcodeHeight;

  CICode128BarcodeGeneratorConfiguration()
      : _quietSpace = SliderNSNumberParameter(
          'inputQuietSpace',
          'QuietSpace',
          10,
          min: 0,
          max: 20,
        ),
        _barcodeHeight = SliderNSNumberParameter(
          'inputBarcodeHeight',
          'BarcodeHeight',
          32,
          min: 1,
          max: 50,
        ),
        super('CICode128BarcodeGenerator');

  set quietSpace(double value) {
    _quietSpace.value = value;
  }

  set barcodeHeight(double value) {
    _barcodeHeight.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_quietSpace, _barcodeHeight];
}
