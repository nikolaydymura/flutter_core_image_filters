part of flutter_core_image_filters;

class CIBlendWithMaskConfiguration extends CIFilterConfiguration
    with BackgroundImageMixin, MaskImageMixin {
  CIBlendWithMaskConfiguration() : super('CIBlendWithMask');
}
