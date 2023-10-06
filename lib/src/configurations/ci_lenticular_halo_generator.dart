part of flutter_core_image_filters;

class CILenticularHaloGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _haloRadius;
  final ColorParameter _color;
  final PointParameter _center;
  final NumberParameter _striationContrast;
  final NumberParameter _haloOverlap;
  final NumberParameter _time;
  final NumberParameter _striationStrength;
  final NumberParameter _haloWidth;

  CILenticularHaloGeneratorConfiguration()
      : _haloRadius = SliderNSNumberParameter(
          'inputHaloRadius',
          'Halo Radius',
          70,
          min: 0,
          max: 1000,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 229, 204, 1),
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _striationContrast = SliderNSNumberParameter(
          'inputStriationContrast',
          'Striation Contrast',
          1,
          min: 0,
          max: 5,
        ),
        _haloOverlap = SliderNSNumberParameter(
          'inputHaloOverlap',
          'Halo Overlap',
          0.77,
          min: 0,
          max: 1,
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
        _haloWidth = SliderNSNumberParameter(
          'inputHaloWidth',
          'Halo Width',
          87,
          min: 0,
          max: 300,
        ),
        super('CILenticularHaloGenerator');

  set haloRadius(double value) {
    _haloRadius.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set striationContrast(double value) {
    _striationContrast.value = value;
  }

  set haloOverlap(double value) {
    _haloOverlap.value = value;
  }

  set time(double value) {
    _time.value = value;
  }

  set striationStrength(double value) {
    _striationStrength.value = value;
  }

  set haloWidth(double value) {
    _haloWidth.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _haloRadius,
        _color,
        _center,
        _striationContrast,
        _haloOverlap,
        _time,
        _striationStrength,
        _haloWidth,
        _haloRadius,
      ];

  @override
  bool get hasInputImage => false;
}
