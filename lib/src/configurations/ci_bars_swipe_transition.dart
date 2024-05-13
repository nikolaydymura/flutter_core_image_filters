part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a bars swipe transition filter.
///
/// * [time] updates the `inputTime` value of filter.
/// * [angle] updates the `inputAngle` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [barOffset] updates the `inputBarOffset` value of filter.
///
/// See also:
///
///  * [CIBarsSwipeTransition](https://developer.apple.com/documentation/coreimage/cibarsswipetransition), which
///    defines the exact information for filter.
class CIBarsSwipeTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;
  final NumberParameter _angle;
  final NumberParameter _width;
  final NumberParameter _barOffset;

  /// Create a [CIBarsSwipeTransitionConfiguration] with default values.
  CIBarsSwipeTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          3.141592653589793,
          min: 0,
          max: 6.2831853071795860,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          30,
          min: 2,
          max: 300,
        ),
        _barOffset = SliderNSNumberParameter(
          'inputBarOffset',
          'Bar Offset',
          10,
          min: 1,
          max: 100,
        ),
        super('CIBarsSwipeTransition');

  /// The time at which the transition should be at its final state.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The angle, in radians, of the bars.
  ///
  /// Defaults to `3.141592653589793`.
  ///
  /// This value ranges from `0.0` to `6.2831853071795860`.
  set angle(double value) {
    _angle.value = value;
  }

  /// The width of each bar.
  ///
  /// Defaults to `30.0`.
  ///
  /// This value ranges from `2.0` to `300.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The offset of one bar with respect to another.
  ///
  ///  Defaults to `10.0`.
  ///
  /// This value ranges from `1.0` to `100.0`.
  set barOffset(double value) {
    _barOffset.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_time, _angle, _width, _barOffset, _targetImage];
}
