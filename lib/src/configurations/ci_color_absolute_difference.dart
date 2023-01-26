part of flutter_core_image_filters;

class CIColorAbsoluteDifferenceConfiguration extends CIFilterConfiguration
    with Image2Mixin {
  CIColorAbsoluteDifferenceConfiguration() : super('CIColorAbsoluteDifference');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn
      };
}
