part of flutter_core_image_filters;

class CITorusLensDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _refraction;
  final NumberParameter _radius;

  CITorusLensDistortionConfiguration()
      : _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          80,
          min: 0,
          max: 200,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _refraction = SliderNSNumberParameter(
          'inputRefraction',
          'Refraction',
          1.7,
          min: 0,
          max: 5,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          160,
          min: 0,
          max: 500,
        ),
        super('CITorusLensDistortion');
  set width(double value) {
    _width.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set refraction(double value) {
    _refraction.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_width, _center, _refraction, _radius];
}
