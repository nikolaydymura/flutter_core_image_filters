part of flutter_core_image_filters;

class CIOverlayBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIOverlayBlendModeConfiguration() : super('CIOverlayBlendMode');

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
