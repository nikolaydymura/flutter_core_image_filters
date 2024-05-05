part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAttributedTextImageGenerator filter.
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
        _padding = SliderNSIntegerParameter(
          'inputPadding',
          'Padding',
          0,
          min: 0,
          max: 200,
        ),
        _text = NSStringParameter(
          'inputText',
          'Text',
          '',
        ),
        super('CIAttributedTextImageGenerator');

  /// The scale factor to apply to the text.
  ///
  /// This value ranges from 0.0 to 4.0.
  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  /// The padding to apply to the text.
  ///
  /// This value ranges from 0 to 200.
  set padding(int value) {
    _padding.value = value;
  }

  /// The text to render.
  set text(String value) {
    _text.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_scaleFactor, _padding, _text];

  @override
  bool get hasInputImage => false;
}
