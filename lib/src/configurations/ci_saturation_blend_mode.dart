part of flutter_core_image_filters;

class CISaturationBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISaturationBlendModeConfiguration() : super('CISaturationBlendMode');

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
