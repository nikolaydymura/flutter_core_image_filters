part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a vibrance filter.
///
/// * [amount] updates the `inputAmount` value of filter.
///
/// See also:
///
///  * [CIVibrance](https://developer.apple.com/documentation/coreimage/civibrance), which
///    defines the exact information for filter.
class CIVibranceConfiguration extends CIFilterConfiguration {
  final NumberParameter _amount;

  /// Create a [CIVibranceConfiguration] with default values.
  CIVibranceConfiguration()
      : _amount = SliderNSNumberParameter(
          'inputAmount',
          'Amount',
          0,
          min: -1,
          max: 1,
        ),
        super('CIVibrance');

  /// The amount to adjust the saturation by.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-1.0` to `1.0`.
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
