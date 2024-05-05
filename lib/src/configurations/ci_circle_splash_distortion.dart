part of '../../flutter_core_image_filters.dart';

/// A configuration for a CICircleSplashDistortion filter.
class CICircleSplashDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

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
  /// This value ranges from 0.0 to 1000.0.
  set radius(double value) {
    _radius.value = value;
  }

  /// The center of the distortion.
  ///
  /// Defaults to (150.0, 150.0).
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
