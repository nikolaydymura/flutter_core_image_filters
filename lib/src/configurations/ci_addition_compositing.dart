part of flutter_core_image_filters;

class CIAdditionCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIAdditionCompositingConfiguration() : super('CIAdditionCompositing');

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
