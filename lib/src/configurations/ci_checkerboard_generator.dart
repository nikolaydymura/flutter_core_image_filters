part of flutter_core_image_filters;

class CICheckerboardGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _sharpness;
  final ColorParameter _color0;
  final PointParameter _center;
  final NumberParameter _width;
  final ColorParameter _color1;

  CICheckerboardGeneratorConfiguration()
      : _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          1,
          min: 0,
          max: 1,
        ),
        _color0 = CIColorParameter(
          'inputColor0',
          'Color0',
          const Color.fromRGBO(255, 225, 225, 1.0),
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          80,
          min: 0,
          max: 800,
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color1',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        super('CICheckerboardGenerator');

  set sharpness(double value) {
    _sharpness.value = value;
  }

  set color0(Color value) {
    _color0.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set color1(Color value) {
    _color1.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_sharpness, _color0, _center, _width, _color1];
}
