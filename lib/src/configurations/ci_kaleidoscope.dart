part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a kaleidoscope filter.
///
/// * [angle] updates the `inputAngle` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [count] updates the `inputCount` value of filter.
///
/// See also:
///
///  * [CIKaleidoscope](https://developer.apple.com/documentation/coreimage/cikaleidoscope), which
///    defines the exact information for filter.
class CIKaleidoscopeConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final PointParameter _center;
  final NumberParameter _count;

  /// Create a [CIKaleidoscopeConfiguration] with default values.
  CIKaleidoscopeConfiguration()
      : _angle = SliderNSNumberParameter(
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
        _count = SliderNSNumberParameter(
          'inputCount',
          'Count',
          6,
          min: 1,
          max: 64,
        ),
        super('CIKaleidoscope');

  /// The angle of the reflection.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `-3.141592653589793` to `3.141592653589793`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The number of reflections in the pattern.
  ///
  /// Defaults to `6.0`.
  ///
  /// Range: `1.0` to `64.0`.
  set count(double value) {
    _count.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.tileEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_angle, _center, _count];
}
