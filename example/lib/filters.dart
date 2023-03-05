import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

class FilterItem {
  final String name;
  final CIFilterConfiguration configuration;

  FilterItem(this.name, this.configuration);
}

final kFailedFilters = [
  FilterItem(
    'Vivid Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIVividLightBlendModeConfiguration>(
      displayName: 'Vivid Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Vivid Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIVividLightBlendModeConfiguration>(
      displayName: 'Vivid Light Blend Mode',
    ),
  ),
  FilterItem(
    'Swipe',
    FlutterCoreImageFilters.createFilter<CISwipeTransitionConfiguration>(
      displayName: 'Swipe',
    )
      ..targetImageAsset = 'images/inputImage1.jpg'
      ..angle = 2
      ..color = const Color.fromRGBO(140, 255, 255, 1.0)
      ..extent = const Rect.fromLTWH(0, 0, 150, 150)
      ..opacity = 0.5
      ..time = 0.5
      ..width = 400,
  ),
  FilterItem(
    'Swipe',
    FlutterCoreImageFilters.createFilter<CISwipeTransitionConfiguration>(
      displayName: 'Swipe',
    ),
  ),
  FilterItem(
    'Subtract Blend Mode',
    FlutterCoreImageFilters.createFilter<CISubtractBlendModeConfiguration>(
      displayName: 'Subtract Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Subtract Blend Mode',
    FlutterCoreImageFilters.createFilter<CISubtractBlendModeConfiguration>(
      displayName: 'Subtract Blend Mode',
    ),
  ),
  FilterItem(
    'Source Over',
    FlutterCoreImageFilters.createFilter<CISourceOverCompositingConfiguration>(
      displayName: 'Source Over',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Source Over',
    FlutterCoreImageFilters.createFilter<CISourceOverCompositingConfiguration>(
      displayName: 'Source Over',
    ),
  ),
  FilterItem(
    'Source Out',
    FlutterCoreImageFilters.createFilter<CISourceOutCompositingConfiguration>(
      displayName: 'Source Out',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Source Out',
    FlutterCoreImageFilters.createFilter<CISourceOutCompositingConfiguration>(
      displayName: 'Source Out',
    ),
  ),
  FilterItem(
    'Source In',
    FlutterCoreImageFilters.createFilter<CISourceInCompositingConfiguration>(
      displayName: 'Source In',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Source In',
    FlutterCoreImageFilters.createFilter<CISourceInCompositingConfiguration>(
      displayName: 'Source In',
    ),
  ),
  FilterItem(
    'Source Atop',
    FlutterCoreImageFilters.createFilter<CISourceAtopCompositingConfiguration>(
      displayName: 'Source Atop',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Source Atop',
    FlutterCoreImageFilters.createFilter<CISourceAtopCompositingConfiguration>(
      displayName: 'Source Atop',
    ),
  ),
  FilterItem(
    'Soft Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CISoftLightBlendModeConfiguration>(
      displayName: 'Soft Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Soft Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CISoftLightBlendModeConfiguration>(
      displayName: 'Soft Light Blend Mode',
    ),
  ),
  FilterItem(
    'Shaded Material',
    FlutterCoreImageFilters.createFilter<CIShadedMaterialConfiguration>(
      displayName: 'Shaded Material',
    )
      ..scale = 100
      ..shadingImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Shaded Material',
    FlutterCoreImageFilters.createFilter<CIShadedMaterialConfiguration>(
      displayName: 'Shaded Material',
    ),
  ),
  FilterItem(
    'Screen Blend Mode',
    FlutterCoreImageFilters.createFilter<CIScreenBlendModeConfiguration>(
      displayName: 'Screen Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Screen Blend Mode',
    FlutterCoreImageFilters.createFilter<CIScreenBlendModeConfiguration>(
      displayName: 'Screen Blend Mode',
    ),
  ),
  FilterItem(
    'Saturation Blend Mode',
    FlutterCoreImageFilters.createFilter<CISaturationBlendModeConfiguration>(
      displayName: 'Saturation Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Saturation Blend Mode',
    FlutterCoreImageFilters.createFilter<CISaturationBlendModeConfiguration>(
      displayName: 'Saturation Blend Mode',
    ),
  ),
  FilterItem(
    'Ripple',
    FlutterCoreImageFilters.createFilter<CIRippleTransitionConfiguration>(
      displayName: 'Ripple',
    )
      ..shadingImageAsset = 'images/inputImage1.jpg'
      ..targetImageAsset = 'images/inputImage2.jpg'
      ..extent = const Rect.fromLTWH(
        0,
        0,
        150,
        150,
      )
      ..time = 0.5
      ..scale = -10
      ..width = 150
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    'Ripple',
    FlutterCoreImageFilters.createFilter<CIRippleTransitionConfiguration>(
      displayName: 'Ripple',
    ),
  ),
  FilterItem(
    'Pin Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIPinLightBlendModeConfiguration>(
      displayName: 'Pin Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Pin Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIPinLightBlendModeConfiguration>(
      displayName: 'Pin Light Blend Mode',
    ),
  ),
  FilterItem(
    'Palettize',
    FlutterCoreImageFilters.createFilter<CIPalettizeConfiguration>(
      displayName: 'Palettize',
    )
      ..paletteImageAsset = 'images/inputImage1.jpg'
      ..perceptual = false,
  ),
  FilterItem(
    'Palettize',
    FlutterCoreImageFilters.createFilter<CIPalettizeConfiguration>(
      displayName: 'Palettize',
    ),
  ),
  FilterItem(
    'Palette Centroid',
    FlutterCoreImageFilters.createFilter<CIPaletteCentroidConfiguration>(
      displayName: 'Palette Centroid',
    )
      ..paletteImageAsset = 'images/inputImage1.jpg'
      ..perceptual = false,
  ),
  FilterItem(
    'Palette Centroid',
    FlutterCoreImageFilters.createFilter<CIPaletteCentroidConfiguration>(
      displayName: 'Palette Centroid',
    ),
  ),
  FilterItem(
    'Page Curl With Shadow',
    FlutterCoreImageFilters.createFilter<
        CIPageCurlWithShadowTransitionConfiguration>(
      displayName: 'Page Curl With Shadow',
    )
      ..shadowExtent = const Rect.fromLTWH(0, 0, 150, 150)
      ..shadowAmount = 0.5
      ..shadowSize = 0.2
      ..targetImageAsset = 'images/inputImage1.jpg'
      ..backsideImageAsset = 'images/inputImage2.jpg'
      ..extent = const Rect.fromLTWH(0, 0, 150, 150)
      ..time = 0.5
      ..radius = 200
      ..angle = 2,
  ),
  FilterItem(
    'Page Curl With Shadow',
    FlutterCoreImageFilters.createFilter<
        CIPageCurlWithShadowTransitionConfiguration>(
      displayName: 'Page Curl With Shadow',
    ),
  ),
  FilterItem(
    'Page Curl',
    FlutterCoreImageFilters.createFilter<CIPageCurlTransitionConfiguration>(
      displayName: 'Page Curl',
    )
      ..shadingImageAsset = 'images/inputImage1.jpg'
      ..targetImageAsset = 'images/inputImage2.jpg'
      ..backsideImageAsset = 'images/inputImage2.jpg'
      ..extent = const Rect.fromLTWH(0, 0, 150, 150)
      ..time = 0.5
      ..radius = 200
      ..angle = 2,
  ),
  FilterItem(
    'Page Curl',
    FlutterCoreImageFilters.createFilter<CIPageCurlTransitionConfiguration>(
      displayName: 'Page Curl',
    ),
  ),
  FilterItem(
    'Overlay Blend Mode',
    FlutterCoreImageFilters.createFilter<CIOverlayBlendModeConfiguration>(
      displayName: 'Overlay Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Overlay Blend Mode',
    FlutterCoreImageFilters.createFilter<CIOverlayBlendModeConfiguration>(
      displayName: 'Overlay Blend Mode',
    ),
  ),
  FilterItem(
    'Multiply',
    FlutterCoreImageFilters.createFilter<CIMultiplyCompositingConfiguration>(
      displayName: 'Multiply',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Multiply',
    FlutterCoreImageFilters.createFilter<CIMultiplyCompositingConfiguration>(
      displayName: 'Multiply',
    ),
  ),
  FilterItem(
    'Multiply Blend Mode',
    FlutterCoreImageFilters.createFilter<CIMultiplyBlendModeConfiguration>(
      displayName: 'Multiply Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Multiply Blend Mode',
    FlutterCoreImageFilters.createFilter<CIMultiplyBlendModeConfiguration>(
      displayName: 'Multiply Blend Mode',
    ),
  ),
  FilterItem(
    'Mod',
    FlutterCoreImageFilters.createFilter<CIModTransitionConfiguration>(
      displayName: 'Mod',
    )
      ..targetImageAsset = 'images/inputImage1.jpg'
      ..angle = 3.14
      ..compression = 400
      ..time = 0.5
      ..radius = 100
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    'Mod',
    FlutterCoreImageFilters.createFilter<CIModTransitionConfiguration>(
      displayName: 'Mod',
    ),
  ),
  FilterItem(
    'Mix',
    FlutterCoreImageFilters.createFilter<CIMixConfiguration>(
      displayName: 'Mix',
    )
      ..amount = 0.5
      ..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Mix',
    FlutterCoreImageFilters.createFilter<CIMixConfiguration>(
      displayName: 'Mix',
    ),
  ),
  FilterItem(
    'Minimum',
    FlutterCoreImageFilters.createFilter<CIMinimumCompositingConfiguration>(
      displayName: 'Minimum',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Minimum',
    FlutterCoreImageFilters.createFilter<CIMinimumCompositingConfiguration>(
      displayName: 'Minimum',
    ),
  ),
  FilterItem(
    'Maximum',
    FlutterCoreImageFilters.createFilter<CIMaximumCompositingConfiguration>(
      displayName: 'Maximum',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Maximum',
    FlutterCoreImageFilters.createFilter<CIMaximumCompositingConfiguration>(
      displayName: 'Maximum',
    ),
  ),
  FilterItem(
    'Masked Variable Blur',
    FlutterCoreImageFilters.createFilter<CIMaskedVariableBlurConfiguration>(
      displayName: 'Masked Variable Blur',
    )
      ..maskImageAsset = 'images/inputImage1.jpg'
      ..radius = 8,
  ),
  FilterItem(
    'Masked Variable Blur',
    FlutterCoreImageFilters.createFilter<CIMaskedVariableBlurConfiguration>(
      displayName: 'Masked Variable Blur',
    ),
  ),
  FilterItem(
    'Luminosity Blend Mode',
    FlutterCoreImageFilters.createFilter<CILuminosityBlendModeConfiguration>(
      displayName: 'Luminosity Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Luminosity Blend Mode',
    FlutterCoreImageFilters.createFilter<CILuminosityBlendModeConfiguration>(
      displayName: 'Luminosity Blend Mode',
    ),
  ),
  FilterItem(
    'Linear Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CILinearLightBlendModeConfiguration>(
      displayName: 'Linear Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Linear Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CILinearLightBlendModeConfiguration>(
      displayName: 'Linear Light Blend Mode',
    ),
  ),
  FilterItem(
    'Linear Dodge Blend Mode',
    FlutterCoreImageFilters.createFilter<CILinearDodgeBlendModeConfiguration>(
      displayName: 'Linear Dodge Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Linear Dodge Blend Mode',
    FlutterCoreImageFilters.createFilter<CILinearDodgeBlendModeConfiguration>(
      displayName: 'Linear Dodge Blend Mode',
    ),
  ),
  FilterItem(
    'Linear Burn Blend Mode',
    FlutterCoreImageFilters.createFilter<CILinearBurnBlendModeConfiguration>(
      displayName: 'Linear Burn Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Linear Burn Blend Mode',
    FlutterCoreImageFilters.createFilter<CILinearBurnBlendModeConfiguration>(
      displayName: 'Linear Burn Blend Mode',
    ),
  ),
  FilterItem(
    'Lighten Blend Mode',
    FlutterCoreImageFilters.createFilter<CILightenBlendModeConfiguration>(
      displayName: 'Lighten Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Lighten Blend Mode',
    FlutterCoreImageFilters.createFilter<CILightenBlendModeConfiguration>(
      displayName: 'Lighten Blend Mode',
    ),
  ),
  FilterItem(
    'Lab ∆E',
    FlutterCoreImageFilters.createFilter<CILabDeltaEConfiguration>(
      displayName: 'Lab ∆E',
    )..image2Asset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Lab ∆E',
    FlutterCoreImageFilters.createFilter<CILabDeltaEConfiguration>(
      displayName: 'Lab ∆E',
    ),
  ),
  FilterItem(
    'KMeans',
    FlutterCoreImageFilters.createFilter<CIKMeansConfiguration>(
      displayName: 'KMeans',
    )
      ..meansImageAsset = 'images/inputImage1.jpg'
      ..extent = const Rect.fromLTWH(0, 0, 320, 40)
      ..perceptual = false
      ..count = 64
      ..passes = 10,
  ),
  FilterItem(
    'KMeans',
    FlutterCoreImageFilters.createFilter<CIKMeansConfiguration>(
      displayName: 'KMeans',
    ),
  ),
  FilterItem(
    'Hue Blend Mode',
    FlutterCoreImageFilters.createFilter<CIHueBlendModeConfiguration>(
      displayName: 'Hue Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Hue Blend Mode',
    FlutterCoreImageFilters.createFilter<CIHueBlendModeConfiguration>(
      displayName: 'Hue Blend Mode',
    ),
  ),
  FilterItem(
    'Hard Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIHardLightBlendModeConfiguration>(
      displayName: 'Hard Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Hard Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIHardLightBlendModeConfiguration>(
      displayName: 'Hard Light Blend Mode',
    ),
  ),
  FilterItem(
    'Guided Filter',
    FlutterCoreImageFilters.createFilter<CIGuidedFilterConfiguration>(
      displayName: 'Guided Filter',
    )
      ..epsilon = 0.001
      ..radius = 5
      ..guideImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Guided Filter',
    FlutterCoreImageFilters.createFilter<CIGuidedFilterConfiguration>(
      displayName: 'Guided Filter',
    ),
  ),
  FilterItem(
    'Glass Distortion',
    FlutterCoreImageFilters.createFilter<CIGlassDistortionConfiguration>(
      displayName: 'Glass Distortion',
    )
      ..scale = 100
      ..center = const Point(75.0, 75.0)
      ..textureAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Glass Distortion',
    FlutterCoreImageFilters.createFilter<CIGlassDistortionConfiguration>(
      displayName: 'Glass Distortion',
    ),
  ),
  FilterItem(
    'Flash',
    FlutterCoreImageFilters.createFilter<CIFlashTransitionConfiguration>(
      displayName: 'Flash',
    )
      ..targetImageAsset = 'images/inputImage1.jpg'
      ..color = const Color.fromRGBO(134, 204, 153, 1.0)
      ..time = 1
      ..center = const Point(200.0, 200.0)
      ..maxStriationRadius = 5
      ..extent = const Rect.fromLTWH(0, 0, 300, 300)
      ..striationStrength = 1.5
      ..fadeThreshold = 0.5
      ..striationContrast = 2.5,
  ),
  FilterItem(
    'Flash',
    FlutterCoreImageFilters.createFilter<CIFlashTransitionConfiguration>(
      displayName: 'Flash',
    ),
  ),
  FilterItem(
    'Exclusion Blend Mode',
    FlutterCoreImageFilters.createFilter<CIExclusionBlendModeConfiguration>(
      displayName: 'Exclusion Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Exclusion Blend Mode',
    FlutterCoreImageFilters.createFilter<CIExclusionBlendModeConfiguration>(
      displayName: 'Exclusion Blend Mode',
    ),
  ),
  FilterItem(
    'Edge Preserve Upsample Filter',
    FlutterCoreImageFilters.createFilter<
        CIEdgePreserveUpsampleFilterConfiguration>(
      displayName: 'Edge Preserve Upsample Filter',
    )
      ..lumaSigma = 0.5
      ..spatialSigma = 2
      ..smallImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Edge Preserve Upsample Filter',
    FlutterCoreImageFilters.createFilter<
        CIEdgePreserveUpsampleFilterConfiguration>(
      displayName: 'Edge Preserve Upsample Filter',
    ),
  ),
  FilterItem(
    'Divide Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDivideBlendModeConfiguration>(
      displayName: 'Divide Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Divide Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDivideBlendModeConfiguration>(
      displayName: 'Divide Blend Mode',
    ),
  ),
  FilterItem(
    'Dissolve',
    FlutterCoreImageFilters.createFilter<CIDissolveTransitionConfiguration>(
      displayName: 'Dissolve',
    )
      ..time = 1
      ..targetImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Dissolve',
    FlutterCoreImageFilters.createFilter<CIDissolveTransitionConfiguration>(
      displayName: 'Dissolve',
    ),
  ),
  FilterItem(
    'Displacement Distortion',
    FlutterCoreImageFilters.createFilter<CIDisplacementDistortionConfiguration>(
      displayName: 'Displacement Distortion',
    )
      ..scale = 100
      ..displacementImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Displacement Distortion',
    FlutterCoreImageFilters.createFilter<CIDisplacementDistortionConfiguration>(
      displayName: 'Displacement Distortion',
    ),
  ),
  FilterItem(
    'Disintegrate With Mask',
    FlutterCoreImageFilters.createFilter<
        CIDisintegrateWithMaskTransitionConfiguration>(
      displayName: 'Disintegrate With Mask',
    )
      ..time = 1
      ..shadowOffset = const Point(10, -5)
      ..shadowDensity = 0.5
      ..shadowRadius = 24
      ..maskImageAsset = 'images/inputImage1.jpg'
      ..targetImageAsset = 'images/inputImage2.jpg',
  ),
  FilterItem(
    'Disintegrate With Mask',
    FlutterCoreImageFilters.createFilter<
        CIDisintegrateWithMaskTransitionConfiguration>(
      displayName: 'Disintegrate With Mask',
    ),
  ),
  FilterItem(
    'Difference Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDifferenceBlendModeConfiguration>(
      displayName: 'Difference Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Difference Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDifferenceBlendModeConfiguration>(
      displayName: 'Difference Blend Mode',
    ),
  ),
  FilterItem(
    'Darken Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDarkenBlendModeConfiguration>(
      displayName: 'Darken Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Darken Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDarkenBlendModeConfiguration>(
      displayName: 'Darken Blend Mode',
    ),
  ),
  FilterItem(
    'Copy Machine',
    FlutterCoreImageFilters.createFilter<CICopyMachineTransitionConfiguration>(
      displayName: 'Copy Machine',
    )
      ..angle = 3.14
      ..time = 1
      ..opacity = 1.5
      ..color = const Color.fromRGBO(153, 115, 204, 1.0)
      ..extent = const Rect.fromLTWH(0, 0, 150, 150)
      ..width = 250
      ..targetImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Copy Machine',
    FlutterCoreImageFilters.createFilter<CICopyMachineTransitionConfiguration>(
      displayName: 'Copy Machine',
    ),
  ),
  FilterItem(
    'Color Map',
    FlutterCoreImageFilters.createFilter<CIColorMapConfiguration>(
      displayName: 'Color Map',
    )..gradientImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Map',
    FlutterCoreImageFilters.createFilter<CIColorMapConfiguration>(
      displayName: 'Color Map',
    ),
  ),
  FilterItem(
    'Color Dodge Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorDodgeBlendModeConfiguration>(
      displayName: 'Color Dodge Blend Mode',
    )..backgroundImageAsset = 'images/demo.jpeg',
  ),
  FilterItem(
    'Color Dodge Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorDodgeBlendModeConfiguration>(
      displayName: 'Color Dodge Blend Mode',
    ),
  ),
  FilterItem(
    'Color Burn Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorBurnBlendModeConfiguration>(
      displayName: 'Color Burn Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Burn Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorBurnBlendModeConfiguration>(
      displayName: 'Color Burn Blend Mode',
    ),
  ),
  FilterItem(
    'Color Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorBlendModeConfiguration>(
      displayName: 'Color Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorBlendModeConfiguration>(
      displayName: 'Color Blend Mode',
    ),
  ),
  FilterItem(
    'Color Absolute Difference',
    FlutterCoreImageFilters.createFilter<
        CIColorAbsoluteDifferenceConfiguration>(
      displayName: 'Color Absolute Difference',
    )..image2Asset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Absolute Difference',
    FlutterCoreImageFilters.createFilter<
        CIColorAbsoluteDifferenceConfiguration>(
      displayName: 'Color Absolute Difference',
    ),
  ),
  FilterItem(
    'Blend With Red Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithRedMaskConfiguration>(
      displayName: 'Blend With Red Mask',
    )
      ..backgroundImageAsset = 'images/inputImage1.jpg'
      ..maskImageAsset = 'images/inputImage2.jpg',
  ),
  FilterItem(
    'Blend With Red Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithRedMaskConfiguration>(
      displayName: 'Blend With Red Mask',
    ),
  ),
  FilterItem(
    'Blend With Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithMaskConfiguration>(
      displayName: 'Blend With Mask',
    )
      ..backgroundImageAsset = 'images/inputImage1.jpg'
      ..maskImageAsset = 'images/inputImage2.jpg',
  ),
  FilterItem(
    'Blend With Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithMaskConfiguration>(
      displayName: 'Blend With Mask',
    ),
  ),
  FilterItem(
    'Blend With Blue Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithBlueMaskConfiguration>(
      displayName: 'Blend With Blue Mask',
    )
      ..backgroundImageAsset = 'images/inputImage1.jpg'
      ..maskImageAsset = 'images/inputImage2.jpg',
  ),
  FilterItem(
    'Blend With Blue Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithBlueMaskConfiguration>(
      displayName: 'Blend With Blue Mask',
    ),
  ),
  FilterItem(
    'Blend With Alpha Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithAlphaMaskConfiguration>(
      displayName: 'Blend With Alpha Mask',
    )
      ..backgroundImageAsset = 'images/inputImage1.jpg'
      ..maskImageAsset = 'images/inputImage2.jpg',
  ),
  FilterItem(
    'Blend With Alpha Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithAlphaMaskConfiguration>(
      displayName: 'Blend With Alpha Mask',
    ),
  ),
  FilterItem(
    'Bars Swipe Transition',
    FlutterCoreImageFilters.createFilter<CIBarsSwipeTransitionConfiguration>(
      displayName: 'Bars Swipe Transition',
    )
      ..time = 0.5
      ..angle = 2
      ..width = 150
      ..targetImageAsset = 'images/inputImage1.jpg'
      ..barOffset = 50,
  ),
  FilterItem(
    'Bars Swipe Transition',
    FlutterCoreImageFilters.createFilter<CIBarsSwipeTransitionConfiguration>(
      displayName: 'Bars Swipe Transition',
    ),
  ),
  FilterItem(
    'Addition',
    FlutterCoreImageFilters.createFilter<CIAdditionCompositingConfiguration>(
      displayName: 'Addition',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Addition',
    FlutterCoreImageFilters.createFilter<CIAdditionCompositingConfiguration>(
      displayName: 'Addition',
    ),
  ),
  FilterItem(
    'Accordion Fold Transition',
    FlutterCoreImageFilters.createFilter<
        CIAccordionFoldTransitionConfiguration>(
      displayName: 'Accordion Fold Transition',
    )
      ..time = 0.5
      ..numberOfFolds = 25
      ..bottomHeight = 1
      ..foldShadowAmount = 0.5
      ..targetImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Accordion Fold Transition',
    FlutterCoreImageFilters.createFilter<
        CIAccordionFoldTransitionConfiguration>(
      displayName: 'Accordion Fold Transition',
    ),
  ),
  FilterItem(
    'Checkerboard',
    FlutterCoreImageFilters.createFilter<CICheckerboardGeneratorConfiguration>(
      displayName: 'Checkerboard',
    )
      ..sharpness = 1
      ..color0 = const Color.fromRGBO(120, 100, 130, 1.0)
      ..center = const Point(150.0, 150.0)
      ..width = 400
      ..color1 = const Color.fromRGBO(1, 1, 0, 1.0),
  ),
  FilterItem(
    'Checkerboard',
    FlutterCoreImageFilters.createFilter<CICheckerboardGeneratorConfiguration>(
      displayName: 'Checkerboard',
    ),
  ),
  FilterItem(
    'Person Segmentation',
    FlutterCoreImageFilters.createFilter<CIPersonSegmentationConfiguration>(
      displayName: 'Person Segmentation',
    )..qualityLevel = 1,
  ),
  FilterItem(
    'Convert Lab to RGB',
    FlutterCoreImageFilters.createFilter<CIConvertLabToRGBConfiguration>(
      displayName: 'Convert Lab to RGB',
    ),
  ),
  FilterItem(
    'Saliency Map Filter',
    FlutterCoreImageFilters.createFilter<CISaliencyMapFilterConfiguration>(
      displayName: 'Saliency Map Filter',
    ),
  ),
  FilterItem(
    'Disparity To Depth',
    FlutterCoreImageFilters.createFilter<CIDisparityToDepthConfiguration>(
      displayName: 'Disparity To Depth',
    ),
  ),
  FilterItem(
    'Depth To Disparity',
    FlutterCoreImageFilters.createFilter<CIDepthToDisparityConfiguration>(
      displayName: 'Depth To Disparity',
    ),
  ),
].sorted((a, b) => a.name.compareTo(b.name));
