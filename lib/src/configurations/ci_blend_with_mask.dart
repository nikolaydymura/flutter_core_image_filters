part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBlendWithMask filter.
class CIBlendWithMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithMaskConfiguration() : super('CIBlendWithMask');

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}
