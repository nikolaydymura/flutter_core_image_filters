part of '../../flutter_core_image_filters.dart';

enum CICategory {
  transition,
  video,
  stillImage,
  builtIn,
  highDynamicRange,
  compositeOperation,
  interlaced,
  nonSquarePixels,
  stylize,
  colorAdjustment,
  colorEffect,
  tileEffect,
  reduction,
  generator,
  geometryAdjustment,
  blur,
  distortionEffect,
  halftoneEffect,
  xmpSerializable,
  gradient,
  sharpen
}

extension CICategoryX on CICategory {
  String get displayName {
    switch (this) {
      case CICategory.transition:
        return 'CICategoryTransition';
      case CICategory.video:
        return 'CICategoryVideo';
      case CICategory.stillImage:
        return 'CICategoryStillImage';
      case CICategory.builtIn:
        return 'CICategoryBuiltIn';
      case CICategory.highDynamicRange:
        return 'CICategoryHighDynamicRange';
      case CICategory.compositeOperation:
        return 'CICategoryCompositeOperation';
      case CICategory.interlaced:
        return 'CICategoryInterlaced';
      case CICategory.nonSquarePixels:
        return 'CICategoryNonSquarePixels';
      case CICategory.stylize:
        return 'CICategoryStylize';
      case CICategory.colorAdjustment:
        return 'CICategoryColorAdjustment';
      case CICategory.colorEffect:
        return 'CICategoryColorEffect';
      case CICategory.tileEffect:
        return 'CICategoryTileEffect';
      case CICategory.reduction:
        return 'CICategoryReduction';
      case CICategory.generator:
        return 'CICategoryGenerator';
      case CICategory.geometryAdjustment:
        return 'CICategoryGeometryAdjustment';
      case CICategory.blur:
        return 'CICategoryBlur';
      case CICategory.distortionEffect:
        return 'CICategoryDistortionEffect';
      case CICategory.halftoneEffect:
        return 'CICategoryHalftoneEffect';
      case CICategory.xmpSerializable:
        return 'CICategoryXMPSerializable';
      case CICategory.gradient:
        return 'CICategoryGradient';
      case CICategory.sharpen:
        return 'CICategorySharpen';
    }
  }
}
