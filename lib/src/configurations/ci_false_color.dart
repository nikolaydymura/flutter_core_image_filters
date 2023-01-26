part of flutter_core_image_filters;

class CIFalseColorConfiguration extends CIFilterConfiguration {
  final ColorParameter _color0;
  final CIColorParameter _color1;

  CIFalseColorConfiguration()
      : _color0 = CIColorParameter(
          'inputColor0',
          'Color 1',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color 2',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        super('CIFalseColor');

  set color0(Color value) {
    _color0.value = value;
  }

  set color1(Color value) {
    _color1.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_color0, _color1];
}
