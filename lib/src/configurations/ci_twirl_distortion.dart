part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a twirl distortion filter.
///
/// * [angle] updates the `inputAngle` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CITwirlDistortion](https://developer.apple.com/documentation/coreimage/citwirldistortion), which
///    defines the exact information for filter.
class CITwirlDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final PointParameter _center;
  final NumberParameter _radius;

  /// Create a [CITwirlDistortionConfiguration] with default values.
  CITwirlDistortionConfiguration()
    : _angle = SliderNSNumberParameter(
        'inputAngle',
        'Angle',
        3.141592653589793,
        min: -12.566370614359172,
        max: 12.566370614359172,
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
        max: 500,
      ),
      super('CITwirlDistortion');

  /// The angle.
  ///
  /// Defaults to `3.141592653589793`.
  ///
  /// Range: `-12.566370614359172` to `12.566370614359172`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The radius.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `0.0` to `500.0`.
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
