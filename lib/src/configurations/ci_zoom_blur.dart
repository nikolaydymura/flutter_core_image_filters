part of flutter_core_image_filters;

class CIZoomBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;
  final PointParameter _center;

  CIZoomBlurConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          20,
          min: -200,
          max: 200,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIZoomBlur');

  set amount(double value) {
    _amount.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.stillImage,
        CICategory.video,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_amount, _center];
}
