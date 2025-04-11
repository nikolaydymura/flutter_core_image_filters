part of '../../flutter_core_image_filters.dart';

class CISourceOutCompositingConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISourceOutCompositingConfiguration() : super('CISourceOutCompositing');

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
