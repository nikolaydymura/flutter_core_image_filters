part of '../../flutter_core_image_filters.dart';

class CILuminosityBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CILuminosityBlendModeConfiguration() : super('CILuminosityBlendMode');

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
