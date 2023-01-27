part of flutter_core_image_filters;

class CICode128BarcodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final NumberParameter _quietSpace;
  final NumberParameter _barcodeHeight;

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
        super('CICode128BarcodeGenerator');

  set quietSpace(double value) {
    _quietSpace.value = value;
  }

  set barcodeHeight(double value) {
    _barcodeHeight.value = value;
  }

  @override
  Iterable<CICategory> get categories =>
      {CICategory.generator, CICategory.stillImage, CICategory.builtIn};

  @override
  List<ConfigurationParameter> get parameters =>
      [_quietSpace, _barcodeHeight, _message];

  @override
  bool get hasInputImage => false;
}
