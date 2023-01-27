part of flutter_core_image_filters;

class CIQRCodeGeneratorConfiguration extends CIFilterConfiguration {
  final StringParameter _correctionLevel;
  final DataParameter _message;

  CIQRCodeGeneratorConfiguration()
      : _correctionLevel = NSStringParameter(
          'inputCorrectionLevel',
          'CorrectionLevel',
          'M',
        ),
        _message = NSDataParameter(
          'inputMessage',
          'Message',
        ),
        super('CIQRCodeGenerator');

  @override
  bool get hasInputImage => false;

  set correctionLevel(String value) {
    _correctionLevel.value = value;
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
  List<ConfigurationParameter> get parameters => [_correctionLevel, _message];
}