part of '../../flutter_core_image_filters.dart';

class CIMixConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
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
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_amount, _backgroundImage];
}
