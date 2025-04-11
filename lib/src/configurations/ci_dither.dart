part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a dither filter.
///
/// * [intensity] updates the `inputIntensity` value of filter.
///
/// See also:
///
///  * [CIDither](https://developer.apple.com/documentation/coreimage/cidither), which
///    defines the exact information for filter.
class CIDitherConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  /// Create a [CIDitherConfiguration] with default values.
  CIDitherConfiguration()
    : _intensity = SliderNSNumberParameter(
        'inputIntensity',
        'Intensity',
        0.1,
        min: 0,
        max: 5,
      ),
      super('CIDither');

  /// The intensity of the effect.
  ///
  /// Defaults to `0.1`.
  ///
  /// Range: `0.0` to `5.0`.
  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.colorEffect,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
