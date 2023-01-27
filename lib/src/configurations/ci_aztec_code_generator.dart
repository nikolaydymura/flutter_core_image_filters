part of flutter_core_image_filters;

class CIAztecCodeGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _compactStyle;
  final NumberParameter _correctionLevel;
  final NumberParameter _layers;
  final DataParameter _message;

  CIAztecCodeGeneratorConfiguration()
      : _compactStyle = SliderNSNumberParameter(
          'inputCompactStyle',
          'Compact Style',
          0,
          min: 0,
          max: 1,
        ),
        _correctionLevel = SliderNSNumberParameter(
          'inputCorrectionLevel',
          'Correction Level',
          23,
          min: 5,
          max: 95,
        ),
        _layers = SliderNSNumberParameter(
          'inputLayers',
          'Layers',
          1,
          min: 1,
          max: 32,
        ),
        _message = NSDataParameter('inputMessage', 'Message'),
        super('CIAztecCodeGenerator');

  set compactStyle(double value) {
    _compactStyle.value = value;
  }

  set correctionLevel(double value) {
    _correctionLevel.value = value;
  }

  set layers(double value) {
    _layers.value = value;
  }

  set messageData(Uint8List value) {
    _message.data = value;
    _message.asset = null;
    _message.file = null;
  }

  set messageAsset(String value) {
    _message.data = null;
    _message.asset = value;
    _message.file = null;
  }

  set messageFile(File value) {
    _message.data = null;
    _message.asset = null;
    _message.file = value;
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
