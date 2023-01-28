part of flutter_core_image_filters;

class CIGlideReflectedTileConfiguration extends CIFilterConfiguration {
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _angle;

  CIGlideReflectedTileConfiguration()
      : _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          100,
          min: 0,
          max: 200,
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
        super('CIGlideReflectedTile');

  set width(double value) {
    _width.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.tileEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_width, _center, _angle];
}
