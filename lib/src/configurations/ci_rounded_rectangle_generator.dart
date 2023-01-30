part of flutter_core_image_filters;

class CIRoundedRectangleGeneratorConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;
  final ColorParameter _color;
  final NumberParameter _radius;

  CIRoundedRectangleGeneratorConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTWH(
            0,
            0,
            100,
            100,
          ),
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          10,
          min: 0,
          max: 100,
        ),
        super('CIRoundedRectangleGenerator');

  set extent(Rect value) {
    _extent.value = value;
  }

  set color(Color value) {
    _color.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_extent, _color, _radius];

  @override
  bool get hasInputImage => false;
}
