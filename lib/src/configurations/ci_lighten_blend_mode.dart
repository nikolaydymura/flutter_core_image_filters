part of '../../flutter_core_image_filters.dart';

class CILightenBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CILightenBlendModeConfiguration() : super('CILightenBlendMode');

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
