part of flutter_core_image_filters;

class CICopyMachineTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _time;
  final NumberParameter _opacity;
  final ColorParameter _color;
  final RectParameter _extent;
  final NumberParameter _width;
  final NumberParameter _angle;

  CICopyMachineTransitionConfiguration()
      : _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _opacity = SliderNSNumberParameter(
          'inputOpacity',
          'Opacity',
          1.3,
          min: 0,
          max: 3,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(153, 225, 204, 1.0),
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 300, 300),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          200,
          min: 0.1,
          max: 500,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: 0,
          max: 6.283185307179586,
        ),
        super('CICopyMachineTransition');

  set time(double value) {
    _time.value = value;
  }

  set opacity(double value) {
    _opacity.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  set extent(Rect value) {
    _extent.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_time, _opacity, _color, _extent, _width, _angle, _targetImage];
}
