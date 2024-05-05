part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBumpDistortionLinear filter.
class CIBumpDistortionLinearConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _radius;
  final NumberParameter _scale;
  final NumberParameter _angle;

  CIBumpDistortionLinearConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 600,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0.5,
          min: -1,
          max: 1,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: 0,
          max: 6.283185307179586,
        ),
        super('CIBumpDistortionLinear');

  /// The center of the distortion.
  ///
  /// Defaults to (150.0, 150.0).
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The radius of the distortion.
  ///
  /// This value ranges from 0.0 to 600.0.
  set radius(double value) {
    _radius.value = value;
  }

  /// The scale of the distortion.
  ///
  /// This value ranges from -1.0 to 1.0.
  set scale(double value) {
    _scale.value = value;
  }

  /// The angle of the distortion.
  ///
  /// This value ranges from 0.0 to 6.283185307179586.
  set angle(double value) {
    _angle.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_radius, _scale, _center, _angle];
}
