part of flutter_core_image_filters;

class CIStripesGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _sharpness;
  final ColorParameter _color0;
  final ColorParameter _color1;

  CIStripesGeneratorConfiguration()
      : _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          80,
          min: 0,
          max: 800,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          1,
          min: 0,
          max: 1,
        ),
        _color0 = CIColorParameter(
          'inputColor0',
          'Color 1',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color 2',
          const Color.fromRGBO(0, 0, 0, 1),
        ),
        super('CIStripesGenerator');

  set width(double value) {
    _width.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set sharpness(double value) {
    _sharpness.value = value;
  }

  set color0(Color value) {
    _color0.value = value;
  }

  set color1(Color value) {
    _color1.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_width, _center, _sharpness, _color0, _color1];
}
