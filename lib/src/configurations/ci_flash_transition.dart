part of flutter_core_image_filters;

class CIFlashTransitionConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;
  final NumberParameter _time;
  final PointParameter _center;
  final NumberParameter _maxStriationRadius;
  final RectParameter _extent;
  final NumberParameter _striationStrength;
  final NumberParameter _fadeThreshold;
  final NumberParameter _striationContrast;

  CIFlashTransitionConfiguration()
      : _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1.0),
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _maxStriationRadius = SliderNSNumberParameter(
          'inputMaxStriationRadius',
          'MaxStriationRadius',
          2.58,
          min: 0,
          max: 10,
        ),
        _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(0, 0, 300, 300),
        ),
        _striationStrength = SliderNSNumberParameter(
          'inputStriationStrength',
          'StriationStrength',
          0.5,
          min: 0,
          max: 3,
        ),
        _fadeThreshold = SliderNSNumberParameter(
          'inputFadeThreshold',
          'FadeThreshold',
          0.85,
          min: 0,
          max: 1,
        ),
        _striationContrast = SliderNSNumberParameter(
          'inputStriationContrast',
          'StriationContrast',
          1.375,
          min: 0,
          max: 5,
        ),
        super('CIFlashTransition');

  set color(Color value) {
    _color.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set maxStriationRadius(double value) {
    _maxStriationRadius.value = value;
  }

  set extent(Rect value) {
    _extent.value = value;
  }

  set striationStrength(double value) {
    _striationStrength.value = value;
  }

  set fadeThreshold(double value) {
    _fadeThreshold.value = value;
  }

  set striationContrast(double value) {
    _striationContrast.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [
        _color,
        _time,
        _center,
        _maxStriationRadius,
        _extent,
        _striationStrength,
        _fadeThreshold,
        _striationContrast,
      ];
}
