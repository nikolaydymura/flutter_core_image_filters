import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIVibranceConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;

  CIVibranceConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          0,
          min: -1,
          max: 1,
        ),
        super('CIVibrance');

  set amount(double value) {
    _amount.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_amount];
}
