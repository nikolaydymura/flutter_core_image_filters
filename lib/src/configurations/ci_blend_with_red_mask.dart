part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBlendWithRedMask filter.
class CIBlendWithRedMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithRedMaskConfiguration() : super('CIBlendWithRedMask');

  @override
  Iterable<CICategory> get categories => {
    CICategory.stylize,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };
}
