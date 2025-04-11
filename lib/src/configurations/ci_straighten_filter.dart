part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a straighten filter.
///
/// * [angle] updates the `inputAngle` value of filter.
///
/// See also:
///
///  * [CIStraightenFilter](https://developer.apple.com/documentation/coreimage/cistraighten), which
///    defines the exact information for filter.
class CIStraightenFilterConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;

  /// Create a [CIStraightenFilterConfiguration] with default values.
  CIStraightenFilterConfiguration()
    : _angle = SliderNSNumberParameter(
        'inputAngle',
        'Angle',
        0,
        min: -3.141592653589793,
        max: 3.141592653589793,
      ),
      super('CIStraightenFilter');

  /// The rotation angle, in radians.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.geometryAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_angle];
}
