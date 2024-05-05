part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAztecCodeGenerator filter.
class CIAztecCodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final BoolParameter _compactStyle;
  final NumberParameter _correctionLevel;
  final NumberParameter _layers;

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
  set compactStyle(bool value) {
    _compactStyle.value = value;
  }

  /// The error correction level for the Aztec code.
  ///
  /// This value ranges from 5 to 95.
  set correctionLevel(int value) {
    _correctionLevel.value = value;
  }

  /// The number of layers in the Aztec code.
  ///
  /// This value ranges from 1 to 32.
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
