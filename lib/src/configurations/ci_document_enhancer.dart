import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import '../parameters/slider_ns_number_parameter.dart';
import 'ci_filter_configuration.dart';

class CIDocumentEnhancerConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;

  CIDocumentEnhancerConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          1,
          min: 0,
          max: 2,
        ),
        super('CIDocumentEnhancer');

  set amount(double value) {
    _amount.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_amount];
}
