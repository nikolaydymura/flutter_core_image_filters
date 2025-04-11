part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorBlendMode filter.
class CIColorBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIColorBlendModeConfiguration() : super('CIColorBlendMode');

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
