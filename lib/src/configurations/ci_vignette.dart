part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a vignette filter.
///
/// * [intensity] updates the `inputIntensity` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIVignette](https://developer.apple.com/documentation/coreimage/civignette), which
///    defines the exact information for filter.
class CIVignetteConfiguration extends CIFilterConfiguration {
  final NumberParameter _intensity;
  final NumberParameter _radius;

  /// Create a [CIVignetteConfiguration] with default values.
  CIVignetteConfiguration()
    : _intensity = SliderNSNumberParameter(
        'inputIntensity',
        'Intensity',
        0,
        min: -1,
        max: 1,
      ),
      _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        1,
        min: 0,
        max: 2,
      ),
      super('CIVignette');

  /// The intensity of the effect.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-1.0` to `1.0`.
  set intensity(double value) {
    _intensity.value = value;
  }

  /// The distance from the center of the effect.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `2.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.colorEffect,
    CICategory.video,
    CICategory.interlaced,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [_intensity, _radius];
}
