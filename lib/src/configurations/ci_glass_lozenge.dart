part of flutter_core_image_filters;

class CIGlassLozengeConfiguration extends CIFilterConfiguration {
  final NumberParameter _refraction;
  final NumberParameter _radius;
  final PointParameter _point0;
  final PointParameter _point1;

  CIGlassLozengeConfiguration()
      : _refraction = SliderNSNumberParameter(
          'inputRefraction',
          'Refraction',
          1.7,
          min: 0,
          max: 5,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          100,
          min: 0,
          max: 1000,
        ),
        _point0 = CGPositionParameter(
          'inputPoint0',
          'Point0',
          const Point(150.0, 150.0),
        ),
        _point1 = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(350.0, 150.0),
        ),
        super('CIGlassLozenge');
  set refraction(double value) {
    _refraction.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set point0(Point<double> value) {
    _point0.value = value;
  }

  set point1(Point<double> value) {
    _point1.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_refraction, _radius, _point0, _point1];
}
