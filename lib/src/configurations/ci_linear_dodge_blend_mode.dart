part of '../../flutter_core_image_filters.dart';

class CILinearDodgeBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CILinearDodgeBlendModeConfiguration() : super('CILinearDodgeBlendMode');

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
