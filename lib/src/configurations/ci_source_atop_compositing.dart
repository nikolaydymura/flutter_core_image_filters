part of flutter_core_image_filters;

class CISourceAtopCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISourceAtopCompositingConfiguration() : super('CISourceAtopCompositing');

  @override
  Iterable<CICategory> get categories => {
        CICategory.compositeOperation,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}
