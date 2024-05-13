part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a circle splash distortion filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CICircleSplashDistortion](https://developer.apple.com/documentation/coreimage/cicirclesplashdistortion), which
///    defines the exact information for filter.
class CICircleSplashDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

  /// Create a [CICircleSplashDistortionConfiguration] with default values.
  CICircleSplashDistortionConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0,
          max: 1000,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CICircleSplashDistortion');

  /// The radius of the distortion.
  ///
  /// Defaults to `150.0`.
  ///
  /// This value ranges from `0.0` to `1000.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The center of the distortion.
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
  List<ConfigurationParameter> get parameters => [_radius, _center];
}
