part of '../../flutter_core_image_filters.dart';

/// A configuration for a CICircularWrap filter.
class CICircularWrapConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _angle;
  final PointParameter _center;

  CICircularWrapConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0,
          max: 600,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CICircularWrap');

  /// The radius of the distortion.
  ///
  /// This value ranges from 0.0 to 600.0.
  set radius(double value) {
    _radius.value = value;
  }

  /// The angle of the distortion.
  ///
  /// This value ranges from -3.141592653589793 to 3.141592653589793.
  set angle(double value) {
    _angle.value = value;
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
  List<ConfigurationParameter> get parameters => [_center, _radius, _angle];
}
