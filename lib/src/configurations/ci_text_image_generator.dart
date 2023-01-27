part of flutter_core_image_filters;

class CITextImageGeneratorConfiguration extends CIFilterConfiguration {
  final StringParameter _fontName;
  final StringParameter _text;
  final NumberParameter _fontSize;
  final NumberParameter _padding;
  final NumberParameter _scaleFactor;

  CITextImageGeneratorConfiguration()
      : _fontName = NSStringParameter(
          'inputFontName',
          'Font Name',
          'HelveticaNeue',
        ),
        _text = NSStringParameter(
          'inputText',
          'Text',
          '',
        ),
        _fontSize = SliderNSNumberParameter(
          'inputFontSize',
          'Font Size',
          12,
          min: 9,
          max: 128,
        ),
        _padding = SliderNSNumberParameter(
          'inputPadding',
          'Padding',
          0,
          min: 0,
          max: 200,
        ),
        _scaleFactor = SliderNSNumberParameter(
          'inputScaleFactor',
          'Scale Factor',
          1,
          min: 0,
          max: 4,
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

  set padding(double value) {
    _padding.value = value;
  }

  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_fontName, _text, _fontSize, _padding, _scaleFactor];
}
