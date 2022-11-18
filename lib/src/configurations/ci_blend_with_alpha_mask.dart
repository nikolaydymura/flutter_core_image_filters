part of flutter_core_image_filters;

class CIBlendWithAlphaMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithAlphaMaskConfiguration() : super('CIBlendWithAlphaMask');
}
