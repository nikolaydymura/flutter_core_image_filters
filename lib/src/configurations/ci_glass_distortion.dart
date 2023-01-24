part of flutter_core_image_filters;

class CIGlassDistortionConfiguration extends CIFilterConfiguration
    with TextureMixin {
  final NumberParameter _scale;
  final PointParameter _center;

  CIGlassDistortionConfiguration()
      : _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          200,
          min: 0.01,
          max: 500,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIGlassDistortion');
  set scale(double value) {
    _scale.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_scale, _center, _texture];
}
