part of flutter_core_image_filters;

class CIMultiplyBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIMultiplyBlendModeConfiguration() : super('CIMultiplyBlendMode');

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
