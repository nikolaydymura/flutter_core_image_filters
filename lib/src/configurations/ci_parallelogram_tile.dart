part of flutter_core_image_filters;

class CIParallelogramTileConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _width;
  final NumberParameter _acuteAngle;
  final NumberParameter _angle;

  CIParallelogramTileConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          100,
          min: 0,
          max: 200,
        ),
        _acuteAngle = SliderNSNumberParameter(
          'inputAcuteAngle',
          'Acute Angle',
          1.570796326794897,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        super('CIParallelogramTile');

  set center(Point<double> value) {
    _center.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set acuteAngle(double value) {
    _acuteAngle.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_center, _width, _acuteAngle, _angle];
}
