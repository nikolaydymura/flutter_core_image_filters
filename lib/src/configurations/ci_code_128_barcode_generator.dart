part of flutter_core_image_filters;

class CICode128BarcodeGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _quietSpace;
  final NumberParameter _barcodeHeight;
  final DataParameter _message;

  CICode128BarcodeGeneratorConfiguration()
      : _quietSpace = SliderNSNumberParameter(
          'inputQuietSpace',
          'Quiet Space',
          10,
          min: 0,
          max: 20,
        ),
        _barcodeHeight = SliderNSNumberParameter(
          'inputBarcodeHeight',
          'Barcode Height',
          32,
          min: 1,
          max: 50,
        ),
        _message = NSDataParameter('inputMessage', 'Message'),
        super('CICode128BarcodeGenerator');

  set quietSpace(double value) {
    _quietSpace.value = value;
  }

  set barcodeHeight(double value) {
    _barcodeHeight.value = value;
  }

  set messageData(Uint8List value) {
    _message.data = value;
    _message.asset = null;
    _message.file = null;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_quietSpace, _barcodeHeight, _message];

  @override
  bool get hasInputImage => false;
}
