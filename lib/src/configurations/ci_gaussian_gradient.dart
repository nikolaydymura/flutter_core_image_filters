part of flutter_core_image_filters;

class CIGaussianGradientConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;
  final ColorParameter _color1;
  final ColorParameter _color0;

  CIGaussianGradientConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 800,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color1',
          const Color.fromRGBO(0, 0, 0, 0),
        ),
        _color0 = CIColorParameter(
          'inputColor0',
          'Color0',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        super('CIGaussianGradient');
  set radius(double value) {
    _radius.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set color1(Color value) {
    _color1.value = value;
  }

  set color0(Color value) {
    _color0.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_radius, _center, _color1, _color0];
}
