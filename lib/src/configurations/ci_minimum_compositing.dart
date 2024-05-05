part of '../../flutter_core_image_filters.dart';

class CIMinimumCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIMinimumCompositingConfiguration() : super('CIMinimumCompositing');

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
