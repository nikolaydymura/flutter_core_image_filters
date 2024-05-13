part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a text image generator filter.
///
/// * [fontName] updates the `inputFontName` value of filter.
/// * [text] updates the `inputText` value of filter.
/// * [fontSize] updates the `inputFontSize` value of filter.
/// * [padding] updates the `inputPadding` value of filter.
/// * [scaleFactor] updates the `inputScaleFactor` value of filter.
///
/// See also:
///
///  * [CITextImageGenerator](https://developer.apple.com/documentation/coreimage/citextimagegenerator), which
///    defines the exact information for filter.
class CITextImageGeneratorConfiguration extends CIFilterConfiguration {
  final StringParameter _fontName;
  final StringParameter _text;
  final NumberParameter _fontSize;
  final NumberParameter _padding;
  final NumberParameter _scaleFactor;

  /// Create a [CITextImageGeneratorConfiguration] with default values.
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
          min: 0,
          max: 128,
        ),
        _padding = SliderNSIntegerParameter(
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

  /// The name of the font to use for the generated text.
  set fontName(String value) {
    _fontName.value = value;
  }

  /// The text to render.
  ///
  /// Defaults to ` `.
  set text(String value) {
    _text.value = value;
  }

  /// The size of the font to use for the generated text.
  ///
  /// Defaults to `12.0`.
  ///
  /// Range: `0.0` to `128.0`.
  set fontSize(double value) {
    _fontSize.value = value;
  }

  /// The padding.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `200.0`.
  set padding(int value) {
    _padding.value = value;
  }

  /// The scale of the font to use for the generated text.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `4.0`.
  set scaleFactor(double value) {
    _scaleFactor.value = value;
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
      [_fontName, _text, _fontSize, _padding, _scaleFactor];
}
