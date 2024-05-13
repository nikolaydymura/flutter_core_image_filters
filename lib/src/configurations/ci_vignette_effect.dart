part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a vignette-effect filter.
///
/// * [falloff] updates the `inputFalloff` value of filter.
/// * [intensity] updates the `inputIntensity` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIVignetteEffect](https://developer.apple.com/documentation/coreimage/civignetteeffect), which
///    defines the exact information for filter.
class CIVignetteEffectConfiguration extends CIFilterConfiguration {
  final NumberParameter _falloff;
  final NumberParameter _intensity;
  final PointParameter _center;
  final NumberParameter _radius;

  /// Create a [CIVignetteEffectConfiguration] with default values.
  CIVignetteEffectConfiguration()
      : _falloff = SliderNSNumberParameter(
          'inputFalloff',
          'Falloff',
          0.5,
          min: 0,
          max: 1,
        ),
        _intensity = SliderNSNumberParameter(
          'inputIntensity',
          'Intensity',
          1,
          min: -1,
          max: 1,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0,
          max: 2000,
        ),
        super('CIVignetteEffect');

  /// The falloff of the effect.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `1.0`.
  set falloff(double value) {
    _falloff.value = value;
  }

  /// The intensity of the effect.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `-1.0` to `1.0`.
  set intensity(double value) {
    _intensity.value = value;
  }

  /// The center of the effect as x and y coordinates.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The distance from the center of the effect.
  ///
  /// Defaults to `150.0`.
  ///
  /// Range: `0.0` to `2000.0`.
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
  List<ConfigurationParameter> get parameters =>
      [_falloff, _intensity, _center, _radius];
}
