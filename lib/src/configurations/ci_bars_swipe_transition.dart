part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBarsSwipeTransition filter.
class CIBarsSwipeTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;
  final NumberParameter _angle;
  final NumberParameter _width;
  final NumberParameter _barOffset;

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
  /// This value ranges from 0.0 to 1.0.
  set time(double value) {
    _time.value = value;
  }

  /// The angle of the bars.
  ///
  /// This value ranges from 0.0 to 6.2831853071795860.
  set angle(double value) {
    _angle.value = value;
  }

  /// The width of the bars.
  ///
  /// This value ranges from 2 to 300.
  set width(double value) {
    _width.value = value;
  }

  /// The offset of the bars.
  ///
  /// This value ranges from 1 to 100.
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
