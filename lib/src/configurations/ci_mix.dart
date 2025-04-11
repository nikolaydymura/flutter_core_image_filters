part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a mix filter.
///
/// * [amount] updates the `inputAmount` value of filter.
///
/// See also:
///
///  * [CIMix](https://developer.apple.com/documentation/coreimage/cimix), which
///    defines the exact information for filter.
class CIMixConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  final NumberParameter _amount;

  /// Create a [CIMixConfiguration] with default values.
  CIMixConfiguration()
    : _amount = SliderNSNumberParameter(
        'inputAmount',
        'Amount',
        1,
        min: 0,
        max: 1,
      ),
      super('CIMix');

  /// The amount of the effect.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.0`.
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
