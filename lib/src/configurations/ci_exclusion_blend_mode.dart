part of flutter_core_image_filters;

class CIExclusionBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIExclusionBlendModeConfiguration() : super('CIExclusionBlendMode');

  @override
  Iterable<CICategory> get categories => {
        CICategory.compositeOperation,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.builtIn,
      };
}
