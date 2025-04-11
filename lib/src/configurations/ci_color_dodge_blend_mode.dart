part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorDodgeBlendMode filter.
class CIColorDodgeBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIColorDodgeBlendModeConfiguration() : super('CIColorDodgeBlendMode');

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
