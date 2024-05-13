part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a sepia-tone filter.
///
/// * [intensity] updates the `inputIntensity` value of filter.
///
/// See also:
///
///  * [CISepiaTone](https://developer.apple.com/documentation/coreimage/cisepiatone), which
///    defines the exact information for filter.
class CISepiaToneConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;

  /// Create a [CISepiaToneConfiguration] with default values.
  CISepiaToneConfiguration()
      : _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: 0,
          max: 1,
        ),
        super('CISepiaTone');

  /// The intensity of the sepia effect.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };

  @override
  List<ConfigurationParameter> get parameters => [_intensity];
}
