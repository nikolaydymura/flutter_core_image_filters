part of flutter_core_image_filters;

class CICMYKHalftoneConfiguration extends CIFilterConfiguration {
  final NumberParameter _gCR;
  final NumberParameter _uCR;
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _angle;
  final NumberParameter _sharpness;

  CICMYKHalftoneConfiguration()
      : _gCR = SliderNSNumberParameter(
          'inputGCR',
          'Gray Component Replacement',
          1,
          min: 0,
          max: 1,
        ),
        _uCR = SliderNSNumberParameter(
          'inputUCR',
          'Under Color Removal',
          0.5,
          min: 0,
          max: 1,
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          6,
          min: -2,
          max: 100,
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
        _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          0.7,
          min: 0.0,
          max: 1,
        ),
        super('CICMYKHalftone');

  set gCR(double value) {
    _gCR.value = value;
  }

  set uCR(double value) {
    _uCR.value = value;
  }

  set width(double value) {
    _width.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set angle(double value) {
    _angle.value = value;
  }

  set sharpness(double value) {
    _sharpness.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.halftoneEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_gCR, _uCR, _width, _center, _angle, _sharpness];
}
