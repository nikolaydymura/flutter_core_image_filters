import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIMixConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;

  CIMixConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          1,
          min: 0,
          max: 1,
        ),
        super('CIMix');

  set amount(double value) {
    _amount.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_amount];
}
