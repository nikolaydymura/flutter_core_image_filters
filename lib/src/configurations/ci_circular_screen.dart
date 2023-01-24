part of flutter_core_image_filters;

class CICircularScreenConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _sharpness;
  final NumberParameter _width;

  CICircularScreenConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.7,
          min: 0,
          max: 1,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          6,
          min: 2,
          max: 50,
        ),
        super('CICircularScreen');

  set center(Point<double> value) {
    _center.value = value;
  }

  set sharpness(double value) {
    _sharpness.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_center, _sharpness, _width];
}
