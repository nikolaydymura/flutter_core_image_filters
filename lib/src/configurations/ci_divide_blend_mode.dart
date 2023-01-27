part of flutter_core_image_filters;

class CIDivideBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIDivideBlendModeConfiguration() : super('CIDivideBlendMode');

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
