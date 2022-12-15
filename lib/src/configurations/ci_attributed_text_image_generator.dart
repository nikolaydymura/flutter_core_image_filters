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
          50,
          min: 0,
          max: 200,
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
  List<ConfigurationParameter> get parameters =>
      [_scaleFactor, _padding, _text];
}
