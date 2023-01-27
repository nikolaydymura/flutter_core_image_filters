part of flutter_core_image_filters;

class CILinearLightBlendModeConfiguration extends CIFilterConfiguration {
  CILinearLightBlendModeConfiguration() : super('CILinearLightBlendMode');

  @override
  Iterable<CICategory> get categories => {
        CICategory.compositeOperation,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.builtIn
      };
}
