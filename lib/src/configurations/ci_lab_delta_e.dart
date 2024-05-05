part of '../../flutter_core_image_filters.dart';

class CILabDeltaEConfiguration extends CIFilterConfiguration with Image2Mixin {
  CILabDeltaEConfiguration() : super('CILabDeltaE');

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
