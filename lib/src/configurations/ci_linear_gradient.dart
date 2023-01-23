part of flutter_core_image_filters;

class CILinearGradientConfiguration extends CIFilterConfiguration {
  final ColorParameter _color0;
  final PointParameter _point1;
  final PointParameter _point0;
  final ColorParameter _color1;

  CILinearGradientConfiguration()
      : _color0 = CIColorParameter(
          'inputColor0',
          'Color0',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        _point1 = CGPositionParameter(
          'inputPoint1',
          'Point1',
          const Point(200.0, 200.0),
        ),
        _point0 = CGPositionParameter(
          'inputPoint0',
          'Point0',
          const Point(0.0, 0.0),
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color1',
          const Color.fromRGBO(0, 0, 0, 1),
        ),
        super('CILinearGradient');

  set color0(Color value) {
    _color0.value = value;
  }

  set point1(Point<double> value) {
    _point1.value = value;
  }

  set point0(Point<double> value) {
    _point0.value = value;
  }

  set color1(Color value) {
    _color1.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_color0, _point1, _point0, _color1];
}
