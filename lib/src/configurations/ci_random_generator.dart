part of flutter_core_image_filters;

class CIRandomGeneratorConfiguration extends CIFilterConfiguration {
  CIRandomGeneratorConfiguration() : super('CIRandomGenerator');

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn
      };

  @override
  List<ConfigurationParameter> get parameters => [];

  @override
  bool get hasInputImage => false;
}
