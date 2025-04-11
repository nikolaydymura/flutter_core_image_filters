part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a bloom filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [intensity] updates the `inputIntensity` value of filter.
///
/// See also:
///
///  * [CIBloom](https://developer.apple.com/documentation/coreimage/cibloom), which
///    defines the exact information for filter.
class CIBloomConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  /// Create a [CIBloomConfiguration] with default values.
  CIBloomConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        10,
        min: 0,
        max: 100,
      ),
      _intensity = SliderNSNumberParameter(
        'inputIntensity',
        'Intensity',
        0.5,
        min: 0,
        max: 1,
      ),
      super('CIBloom');

  /// The radius, in pixels, of the effect.
  ///
  /// Defaults to `10.0`.
  ///
  /// This value ranges from `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The intensity of the effect.
  ///
  /// Defaults to `0.5`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set intensity(double value) {
    _intensity.value = value;
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
  List<ConfigurationParameter> get parameters => [_radius, _intensity];
}
