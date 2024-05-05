part of '../../flutter_core_image_filters.dart';

class CISourceOverCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISourceOverCompositingConfiguration() : super('CISourceOverCompositing');

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
