part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a zoom blur filter.
///
/// * [amount] updates the `inputAmount` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIZoomBlur](https://developer.apple.com/documentation/coreimage/cizoomblur), which
///    defines the exact information for filter.
class CIZoomBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;
  final PointParameter _center;

  /// Create a [CIZoomBlurConfiguration] with default values.
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

  ///The zoom-in amount.
  ///
  /// Defaults to `20.0`.
  ///
  /// Range: `-200.0` to `200.0`.
  set amount(double value) {
    _amount.value = value;
  }

  /// The center of the effect, as x and y coordinates.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.stillImage,
        CICategory.video,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_amount, _center];
}
