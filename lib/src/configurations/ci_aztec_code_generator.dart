part of flutter_core_image_filters;

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

  set compactStyle(bool value) {
    _compactStyle.value = value;
  }

  set correctionLevel(int value) {
    _correctionLevel.value = value;
  }

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
