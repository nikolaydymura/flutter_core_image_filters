
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

class FilterItem {
  final String name;
  final CIFilterConfiguration configuration;

  FilterItem(this.name, this.configuration);
}

final kFilters = [
  FilterItem(
    'Zoom Blur',
    FlutterCoreImageFilters.createFilter<CIZoomBlurConfiguration>(
      displayName: 'Zoom Blur',
    )
      ..amount = 100
      ..center = const Point(300.0, 300.0),
  ),
  FilterItem(
    'Vortex Distortion',
    FlutterCoreImageFilters.createFilter<CIVortexDistortionConfiguration>(
      displayName: 'Vortex Distortion',
    )
      ..angle = 48
      ..center = const Point(75.0, 75.0)
      ..radius = 400,
  ),
  FilterItem(
    'Vignette Effect',
    FlutterCoreImageFilters.createFilter<CIVignetteEffectConfiguration>(
      displayName: 'Vignette Effect',
    )
      ..falloff = 0.5
      ..intensity = 1
      ..center = const Point(75.0, 75.0)
      ..radius = 1000,
  ),
  FilterItem(
    'Torus Lens Distortion',
    FlutterCoreImageFilters.createFilter<CITorusLensDistortionConfiguration>(
      displayName: 'Torus Lens Distortion',
    )
      ..width = 100
      ..center = const Point(80.0, 80.0)
      ..refraction = 3.4
      ..radius = 320,
  ),
  FilterItem(
    'Tone Curve',
    FlutterCoreImageFilters.createFilter<CIToneCurveConfiguration>(
      displayName: 'Tone Curve',
    )
      ..point0 = const Point(10.0, 10.0)
      ..point1 = const Point(25.0, 25.0)
      ..point2 = const Point(58.0, 58.0)
      ..point3 = const Point(44.0, 44.0)
      ..point4 = const Point(11.0, 11.0),
  ),
  FilterItem(
    'Temperature and Tint',
    FlutterCoreImageFilters.createFilter<CITemperatureAndTintConfiguration>(
      displayName: 'Temperature and Tint',
    )
      ..targetNeutral = const Point(3000.0, 100.0)
      ..neutral = const Point(3000.0, 100.0),
  ),
  FilterItem(
    'Pointillize',
    FlutterCoreImageFilters.createFilter<CIPointillizeConfiguration>(
      displayName: 'Pointillize',
    )
      ..radius = 50
      ..center = const Point(80.0, 80.0),
  ),
  FilterItem(
    'Pixelate',
    FlutterCoreImageFilters.createFilter<CIPixellateConfiguration>(
      displayName: 'Pixelate',
    )
      ..center = const Point(80.0, 80.0)
      ..scale = 50,
  ),
  FilterItem(
    'Nine Part Tiled',
    FlutterCoreImageFilters.createFilter<CINinePartTiledConfiguration>(
      displayName: 'Nine Part Tiled',
    )
      ..breakpoint1 = const Point(75.0, 75.0)
      ..breakpoint0 = const Point(25.0, 25.0)
      ..flipYTiles = false
      ..growAmount = const Point(50.0, 50.0),
  ),
  FilterItem(
    'Nine Part Stretched',
    FlutterCoreImageFilters.createFilter<CINinePartStretchedConfiguration>(
      displayName: 'Nine Part Stretched',
    )
      ..breakpoint1 = const Point(75.0, 75.0)
      ..growAmount = const Point(50.0, 50.0)
      ..breakpoint0 = const Point(25.0, 25.0),
  ),
  FilterItem(
    'Line Screen',
    FlutterCoreImageFilters.createFilter<CILineScreenConfiguration>(
      displayName: 'Line Screen',
    )
      ..sharpness = 0.5
      ..center = const Point(75.0, 75.0)
      ..angle = 3.14
      ..width = 24,
  ),
  FilterItem(
    'Horizontal Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionHorizontalConfiguration>(
      displayName: 'Horizontal Keystone Correction',
    )
      ..topRight = const Point(75.0, 75.0)
      ..topLeft = const Point(150.0, 150.0)
      ..bottomLeft = const Point(75.0, 75.0)
      ..bottomRight = const Point(150.0, 150.0)
      ..focalLength = 14,
  ),
  FilterItem(
    'Hexagonal Pixelate',
    FlutterCoreImageFilters.createFilter<CIHexagonalPixellateConfiguration>(
      displayName: 'Hexagonal Pixelate',
    )
      ..scale = 50
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    'Hatched Screen',
    FlutterCoreImageFilters.createFilter<CIHatchedScreenConfiguration>(
      displayName: 'Hatched Screen',
    )
      ..width = 25
      ..sharpness = 0.5
      ..center = const Point(75.0, 75.0)
      ..angle = 3.14,
  ),
  FilterItem(
    'Dot Screen',
    FlutterCoreImageFilters.createFilter<CIDotScreenConfiguration>(
      displayName: 'Dot Screen',
    )
      ..angle = 3.14
      ..width = 24
      ..sharpness = 0.5
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    'Depth of Field',
    FlutterCoreImageFilters.createFilter<CIDepthOfFieldConfiguration>(
      displayName: 'Depth of Field',
    )
      ..point1 = const Point(150.0, 150.0)
      ..unsharpMaskRadius = 5
      ..saturation = 4.5
      ..radius = 24
      ..unsharpMaskIntensity = 5
      ..point0 = const Point(300.0, 150.0),
  ),
  FilterItem(
    'Crystallize',
    FlutterCoreImageFilters.createFilter<CICrystallizeConfiguration>(
      displayName: 'Crystallize',
    )
      ..radius = 60
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    'Crop',
    FlutterCoreImageFilters.createFilter<CICropConfiguration>(
      displayName: 'Crop',
    )..rectangle = const Rect.fromLTWH(
      -8.98847e+307,
      -8.98847e+307,
      1.79769e+308,
      1.79769e+308,
    ),
  ),
  FilterItem(
    'CMYK Halftone',
    FlutterCoreImageFilters.createFilter<CICMYKHalftoneConfiguration>(
      displayName: 'CMYK Halftone',
    )
      ..gCR = 0
      ..uCR = 1
      ..width = 50
      ..center = const Point(150.0, 150.0)
      ..angle = 3.14
      ..sharpness = 0.5,
  ),
  FilterItem(
    'Circular Screen',
    FlutterCoreImageFilters.createFilter<CICircularScreenConfiguration>(
      displayName: 'Circular Screen',
    )
      ..center = const Point(150.0, 150.0)
      ..sharpness = 0.5
      ..width = 25,
  ),
  FilterItem(
    'Bump Distortion Linear',
    FlutterCoreImageFilters.createFilter<CIBumpDistortionLinearConfiguration>(
      displayName: 'Bump Distortion Linear',
    )
      ..center = const Point(75.0, 75.0)
      ..radius = 300
      ..scale = 1
      ..angle = 3.14,
  ),
  FilterItem(
    'White Point Adjust',
    FlutterCoreImageFilters.createFilter<CIWhitePointAdjustConfiguration>(
      displayName: 'White Point Adjust',
    )..color = const Color.fromRGBO(100, 100, 100, 1.0),
  ),
  FilterItem(
    'False Color',
    FlutterCoreImageFilters.createFilter<CIFalseColorConfiguration>(
      displayName: 'False Color',
    )
      ..color0 = const Color.fromRGBO(10, 20, 50, 1.0)
      ..color1 = const Color.fromRGBO(2, 18, 11, 1.0),
  ),
  FilterItem(
    'Constant Color',
    FlutterCoreImageFilters.createFilter<CIConstantColorGeneratorConfiguration>(
      displayName: 'Constant Color',
    )..color = const Color.fromRGBO(100, 150, 100, 1.0),
  ),
  FilterItem(
    'Color Monochrome',
    FlutterCoreImageFilters.createFilter<CIColorMonochromeConfiguration>(
      displayName: 'Color Monochrome',
    )
      ..intensity = 0.5
      ..color = const Color.fromRGBO(255, 100, 30, 1.0),
  ),
  FilterItem(
    'False Color',
    FlutterCoreImageFilters.createFilter<CIFalseColorConfiguration>(
      displayName: 'False Color',
    )
      ..color0 = const Color.fromRGBO(255, 0, 0, 1.0)
      ..color1 = const Color.fromRGBO(0, 255, 0, 1.0),
  ),
  FilterItem(
    'White Point Adjust',
    FlutterCoreImageFilters.createFilter<CIWhitePointAdjustConfiguration>(
      displayName: 'White Point Adjust',
    )..color = const Color.fromRGBO(100, 100, 100, 1.0),
  ),
  FilterItem(
    'False Color',
    FlutterCoreImageFilters.createFilter<CIFalseColorConfiguration>(
      displayName: 'False Color',
    )
      ..color0 = const Color.fromRGBO(255, 0, 0, 1.0)
      ..color1 = const Color.fromRGBO(0, 255, 0, 1.0),
  ),
  FilterItem(
    'Constant Color',
    FlutterCoreImageFilters.createFilter<CIConstantColorGeneratorConfiguration>(
      displayName: 'Constant Color',
    )..color = const Color.fromRGBO(255, 0, 0, 1.0),
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
    'Disc Blur',
    FlutterCoreImageFilters.createFilter<CIDiscBlurConfiguration>(
      displayName: 'Disc Blur',
    )..radius = 50,
  ),
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
].sorted((a, b) => a.name.compareTo(b.name));
