part of flutter_core_image_filters;

class CIStarShineGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _epsilon;
  final NumberParameter _crossAngle;
  final NumberParameter _radius;
  final NumberParameter _crossScale;
  final NumberParameter _crossOpacity;
  final ColorParameter _color;
  final NumberParameter _crossWidth;
  final PointParameter _center;

  CIStarShineGeneratorConfiguration()
      : _epsilon = SliderNSNumberParameter(
          'inputEpsilon',
          'Epsilon',
          -2,
          min: -8,
          max: 0,
        ),
        _crossAngle = SliderNSNumberParameter(
          'inputCrossAngle',
          'Cross Angle',
          0.6,
          min: -3.141592653589793,
          max: 3.141592653589793,
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          50,
          min: 0,
          max: 300,
        ),
        _crossScale = SliderNSNumberParameter(
          'inputCrossScale',
          'Cross Scale',
          15,
          min: 0,
          max: 100,
        ),
        _crossOpacity = SliderNSNumberParameter(
          'inputCrossOpacity',
          'Cross Opacity',
          -2,
          min: -8,
          max: 0,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 204, 153, 1),
        ),
        _crossWidth = SliderNSNumberParameter(
          'inputCrossWidth',
          'Cross Width',
          2.5,
          min: 0.0,
          max: 10,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CIStarShineGenerator');

  set epsilon(double value) {
    _epsilon.value = value;
  }

  set crossAngle(double value) {
    _crossAngle.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set crossScale(double value) {
    _crossScale.value = value;
  }

  set crossOpacity(double value) {
    _crossOpacity.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  set crossWidth(double value) {
    _crossWidth.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
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
        _epsilon,
        _crossAngle,
        _radius,
        _crossScale,
        _crossOpacity,
        _color,
        _crossWidth,
        _center
      ];

  @override
  bool get hasInputImage => false;
}
