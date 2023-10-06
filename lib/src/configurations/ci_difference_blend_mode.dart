part of flutter_core_image_filters;

class CIDifferenceBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIDifferenceBlendModeConfiguration() : super('CIDifferenceBlendMode');

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
