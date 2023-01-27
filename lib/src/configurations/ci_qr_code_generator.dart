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

  set correctionLevel(String value) {
    _correctionLevel.value = value;
  }

  set message(Uint8List value) {
    _message.data = value;
    _message.asset = null;
    _message.file = null;
  }

  @override
  List<ConfigurationParameter> get parameters => [_correctionLevel, _message];
}
