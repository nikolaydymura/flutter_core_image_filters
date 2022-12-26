part of flutter_core_image_filters;

class CIHatchedScreenConfiguration extends CIFilterConfiguration {
  final NumberParameter _width;
  final NumberParameter _sharpness;
  final NumberParameter _angle;
  final PointParameter _center;

  CIHatchedScreenConfiguration()
      : _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          6,
          min: 2,
          max: 50,
        ),
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'sharpness',
          0.7,
          min: 0,
          max: 1,
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
        super('CIHatchedScreen');

  set width(double value) {
    _width.value = value;
  }

  set sharpness(double value) {
    _sharpness.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_width, _sharpness, _angle, _center];
}
