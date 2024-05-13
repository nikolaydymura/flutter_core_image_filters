part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an attributed-text image generator filter.
///
/// * [scaleFactor] updates the `inputScaleFactor` value of filter.
/// * [padding] updates the `inputPadding` value of filter.
/// * [text] updates the `inputText` value of filter.
///
/// See also:
///
///  * [CIAttributedTextImageGenerator](https://developer.apple.com/documentation/coreimage/ciattributedtextimagegenerator), which
///    defines the exact information for filter.
class CIAttributedTextImageGeneratorConfiguration
    extends CIFilterConfiguration {
  final NumberParameter _scaleFactor;
  final NumberParameter _padding;
  final StringParameter _text;

  /// Create a [CIAttributedTextImageGeneratorConfiguration] with default values.
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
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `4.0`.
  set scaleFactor(double value) {
    _scaleFactor.value = value;
  }

  /// The padding to apply to the text.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `0.0` to `200.0`.
  set padding(int value) {
    _padding.value = value;
  }

  /// The text to render.
  ///
  /// Defaults to ` `.
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
