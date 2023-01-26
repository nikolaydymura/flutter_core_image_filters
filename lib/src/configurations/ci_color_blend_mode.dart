part of flutter_core_image_filters;

class CIColorBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIColorBlendModeConfiguration() : super('CIColorBlendMode');

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
