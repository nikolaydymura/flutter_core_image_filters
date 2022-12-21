part of flutter_core_image_filters;

class CIRoundedRectangleGeneratorConfiguration extends CIFilterConfiguration {
  final RectParameter _extent;
  final ColorParameter _color;
  final NumberParameter _radius;

  CIRoundedRectangleGeneratorConfiguration()
      : _extent = CGRectParameter(
          'inputExtent',
          'Extent',
          const Rect.fromLTRB(
            0,
            0,
            100,
            100,
          ),
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(0, 0, 0, 0.0),
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
  List<ConfigurationParameter> get parameters => [_extent, _color, _radius];
}
