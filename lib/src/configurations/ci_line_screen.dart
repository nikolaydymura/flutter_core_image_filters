part of flutter_core_image_filters;

class CILineScreenConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _sharpness;
  final NumberParameter _angle;
  final NumberParameter _width;

  CILineScreenConfiguration()
      : _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.7,
          min: 0,
          max: 1,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          6,
          min: 2,
          max: 50,
        ),
        super('CILineScreen');

  set sharpness(double value) {
    _sharpness.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_center, _sharpness, _angle, _width];
}
