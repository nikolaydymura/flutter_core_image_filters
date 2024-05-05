part of '../../flutter_core_image_filters.dart';

class CIHueBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIHueBlendModeConfiguration() : super('CIHueBlendMode');

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
