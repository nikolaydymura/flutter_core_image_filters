part of flutter_core_image_filters;

class CIFourfoldTranslatedTileConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _angle;
  final NumberParameter _acuteAngle;
  final NumberParameter _width;

  CIFourfoldTranslatedTileConfiguration()
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
        _acuteAngle = SliderNSNumberParameter(
          'inputAcuteAngle',
          'Acute Angle',
          1.570796326794897,
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
        super('CIFourfoldTranslatedTile');

  set center(Point<double> value) {
    _center.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set acuteAngle(double value) {
    _acuteAngle.value = value;
  }

  set width(double value) {
    _width.value = value;
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
      [_center, _angle, _acuteAngle, _width];
}
