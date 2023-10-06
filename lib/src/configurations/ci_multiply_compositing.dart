part of flutter_core_image_filters;

class CIMultiplyCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIMultiplyCompositingConfiguration() : super('CIMultiplyCompositing');

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
