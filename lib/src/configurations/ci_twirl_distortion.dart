part of flutter_core_image_filters;

class CITwirlDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final PointParameter _center;
  final NumberParameter _radius;

  CITwirlDistortionConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          3.141592653589793,
          min: -12.56637061435917,
          max: 12.56637061435917,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 500,
        ),
        super('CITwirlDistortion');
  set angle(double value) {
    _angle.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_angle, _center, _radius];
}
