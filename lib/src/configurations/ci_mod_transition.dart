part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a mod transition filter.
///
/// * [angle] updates the `inputAngle` value of filter.
/// * [compression] updates the `inputCompression` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
///
/// See also:
///
///  * [CIModTransition](https://developer.apple.com/documentation/coreimage/cimodtransition), which
///    defines the exact information for filter.
class CIModTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _angle;
  final NumberParameter _compression;
  final NumberParameter _time;
  final NumberParameter _radius;
  final PointParameter _center;

  /// Create a [CIModTransitionConfiguration] with default values.
  CIModTransitionConfiguration()
    : _angle = SliderNSNumberParameter(
        'inputAngle',
        'Angle',
        2,
        min: -6.283185307179586,
        max: 6.283185307179586,
      ),
      _compression = SliderNSNumberParameter(
        'inputCompression',
        'Compression',
        300,
        min: 1,
        max: 800,
      ),
      _time = SliderNSNumberParameter('inputTime', 'Time', 0, min: 0, max: 1),
      _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        150,
        min: 1,
        max: 200,
      ),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      super('CIModTransition');

  /// The angle of the mod hole pattern.
  ///
  /// Defaults to `2.0`.
  ///
  /// Range: `-6.283185307179586` to `6.283185307179586`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The amount of stretching applied to the mod hole pattern.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `1.0` to `800.0`.
  set compression(double value) {
    _compression.value = value;
  }

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The radius of the undistorted mod holes in the pattern.
  ///
  /// Defaults to `150.0`.
  ///
  /// Range: `1.0` to `200.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.transition,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _angle,
    _compression,
    _time,
    _targetImage,
    _radius,
    _center,
  ];
}
