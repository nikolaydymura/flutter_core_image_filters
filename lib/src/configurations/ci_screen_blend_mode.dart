part of '../../flutter_core_image_filters.dart';

class CIScreenBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIScreenBlendModeConfiguration() : super('CIScreenBlendMode');

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
