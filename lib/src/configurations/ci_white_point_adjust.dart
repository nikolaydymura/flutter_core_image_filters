part of flutter_core_image_filters;

class CIWhitePointAdjustConfiguration extends CIFilterConfiguration {
  final ColorParameter _color;

  CIWhitePointAdjustConfiguration()
      : _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 255, 255, 1.0),
        ),
        super('CIWhitePointAdjust');

  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_color];
}
