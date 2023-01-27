part of flutter_core_image_filters;

class CIQRCodeGeneratorConfiguration extends CIFilterConfiguration
    with MessageMixin {
  final StringParameter _correctionLevel;

  CIQRCodeGeneratorConfiguration()
      : _correctionLevel = NSStringParameter(
          'inputCorrectionLevel',
          'Correction Level',
          'M',
        ),
        super('CIQRCodeGenerator');

  @override
  bool get hasInputImage => false;

  set correctionLevel(String value) {
    _correctionLevel.value = value;
  }

  @override
  Iterable<CICategory> get categories =>
      {CICategory.generator, CICategory.stillImage, CICategory.builtIn};

  @override
  List<ConfigurationParameter> get parameters => [_correctionLevel, _message];
}
