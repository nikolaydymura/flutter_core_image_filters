part of flutter_core_image_filters;

class CISubtractBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISubtractBlendModeConfiguration() : super('CISubtractBlendMode');

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
