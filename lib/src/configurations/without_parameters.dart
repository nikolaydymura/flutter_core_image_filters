part of '../../flutter_core_image_filters.dart';

class CIColorInvertConfiguration extends CIFilterConfiguration {
  CIColorInvertConfiguration() : super('CIColorInvert');
  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}

class CIColorThresholdOtsuConfiguration extends CIFilterConfiguration {
  CIColorThresholdOtsuConfiguration() : super('CIColorThresholdOtsu');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
      };
}

class CIDepthToDisparityConfiguration extends CIFilterConfiguration {
  CIDepthToDisparityConfiguration() : super('CIDepthToDisparity');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };
}

class CIDisparityToDepthConfiguration extends CIFilterConfiguration {
  CIDisparityToDepthConfiguration() : super('CIDisparityToDepth');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
      };
}

class CILinearToSRGBToneCurveConfiguration extends CIFilterConfiguration {
  CILinearToSRGBToneCurveConfiguration() : super('CILinearToSRGBToneCurve');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}

class CIMaskToAlphaConfiguration extends CIFilterConfiguration {
  CIMaskToAlphaConfiguration() : super('CIMaskToAlpha');

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

class CIMaximumComponentConfiguration extends CIFilterConfiguration {
  CIMaximumComponentConfiguration() : super('CIMaximumComponent');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}

class CIMedianFilterConfiguration extends CIFilterConfiguration {
  CIMedianFilterConfiguration() : super('CIMedianFilter');

  @override
  Iterable<CICategory> get categories => {
        CICategory.blur,
        CICategory.stillImage,
        CICategory.video,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };
}

class CIMinimumComponentConfiguration extends CIFilterConfiguration {
  CIMinimumComponentConfiguration() : super('CIMinimumComponent');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}

class CIPhotoEffectChromeConfiguration extends CIFilterConfiguration {
  CIPhotoEffectChromeConfiguration() : super('CIPhotoEffectChrome');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectFadeConfiguration extends CIFilterConfiguration {
  CIPhotoEffectFadeConfiguration() : super('CIPhotoEffectFade');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectInstantConfiguration extends CIFilterConfiguration {
  CIPhotoEffectInstantConfiguration() : super('CIPhotoEffectInstant');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectMonoConfiguration extends CIFilterConfiguration {
  CIPhotoEffectMonoConfiguration() : super('CIPhotoEffectMono');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectNoirConfiguration extends CIFilterConfiguration {
  CIPhotoEffectNoirConfiguration() : super('CIPhotoEffectNoir');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectProcessConfiguration extends CIFilterConfiguration {
  CIPhotoEffectProcessConfiguration() : super('CIPhotoEffectProcess');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectTonalConfiguration extends CIFilterConfiguration {
  CIPhotoEffectTonalConfiguration() : super('CIPhotoEffectTonal');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CIPhotoEffectTransferConfiguration extends CIFilterConfiguration {
  CIPhotoEffectTransferConfiguration() : super('CIPhotoEffectTransfer');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorEffect,
        CICategory.video,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.xmpSerializable,
      };
}

class CISRGBToneCurveToLinearConfiguration extends CIFilterConfiguration {
  CISRGBToneCurveToLinearConfiguration() : super('CISRGBToneCurveToLinear');

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };
}

class CIThermalConfiguration extends CIFilterConfiguration {
  CIThermalConfiguration() : super('CIThermal');

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

class CIXRayConfiguration extends CIFilterConfiguration {
  CIXRayConfiguration() : super('CIXRay');

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
