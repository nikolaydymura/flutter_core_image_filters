part of flutter_core_image_filters;

class CISunbeamsGeneratorConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _striationContrast;
  final NumberParameter _time;
  final NumberParameter _striationStrength;
  final NumberParameter _maxStriationRadius;
  final NumberParameter _sunRadius;
  final ColorParameter _color;

  CISunbeamsGeneratorConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _striationContrast = SliderNSNumberParameter(
          'inputStriationContrast',
          'Striation Contrast',
          1.375,
          min: 0,
          max: 5,
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _striationStrength = SliderNSNumberParameter(
          'inputStriationStrength',
          'Striation Strength',
          0.5,
          min: 0,
          max: 3,
        ),
        _maxStriationRadius = SliderNSNumberParameter(
          'inputMaxStriationRadius',
          'Maximum Striation Radius',
          2.58,
          min: 0,
          max: 10,
        ),
        _sunRadius = SliderNSNumberParameter(
          'inputSunRadius',
          'Sun Radius',
          40,
          min: 0,
          max: 800,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 127, 0, 1),
        ),
        super('CISunbeamsGenerator');

  set center(Point<double> value) {
    _center.value = value;
  }

  set striationContrast(double value) {
    _striationContrast.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set striationStrength(double value) {
    _striationStrength.value = value;
  }

  set maxStriationRadius(double value) {
    _maxStriationRadius.value = value;
  }

  set sunRadius(double value) {
    _sunRadius.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _center,
        _striationContrast,
        _time,
        _striationStrength,
        _maxStriationRadius,
        _sunRadius,
        _color
      ];

  @override
  bool get hasInputImage => false;
}
