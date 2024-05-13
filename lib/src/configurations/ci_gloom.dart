part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a gloom filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [intensity] updates the `inputIntensity` value of filter.
///
/// See also:
///
///  * [CIGloom](https://developer.apple.com/documentation/coreimage/cigloom), which
///    defines the exact information for filter.
class CIGloomConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  /// Create a [CIGloomConfiguration] with default values.
  CIGloomConfiguration()
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
        super('CIGloom');

  /// The radius, in pixels, of the effect.
  ///
  /// Defaults to `10.0`.
  ///
  /// Range: `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The intensity of the effect.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `1.0`.
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
