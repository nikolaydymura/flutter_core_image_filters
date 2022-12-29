part of flutter_core_image_filters;

class CIPinchDistortionConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _scale;
  final NumberParameter _radius;

  CIPinchDistortionConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0.5,
          min: 0,
          max: 2,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 1000,
        ),
        super('CIPinchDistortion');
  set center(Point<double> value) {
    _center.value = value;
  }

  set scale(double value) {
    _scale.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_center, _scale, _radius];
}
