part of flutter_core_image_filters;

class CIFourfoldRotatedTileConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _angle;
  final NumberParameter _width;

  CIFourfoldRotatedTileConfiguration()
      : _center = CGPositionParameter(
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
          100,
          min: 1,
          max: 200,
        ),
        super('CIFourfoldRotatedTile');

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
  List<ConfigurationParameter> get parameters => [_center, _angle, _width];
}