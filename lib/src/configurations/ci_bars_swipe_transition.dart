part of flutter_core_image_filters;

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
          1,
          min: 0,
          max: 100,
        ),
        super('CIBarsSwipeTransition');

  set time(double value) {
    _time.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set barOffset(double value) {
    _barOffset.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_time, _angle, _width, _barOffset, _targetImage];
}
