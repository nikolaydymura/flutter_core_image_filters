part of flutter_core_image_filters;

class CIVividLightBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIVividLightBlendModeConfiguration() : super('CIVividLightBlendMode');

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
