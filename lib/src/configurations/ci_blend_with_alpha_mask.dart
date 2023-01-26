part of flutter_core_image_filters;

class CIBlendWithAlphaMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithAlphaMaskConfiguration() : super('CIBlendWithAlphaMask');

  @override
  Iterable<CICategory> get categories => {
        CICategory.stylize,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };
}
