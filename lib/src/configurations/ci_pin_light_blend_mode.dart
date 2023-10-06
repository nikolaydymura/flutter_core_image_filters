part of flutter_core_image_filters;

class CIPinLightBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIPinLightBlendModeConfiguration() : super('CIPinLightBlendMode');

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
