part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a vortex distortion filter.
///
/// * [angle] updates the `inputAngle` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIVortexDistortion](https://developer.apple.com/documentation/coreimage/civortexdistortion), which
///    defines the exact information for filter.
class CIVortexDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final PointParameter _center;
  final NumberParameter _radius;

  /// Create a [CIVortexDistortionConfiguration] with default values.
  CIVortexDistortionConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          56.54866776461628,
          min: -94.24777960769379,
          max: 94.24777960769379,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 800,
        ),
        super('CIVortexDistortion');

  /// The angle.
  ///
  /// Defaults to `56.54866776461628`.
  ///
  /// Range: `-94.24777960769379` to `94.24777960769379`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The center of the effect as x and y coordinates.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The radius.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set radius(double value) {
    _radius.value = value;
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
  List<ConfigurationParameter> get parameters => [_angle, _center, _radius];
}
