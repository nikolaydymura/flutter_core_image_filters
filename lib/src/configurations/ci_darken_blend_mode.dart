part of flutter_core_image_filters;

class CIDarkenBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIDarkenBlendModeConfiguration() : super('CIDarkenBlendMode');

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
