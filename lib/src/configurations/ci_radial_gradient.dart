part of flutter_core_image_filters;

class CIRadialGradientConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius1;
  final ColorParameter _color0;
  final PointParameter _center;
  final NumberParameter _radius0;
  final ColorParameter _color1;

  CIRadialGradientConfiguration()
      : _radius1 = SliderNSNumberParameter(
          'inputRadius1',
          'Radius 2',
          100,
          min: 0,
          max: 800,
        ),
        _color0 = CIColorParameter(
          'inputColor0',
          'Color 1',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius0 = SliderNSNumberParameter(
          'inputRadius0',
          'Radius 1',
          5,
          min: 0,
          max: 800,
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color 2',
          const Color.fromRGBO(0, 0, 0, 1),
        ),
        super('CIRadialGradient');

  set radius1(double value) {
    _radius1.value = value;
  }

  set color0(Color value) {
    _color0.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set radius0(double value) {
    _radius0.value = value;
  }

  set color1(Color value) {
    _color1.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.gradient,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_radius1, _color0, _center, _radius0, _color1];

  @override
  bool get hasInputImage => false;
}
