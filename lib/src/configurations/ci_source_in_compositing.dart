part of flutter_core_image_filters;

class CISourceInCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISourceInCompositingConfiguration() : super('CISourceInCompositing');

  @override
  Iterable<CICategory> get categories => {
        CICategory.compositeOperation,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };
}
