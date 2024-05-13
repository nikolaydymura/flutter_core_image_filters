part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a QR code generator filter.
///
/// * [correctionLevel] updates the `inputCorrectionLevel` value of filter.
///
/// See also:
///
///  * [CIQRCodeGenerator](https://developer.apple.com/documentation/coreimage/ciqrcodegenerator), which
///    defines the exact information for filter.
class CIQRCodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final StringParameter _correctionLevel;

  /// Create a [CIQRCodeGeneratorConfiguration] with default values.
  CIQRCodeGeneratorConfiguration()
      : _correctionLevel = NSStringParameter(
          'inputCorrectionLevel',
          'Correction Level',
          'M',
        ),
        super('CIQRCodeGenerator');

  @override
  bool get hasInputImage => false;

  /// The QR code correction level: L, M, Q, or H.
  ///
  /// Defaults to `M`.
  set correctionLevel(String value) {
    _correctionLevel.value = value;
  }

  @override
  Iterable<CICategory> get categories =>
      {CICategory.generator, CICategory.stillImage, CICategory.builtIn};

  @override
  List<ConfigurationParameter> get parameters => [_correctionLevel, _message];
}
