part of flutter_core_image_filters;

class CIDocumentEnhancerConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;

  CIDocumentEnhancerConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          1,
          min: 0,
          max: 10,
        ),
        super('CIDocumentEnhancer');

  set amount(double value) {
    _amount.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_amount];
}
