part of flutter_core_image_filters;

class CIMaximumCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIMaximumCompositingConfiguration() : super('CIMaximumCompositing');

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
