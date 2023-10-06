part of flutter_core_image_filters;

class CIColorMapConfiguration extends CIFilterConfiguration
    with GradientImageMixin {
  CIColorMapConfiguration() : super('CIColorMap');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
      };
}
