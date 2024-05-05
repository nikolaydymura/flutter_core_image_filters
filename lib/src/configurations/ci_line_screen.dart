part of '../../flutter_core_image_filters.dart';

class CILineScreenConfiguration extends CIFilterConfiguration {
  final NumberParameter _sharpness;
  final PointParameter _center;
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
          min: 1,
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
  Iterable<CICategory> get categories => {
        CICategory.halftoneEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_center, _sharpness, _angle, _width];
}
