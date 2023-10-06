part of flutter_core_image_filters;

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
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_amount];
}
