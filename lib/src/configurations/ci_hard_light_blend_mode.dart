part of '../../flutter_core_image_filters.dart';

class CIHardLightBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIHardLightBlendModeConfiguration() : super('CIHardLightBlendMode');

  @override
  Iterable<CICategory> get categories => {
    CICategory.compositeOperation,
    CICategory.video,
    CICategory.stillImage,
    CICategory.interlaced,
    CICategory.nonSquarePixels,
    CICategory.builtIn,
  };
}
