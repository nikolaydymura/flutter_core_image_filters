part of flutter_core_image_filters;

class CIBumpDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _scale;
  final PointParameter _center;

  CIBumpDistortionConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 600,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0.5,
          min: -1,
          max: 1,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIBumpDistortion');

  set radius(double value) {
    _radius.value = value;
  }

  set scale(double value) {
    _scale.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius, _scale, _center];
}
