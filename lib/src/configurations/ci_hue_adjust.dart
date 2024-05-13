part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a hue adjust filter.
///
/// * [angle] updates the `inputAngle` value of filter.
///
/// See also:
///
///  * [CIHueAdjust](https://developer.apple.com/documentation/coreimage/cihueadjust), which
///    defines the exact information for filter.
class CIHueAdjustConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;

  /// Create a [CIHueAdjustConfiguration] with default values.
  CIHueAdjustConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIHueAdjust');

  /// An angle, in radians, to use to correct the hue of an image.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [_angle];
}
