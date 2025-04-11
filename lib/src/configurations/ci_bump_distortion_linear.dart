part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a bump distortion linear filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [scale] updates the `inputScale` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
///
/// See also:
///
///  * [CIBumpDistortionLinear](https://developer.apple.com/documentation/coreimage/cibumpdistortionlinear), which
///    defines the exact information for filter.
class CIBumpDistortionLinearConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _radius;
  final NumberParameter _scale;
  final NumberParameter _angle;

  /// Create a [CIBumpDistortionLinearConfiguration] with default values.
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
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The radius of the distortion.
  ///
  /// Defaults to `300.0`.
  ///
  /// This value ranges from `0.0` to `600.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The scale of the distortion.
  ///
  /// Defaults to `0.5`.
  ///
  /// This value ranges from `-1.0` to `1.0`.
  set scale(double value) {
    _scale.value = value;
  }

  /// The angle of the distortion.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `6.283185307179586`.
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
  List<ConfigurationParameter> get parameters => [
    _radius,
    _scale,
    _center,
    _angle,
  ];
}
