part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIBlendWithAlphaMask filter.
class CIBlendWithAlphaMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithAlphaMaskConfiguration() : super('CIBlendWithAlphaMask');

  @override
  Iterable<CICategory> get categories => {
    CICategory.stylize,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };
}
