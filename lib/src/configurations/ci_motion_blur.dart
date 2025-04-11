part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a motion blur filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
///
/// See also:
///
///  * [CIMotionBlur](https://developer.apple.com/documentation/coreimage/cimotionblur), which
///    defines the exact information for filter.
class CIMotionBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _angle;

  /// Create a [CIMotionBlurConfiguration] with default values.
  CIMotionBlurConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        20,
        min: 0,
        max: 100,
      ),
      _angle = SliderNSNumberParameter(
        'inputAngle',
        'Angle',
        0,
        min: -3.141592653589793,
        max: 3.141592653589793,
      ),
      super('CIMotionBlur');

  /// The radius of the blur, in pixels.
  ///
  /// Defaults to `20.0`.
  ///
  /// Range: `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The angle of the motion, in radians, that determines which direction the blur smears.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.blur,
    CICategory.stillImage,
    CICategory.video,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _angle];
}
