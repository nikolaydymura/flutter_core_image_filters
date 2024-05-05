part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBlendWithBlueMask filter.
class CIBlendWithBlueMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithBlueMaskConfiguration() : super('CIBlendWithBlueMask');

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}
