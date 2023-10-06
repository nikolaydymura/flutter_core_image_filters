part of flutter_core_image_filters;

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
