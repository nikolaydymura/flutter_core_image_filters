part of flutter_core_image_filters;

class CIModTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final NumberParameter _angle;
  final NumberParameter _compression;
  final NumberParameter _time;
  final NumberParameter _radius;
  final PointParameter _center;

  CIModTransitionConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          2,
          min: -6.283185307179586,
          max: 6.283185307179586,
        ),
        _compression = SliderNSNumberParameter(
          'inputCompression',
          'Compression',
          300,
          min: 100,
          max: 800,
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 1,
          max: 200,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIModTransition');

  set angle(double value) {
    _angle.value = value;
  }

  set compression(double value) {
    _compression.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_angle, _compression, _time, _targetImage, _radius, _center];
}
