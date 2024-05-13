part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a glass distortion filter.
///
/// * [scale] updates the `inputScale` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIGlassDistortion](https://developer.apple.com/documentation/coreimage/ciglassdistortion), which
///    defines the exact information for filter.
class CIGlassDistortionConfiguration extends CIFilterConfiguration
    with TextureMixin {
  final NumberParameter _scale;
  final PointParameter _center;

  /// Create a [CIGlassDistortionConfiguration] with default values.
  CIGlassDistortionConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          200,
          min: 0.0,
          max: 500,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIGlassDistortion');

  /// The scale of the filter.
  ///
  /// Defaults to `200.0`.
  ///
  /// Range: `0.0` to `500.0`
  set scale(double value) {
    _scale.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.distortionEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_scale, _center, _texture];
}
