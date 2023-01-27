part of flutter_core_image_filters;

class CITextImageGeneratorConfiguration extends CIFilterConfiguration {
  final StringParameter _fontName;
  final StringParameter _text;
  final NumberParameter _fontSize;

  CITextImageGeneratorConfiguration()
      : _fontName = NSStringParameter(
          'inputFontName',
          'FontName',
          'HelveticaNeue',
        ),
        _text = NSStringParameter(
          'inputText',
          'Text',
          '',
        ),
        _fontSize = SliderNSNumberParameter(
          'inputFontSize',
          'FontSize',
          12,
          min: 9,
          max: 128,
        ),
        super('CITextImageGenerator');

  @override
  bool get hasInputImage => false;

  set fontName(String value) {
    _fontName.value = value;
  }

  set text(String value) {
    _text.value = value;
  }

  set fontSize(double value) {
    _fontSize.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [_fontName, _text, _fontSize];
}
