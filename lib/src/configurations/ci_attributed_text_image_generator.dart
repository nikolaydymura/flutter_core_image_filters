part of flutter_core_image_filters;

class CIAttributedTextImageGeneratorConfiguration
    extends CIFilterConfiguration {
  final NumberParameter _scaleFactor;
  final NumberParameter _padding;
  final StringParameter _text;

  CIAttributedTextImageGeneratorConfiguration()
      : _scaleFactor = SliderNSNumberParameter(
          'inputScaleFactor',
          'Scale Factor',
          1,
          min: 0,
          max: 4,
        ),
        _padding = SliderNSNumberParameter(
          'inputPadding',
          'Padding',
          0,
          min: 0,
          max: 200,
        ),
        _text = NSStringParameter('inputText', 'Text', ''),
        super('CIAttributedTextImageGenerator');

  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  set padding(double value) {
    _padding.value = value;
  }

  set text(String value) {
    _text.value = value;
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
      [_scaleFactor, _padding, _text];

  @override
  bool get hasInputImage => false;
}
