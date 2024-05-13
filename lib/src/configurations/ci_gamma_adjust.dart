part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a gamma adjust filter.
///
/// * [power] updates the `inputPower` value of filter.
///
/// See also:
///
///  * [CIGammaAdjust](https://developer.apple.com/documentation/coreimage/cigammaadjust), which
///    defines the exact information for filter.
class CIGammaAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _power;

  /// Create a [CIGammaAdjustConfiguration] with default values.
  CIGammaAdjustConfiguration()
      : _power = SliderNSNumberParameter(
          'inputPower',
          'Power',
          1,
          min: 0.25,
          max: 4,
        ),
        super('CIGammaAdjust');

  /// A gamma value to use to correct image brightness.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.25` to `4.0`.
  set power(double value) {
    _power.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_power];
}
