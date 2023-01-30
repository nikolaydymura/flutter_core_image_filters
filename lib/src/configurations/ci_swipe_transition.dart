part of flutter_core_image_filters;

class CISwipeTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _angle;
  final ColorParameter _color;
  final RectParameter _extent;
  final NumberParameter _opacity;
  final NumberParameter _time;
  final NumberParameter _width;

  CISwipeTransitionConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1.0),
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(0, 0, 300, 300),
        ),
        _opacity = SliderNSNumberParameter(
          'inputOpacity',
          'Opacity',
          0,
          min: 0,
          max: 1,
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          300,
          min: 0.1,
          max: 800,
        ),
        super('CISwipeTransition');

  set angle(double value) {
    _angle.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  set extent(Rect value) {
    _extent.value = value;
  }

  set opacity(double value) {
    _opacity.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.transition,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_angle, _color, _extent, _opacity, _time, _width, _targetImage];
}
