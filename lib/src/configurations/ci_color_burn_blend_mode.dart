part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIColorBurnBlendMode filter.
class CIColorBurnBlendModeConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin {
  CIColorBurnBlendModeConfiguration() : super('CIColorBurnBlendMode');

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
