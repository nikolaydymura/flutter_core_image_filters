part of flutter_core_image_filters;

class CIBarcodeGeneratorConfiguration extends CIFilterConfiguration {
  CIBarcodeGeneratorConfiguration() : super('CIBarcodeGenerator');

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [];

  @override
  bool get hasInputImage => false;
}
