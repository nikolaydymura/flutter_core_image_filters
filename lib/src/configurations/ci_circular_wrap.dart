part of flutter_core_image_filters;

class CICircularWrapConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _angle;
  final PointParameter _center;

  CICircularWrapConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0,
          max: 600,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CICircularWrap');

  set radius(double value) {
    _radius.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_center, _radius, _angle];
}
