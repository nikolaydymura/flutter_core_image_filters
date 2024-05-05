part of '../../flutter_core_image_filters.dart';

class CISoftLightBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CISoftLightBlendModeConfiguration() : super('CISoftLightBlendMode');

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
