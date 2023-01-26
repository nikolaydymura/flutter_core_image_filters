import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

class FilterItem {
  final String name;
  final CIFilterConfiguration configuration;

  FilterItem(this.name, this.configuration);
}

final kFilters = [
  FilterItem(
    'White Point Adjust',
    FlutterCoreImageFilters.createFilter<CIWhitePointAdjustConfiguration>(
      displayName: 'White Point Adjust',
    )..color = const Color.fromRGBO(1, 1, 1, 1.0),
  ),
/*  FilterItem(
    'Spot Color',
    FlutterCoreImageFilters.createFilter<CISpotColorConfiguration>(
      displayName: 'Spot Color',
    )
      ..color0 = const Color.fromRGBO(0, 0, 0, 1.0)
      ..color1 = const Color.fromRGBO(0, 0, 0, 1.0),
  ),
*/
  FilterItem(
    'False Color',
    FlutterCoreImageFilters.createFilter<CIFalseColorConfiguration>(
      displayName: 'False Color',
    )
      ..color0 = const Color.fromRGBO(0, 0, 0, 1.0)
      ..color1 = const Color.fromRGBO(0, 0, 0, 1.0),
  ),
  FilterItem(
    'Constant Color',
    FlutterCoreImageFilters.createFilter<CIConstantColorGeneratorConfiguration>(
      displayName: 'Constant Color',
    )..color = const Color.fromRGBO(1, 0, 0, 1.0),
  ),
  FilterItem(
    'Color Monochrome',
    FlutterCoreImageFilters.createFilter<CIColorMonochromeConfiguration>(
      displayName: 'Color Monochrome',
    )
      ..intensity = 0.5
      ..color = const Color.fromRGBO(100, 70, 34, 0.5),
  ),
  FilterItem(
    'X-Ray',
    FlutterCoreImageFilters.createFilter<CIXRayConfiguration>(
      displayName: 'X-Ray',
    ),
  ),
  FilterItem(
    'Vignette',
    FlutterCoreImageFilters.createFilter<CIVignetteConfiguration>(
      displayName: 'Vignette',
    )
      ..intensity = 1
      ..radius = 1,
  ),
  FilterItem(
    'Vibrance',
    FlutterCoreImageFilters.createFilter<CIVibranceConfiguration>(
      displayName: 'Vibrance',
    )..amount = 1,
  ),
  FilterItem(
    'Unsharp Mask',
    FlutterCoreImageFilters.createFilter<CIUnsharpMaskConfiguration>(
      displayName: 'Unsharp Mask',
    )
      ..radius = 50
      ..intensity = 0.5,
  ),
  FilterItem(
    'Thermal',
    FlutterCoreImageFilters.createFilter<CIThermalConfiguration>(
      displayName: 'Thermal',
    ),
  ),
  FilterItem(
    'Straighten',
    FlutterCoreImageFilters.createFilter<CIStraightenFilterConfiguration>(
      displayName: 'Straighten',
    )..angle = 3.14,
  ),
  FilterItem(
    'sRGB Tone Curve to Linear',
    FlutterCoreImageFilters.createFilter<CISRGBToneCurveToLinearConfiguration>(
      displayName: 'sRGB Tone Curve to Linear',
    ),
  ),
  FilterItem(
    'Sharpen Luminance',
    FlutterCoreImageFilters.createFilter<CISharpenLuminanceConfiguration>(
      displayName: 'Sharpen Luminance',
    )
      ..sharpness = 1
      ..radius = 10,
  ),
  FilterItem(
    'Sample Nearest',
    FlutterCoreImageFilters.createFilter<CISampleNearestConfiguration>(
      displayName: 'Sample Nearest',
    ),
  ),
  FilterItem(
    'Saliency Map Filter',
    FlutterCoreImageFilters.createFilter<CISaliencyMapFilterConfiguration>(
      displayName: 'Saliency Map Filter',
    ),
  ),
  /* FilterItem(
    'Random Generator',
    FlutterCoreImageFilters.createFilter<CIRandomGeneratorConfiguration>(
      displayName: 'Random Generator',
    ),
  ),
 */
  FilterItem(
    'Photo Effect Transfer',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectTransferConfiguration>(
      displayName: 'Photo Effect Transfer',
    ),
  ),
  FilterItem(
    'Photo Effect Tonal',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectTonalConfiguration>(
      displayName: 'Photo Effect Tonal',
    ),
  ),
  FilterItem(
    'Photo Effect Process',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectProcessConfiguration>(
      displayName: 'Photo Effect Process',
    ),
  ),
  FilterItem(
    'Photo Effect Mono',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectMonoConfiguration>(
      displayName: 'Photo Effect Mono',
    ),
  ),
  FilterItem(
    'Photo Effect Instant',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectInstantConfiguration>(
      displayName: 'Photo Effect Instant',
    ),
  ),
  FilterItem(
    'Photo Effect Fade',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectFadeConfiguration>(
      displayName: 'Photo Effect Fade',
    ),
  ),
  FilterItem(
    'Photo Effect Chrome',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectChromeConfiguration>(
      displayName: 'Photo Effect Chrome',
    ),
  ),
  FilterItem(
    'Perspective Rotate',
    FlutterCoreImageFilters.createFilter<CIPerspectiveRotateConfiguration>(
      displayName: 'Perspective Rotate',
    )
      ..focalLength = 10
      ..roll = 0
      ..pitch = 0
      ..yaw = 0,
  ),
  /*  FilterItem(
    'Person Segmentation',
    FlutterCoreImageFilters.createFilter<CIPersonSegmentationConfiguration>(
      displayName: 'Person Segmentation',
    ),
  ),
 */
  FilterItem(
    'Noise Reduction',
    FlutterCoreImageFilters.createFilter<CINoiseReductionConfiguration>(
      displayName: 'Noise Reduction',
    )
      ..noiseLevel = 0.06
      ..sharpness = 1,
  ),
  FilterItem(
    'Motion Blur',
    FlutterCoreImageFilters.createFilter<CIMotionBlurConfiguration>(
      displayName: 'Motion Blur',
    )
      ..radius = 60
      ..angle = 1,
  ),
  FilterItem(
    'Morphology Rectangle Minimum',
    FlutterCoreImageFilters.createFilter<
        CIMorphologyRectangleMinimumConfiguration>(
      displayName: 'Morphology Rectangle Minimum',
    )
      ..height = 25
      ..width = 25,
  ),
  FilterItem(
    'Morphology Rectangle Maximum',
    FlutterCoreImageFilters.createFilter<
        CIMorphologyRectangleMaximumConfiguration>(
      displayName: 'Morphology Rectangle Maximum',
    )
      ..height = 25
      ..width = 25,
  ),
  FilterItem(
    'Morphology Minimum',
    FlutterCoreImageFilters.createFilter<CIMorphologyMinimumConfiguration>(
      displayName: 'Morphology Minimum',
    )..radius = 25,
  ),
  FilterItem(
    'Morphology Maximum',
    FlutterCoreImageFilters.createFilter<CIMorphologyMaximumConfiguration>(
      displayName: 'Morphology Maximum',
    )..radius = 25,
  ),
  FilterItem(
    'Morphology Gradient',
    FlutterCoreImageFilters.createFilter<CIMorphologyGradientConfiguration>(
      displayName: 'Morphology Gradient',
    )..radius = 25,
  ),
  FilterItem(
    'Minimum Component',
    FlutterCoreImageFilters.createFilter<CIMinimumComponentConfiguration>(
      displayName: 'Minimum Component',
    ),
  ),
  FilterItem(
    'Median',
    FlutterCoreImageFilters.createFilter<CIMedianFilterConfiguration>(
      displayName: 'Median',
    ),
  ),
  FilterItem(
    'Maximum Component',
    FlutterCoreImageFilters.createFilter<CIMaximumComponentConfiguration>(
      displayName: 'Maximum Component',
    ),
  ),
  FilterItem(
    'Mask to Alpha',
    FlutterCoreImageFilters.createFilter<CIMaskToAlphaConfiguration>(
      displayName: 'Mask to Alpha',
    ),
  ),
  FilterItem(
    'Line Overlay',
    FlutterCoreImageFilters.createFilter<CILineOverlayConfiguration>(
      displayName: 'Line Overlay',
    )
      ..noiseLevel = 0.065
      ..contrast = 100
      ..threshold = 0.5
      ..edgeIntensity = 100
      ..nrSharpness = 1,
  ),
  FilterItem(
    'Linear to sRGB Tone Curve',
    FlutterCoreImageFilters.createFilter<CILinearToSRGBToneCurveConfiguration>(
      displayName: 'Linear to sRGB Tone Curve',
    ),
  ),
  FilterItem(
    'Lanczos Scale Transform',
    FlutterCoreImageFilters.createFilter<CILanczosScaleTransformConfiguration>(
      displayName: 'Lanczos Scale Transform',
    )
      ..scale = 1
      ..aspectRatio = 1,
  ),
  FilterItem(
    'Hue Adjust',
    FlutterCoreImageFilters.createFilter<CIHueAdjustConfiguration>(
      displayName: 'Hue Adjust',
    )..angle = 1,
  ),
  FilterItem(
    'Histogram Display',
    FlutterCoreImageFilters.createFilter<CIHistogramDisplayFilterConfiguration>(
      displayName: 'Histogram Display',
    )
      ..lowLimit = 0.5
      ..highLimit = 0.5
      ..height = 50,
  ),
  FilterItem(
    'Highlight and Shadow Adjust',
    FlutterCoreImageFilters.createFilter<CIHighlightShadowAdjustConfiguration>(
      displayName: 'Highlight and Shadow Adjust',
    )
      ..highlightAmount = 0.5
      ..radius = 5
      ..shadowAmount = 0,
  ),
  FilterItem(
    'Height Field From Mask',
    FlutterCoreImageFilters.createFilter<CIHeightFieldFromMaskConfiguration>(
      displayName: 'Height Field From Mask',
    )..radius = 150,
  ),
  FilterItem(
    'Gloom',
    FlutterCoreImageFilters.createFilter<CIGloomConfiguration>(
      displayName: 'Gloom',
    )
      ..radius = 50
      ..intensity = 0.5,
  ),
  FilterItem(
    'Gaussian Blur',
    FlutterCoreImageFilters.createFilter<CIGaussianBlurConfiguration>(
      displayName: 'Gaussian Blur',
    )..radius = 50,
  ),
  FilterItem(
    'Gamma Adjust',
    FlutterCoreImageFilters.createFilter<CIGammaAdjustConfiguration>(
      displayName: 'Gamma Adjust',
    )..power = 2,
  ),
  FilterItem(
    'Gabor Gradients',
    FlutterCoreImageFilters.createFilter<CIGaborGradientsConfiguration>(
      displayName: 'Gabor Gradients',
    ),
  ),
  FilterItem(
    'Exposure Adjust',
    FlutterCoreImageFilters.createFilter<CIExposureAdjustConfiguration>(
      displayName: 'Exposure Adjust',
    )..eV = 0,
  ),
  FilterItem(
    'Edge Work',
    FlutterCoreImageFilters.createFilter<CIEdgeWorkConfiguration>(
      displayName: 'Edge Work',
    )..radius = 12,
  ),
  FilterItem(
    'Edges',
    FlutterCoreImageFilters.createFilter<CIEdgesConfiguration>(
      displayName: 'Edges',
    )..intensity = 5,
  ),
  FilterItem(
    'Document Enhancer',
    FlutterCoreImageFilters.createFilter<CIDocumentEnhancerConfiguration>(
      displayName: 'Document Enhancer',
    )..amount = 1,
  ),
  FilterItem(
    'Dither',
    FlutterCoreImageFilters.createFilter<CIDitherConfiguration>(
      displayName: 'Dither',
    )..intensity = 0.5,
  ),
  FilterItem(
    'Disparity To Depth',
    FlutterCoreImageFilters.createFilter<CIDisparityToDepthConfiguration>(
      displayName: 'Disparity To Depth',
    ),
  ),
  FilterItem(
    'Disc Blur',
    FlutterCoreImageFilters.createFilter<CIDiscBlurConfiguration>(
      displayName: 'Disc Blur',
    )..radius = 50,
  ),
  FilterItem(
    'Depth To Disparity',
    FlutterCoreImageFilters.createFilter<CIDepthToDisparityConfiguration>(
      displayName: 'Depth To Disparity',
    ),
  ),
  /* FilterItem(
    'Convert Lab to RGB',
    FlutterCoreImageFilters.createFilter<CIConvertLabToRGBConfiguration>(
      displayName: 'Convert Lab to RGB',
    ),
  ),
*/
  FilterItem(
    'Comic Effect',
    FlutterCoreImageFilters.createFilter<CIComicEffectConfiguration>(
      displayName: 'Comic Effect',
    ),
  ),
  FilterItem(
    'Color Threshold Otsu',
    FlutterCoreImageFilters.createFilter<CIColorThresholdOtsuConfiguration>(
      displayName: 'Color Threshold Otsu',
    ),
  ),
  FilterItem(
    'Color Threshold',
    FlutterCoreImageFilters.createFilter<CIColorThresholdConfiguration>(
      displayName: 'Color Threshold',
    )..threshold = 0.5,
  ),
  FilterItem(
    'Color Posterize',
    FlutterCoreImageFilters.createFilter<CIColorPosterizeConfiguration>(
      displayName: 'Color Posterize',
    )..levels = 16,
  ),
  FilterItem(
    'Color Invert',
    FlutterCoreImageFilters.createFilter<CIColorInvertConfiguration>(
      displayName: 'Color Invert',
    ),
  ),
  FilterItem(
    'Color Controls',
    FlutterCoreImageFilters.createFilter<CIColorControlsConfiguration>(
      displayName: 'Color Controls',
    )
      ..brightness = 0
      ..saturation = 1
      ..contrast = 2,
  ),
  FilterItem(
    'Box Blur',
    FlutterCoreImageFilters.createFilter<CIBoxBlurConfiguration>(
      displayName: 'Box Blur',
    )..radius = 50,
  ),
  FilterItem(
    'Bokeh Blur',
    FlutterCoreImageFilters.createFilter<CIBokehBlurConfiguration>(
      displayName: 'Bokeh Blur',
    )
      ..softness = 5
      ..ringSize = 0.1
      ..radius = 260
      ..ringAmount = 0.5,
  ),
  FilterItem(
    'Bloom',
    FlutterCoreImageFilters.createFilter<CIBloomConfiguration>(
      displayName: 'Bloom',
    )
      ..radius = 50
      ..intensity = 0.5,
  ),
  FilterItem(
    'Bicubic Scale Transform',
    FlutterCoreImageFilters.createFilter<CIBicubicScaleTransformConfiguration>(
      displayName: 'Bicubic Scale Transform',
    )
      ..b = 0.5
      ..scale = 50
      ..c = 0.5
      ..aspectRatio = 1,
  ),
  FilterItem(
    'Sepia Tone',
    FlutterCoreImageFilters.createFilter<CISepiaToneConfiguration>(
      displayName: 'Sepia Tone',
    )..intensity = 0.5,
  ),
  FilterItem(
    'Photo Effect Noir',
    FlutterCoreImageFilters.createFilter<CIPhotoEffectNoirConfiguration>(
      displayName: 'Photo Effect Noir',
    ),
  ),
  FilterItem(
    'Color Monochrome',
    FlutterCoreImageFilters.createFilter<CIColorMonochromeConfiguration>(
      displayName: 'Color Monochrome',
    )
      ..intensity = 0.5
      ..color = Colors.orange,
  )
].whereType<FilterItem>().toList();
