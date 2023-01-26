part of flutter_core_image_filters;

class CILinearBurnBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CILinearBurnBlendModeConfiguration() : super('CILinearBurnBlendMode');

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
