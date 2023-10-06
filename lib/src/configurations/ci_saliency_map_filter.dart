part of flutter_core_image_filters;

class CISaliencyMapFilterConfiguration extends CIFilterConfiguration {
  CISaliencyMapFilterConfiguration() : super('CISaliencyMapFilter');

  @override
  Iterable<CICategory> get categories => {
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.stylize,
      };

  @override
  List<ConfigurationParameter> get parameters => [];
}
