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
  List<ConfigurationParameter> get parameters => [_color];
}
