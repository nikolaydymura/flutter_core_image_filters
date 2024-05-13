part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an Aztec code generator filter.
///
/// * [compactStyle] updates the `inputCompactStyle` value of filter.
/// * [correctionLevel] updates the `inputCorrectionLevel` value of filter.
/// * [layers] updates the `inputLayers` value of filter.
///
/// See also:
///
///  * [CIAztecCodeGenerator](https://developer.apple.com/documentation/coreimage/ciazteccodegenerator), which
///    defines the exact information for filter.
class CIAztecCodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final BoolParameter _compactStyle;
  final NumberParameter _correctionLevel;
  final NumberParameter _layers;

  /// Create a [CIAztecCodeGeneratorConfiguration] with default values.
  CIAztecCodeGeneratorConfiguration()
      : _compactStyle = NSBoolParameter(
          'inputCompactStyle',
          'Compact Style',
          false,
        ),
        _correctionLevel = SliderNSIntegerParameter(
          'inputCorrectionLevel',
          'Correction Level',
          23,
          min: 5,
          max: 95,
        ),
        _layers = SliderNSIntegerParameter(
          'inputLayers',
          'Layers',
          double.nan,
          min: 1,
          max: 32,
        ),
        super('CIAztecCodeGenerator');

  /// A Boolean value that determines whether the Aztec code is compact.
  ///
  /// Defaults to `false`.
  set compactStyle(bool value) {
    _compactStyle.value = value;
  }

  /// The error correction level for the Aztec code.
  ///
  /// Defaults to `23.0`.
  ///
  /// This value ranges from `5.0` to `95.0`.
  set correctionLevel(int value) {
    _correctionLevel.value = value;
  }

  /// The number of layers in the Aztec code.
  ///
  /// Defaults to `double.nan`.
  ///
  /// This value ranges from `1.0` to `32.0`.
  set layers(int value) {
    _layers.value = value;
  }

  @override
  Iterable<CICategory> get categories =>
      {CICategory.generator, CICategory.stillImage, CICategory.builtIn};

  @override
  List<ConfigurationParameter> get parameters =>
      [_compactStyle, _correctionLevel, _layers, _message];

  @override
  bool get hasInputImage => false;
}
