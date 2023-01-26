part of flutter_core_image_filters;

class CIRandomGeneratorConfiguration extends CIFilterConfiguration {
  CIRandomGeneratorConfiguration() : super('CIRandomGenerator');
  @override
  List<ConfigurationParameter> get parameters => [];

  @override
  bool get hasInputImage => false;
}
