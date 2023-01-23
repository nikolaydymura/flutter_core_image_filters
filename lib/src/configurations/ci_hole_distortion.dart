part of flutter_core_image_filters;

class CIHoleDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

  CIHoleDistortionConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0.01,
          max: 1000,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIHoleDistortion');
  set radius(double value) {
    _radius.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius, _center];
}
