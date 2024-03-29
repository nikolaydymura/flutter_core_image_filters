import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

class FilterItem {
  final String name;
  final CIFilterConfiguration configuration;

  FilterItem(this.name, this.configuration);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterItem &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

final kFilters = {
  FilterItem(
    'Vivid Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CIVividLightBlendModeConfiguration>(
      displayName: 'Vivid Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
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
    'Soft Light Blend Mode',
    FlutterCoreImageFilters.createFilter<CISoftLightBlendModeConfiguration>(
      displayName: 'Soft Light Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Saturation Blend Mode',
    FlutterCoreImageFilters.createFilter<CISaturationBlendModeConfiguration>(
      displayName: 'Saturation Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
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
    'Overlay Blend Mode',
    FlutterCoreImageFilters.createFilter<CIOverlayBlendModeConfiguration>(
      displayName: 'Overlay Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
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
    'Mix',
    FlutterCoreImageFilters.createFilter<CIMixConfiguration>(
      displayName: 'Mix',
    )
      ..amount = 0.5
      ..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Hue Blend Mode',
    FlutterCoreImageFilters.createFilter<CIHueBlendModeConfiguration>(
      displayName: 'Hue Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Divide Blend Mode',
    FlutterCoreImageFilters.createFilter<CIDivideBlendModeConfiguration>(
      displayName: 'Divide Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Dodge Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorDodgeBlendModeConfiguration>(
      displayName: 'Color Dodge Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Burn Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorBurnBlendModeConfiguration>(
      displayName: 'Color Burn Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Blend Mode',
    FlutterCoreImageFilters.createFilter<CIColorBlendModeConfiguration>(
      displayName: 'Color Blend Mode',
    )..backgroundImageAsset = 'images/inputImage1.jpg',
  ),
  FilterItem(
    'Color Absolute Difference',
    FlutterCoreImageFilters.createFilter<
        CIColorAbsoluteDifferenceConfiguration>(
      displayName: 'Color Absolute Difference',
    )..image2Asset = 'images/inputImage1.jpg',
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
    'Blend With Mask',
    FlutterCoreImageFilters.createFilter<CIBlendWithMaskConfiguration>(
      displayName: 'Blend With Mask',
    )
      ..backgroundImageAsset = 'images/inputImage1.jpg'
      ..maskImageAsset = 'images/inputImage2.jpg',
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
    'Vertical Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionVerticalConfiguration>(
      displayName: 'Vertical Keystone Correction',
    )
      ..topRight = const Point(75.0, 75.0)
      ..topLeft = const Point(150.0, 150.0)
      ..bottomLeft = const Point(75.0, 75.0)
      ..bottomRight = const Point(150.0, 150.0)
      ..focalLength = 14,
  ),
  FilterItem(
    'Combined Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionCombinedConfiguration>(
      displayName: 'Combined Keystone Correction',
    )
      ..topRight = const Point(75.0, 75.0)
      ..topLeft = const Point(150.0, 150.0)
      ..bottomLeft = const Point(75.0, 75.0)
      ..bottomRight = const Point(150.0, 150.0)
      ..focalLength = 14,
  ),
  FilterItem(
    'Sunbeams',
    FlutterCoreImageFilters.createFilter<CISunbeamsGeneratorConfiguration>(
      displayName: 'Sunbeams',
    )
      ..center = const Point(75.0, 75.0)
      ..striationContrast = 2.75
      ..time = 1
      ..striationStrength = 1.5
      ..maxStriationRadius = 5.6
      ..sunRadius = 100
      ..color = const Color.fromRGBO(160, 255, 200, 1),
  ),
  FilterItem(
    'Perspective Transform with Extent',
    FlutterCoreImageFilters.createFilter<
        CIPerspectiveTransformWithExtentConfiguration>(
      displayName: 'Perspective Transform with Extent',
    )
      ..bottomLeft = const Point(70.0, 70.0)
      ..topRight = const Point(320.0, 250.0)
      ..topLeft = const Point(60.0, 300.0)
      ..bottomRight = const Point(270.0, 70.0)
      ..extent = const Rect.fromLTWH(25, 25, 300, 300),
  ),
  FilterItem(
    'Perspective Transform',
    FlutterCoreImageFilters.createFilter<CIPerspectiveTransformConfiguration>(
      displayName: 'Perspective Transform',
    )
      ..bottomLeft = const Point(70.0, 70.0)
      ..topRight = const Point(320.0, 250.0)
      ..topLeft = const Point(60.0, 300.0)
      ..bottomRight = const Point(270.0, 70.0),
  ),
  FilterItem(
    'Lenticular Halo',
    FlutterCoreImageFilters.createFilter<
        CILenticularHaloGeneratorConfiguration>(
      displayName: 'Lenticular Halo',
    )
      ..haloRadius = 100
      ..color = const Color.fromRGBO(209, 204, 255, 1)
      ..center = const Point(75.0, 75.0)
      ..striationContrast = 3
      ..haloOverlap = 0.55
      ..time = 1
      ..striationStrength = 1.5
      ..haloWidth = 150,
  ),
  FilterItem(
    'Nine Part Stretched',
    FlutterCoreImageFilters.createFilter<CINinePartStretchedConfiguration>(
      displayName: 'Nine Part Stretched',
    )
      ..breakpoint0 = const Point(100.0, 100.0)
      ..breakpoint1 = const Point(40.0, 40.0)
      ..growAmount = const Point(200.0, 200.0),
  ),
  FilterItem(
    'Row Average',
    FlutterCoreImageFilters.createFilter<CIRowAverageConfiguration>(
      displayName: 'Row Average',
    )..extent = const Rect.fromLTWH(30, 30, 10, 10),
  ),
  FilterItem(
    'Stretch Crop',
    FlutterCoreImageFilters.createFilter<CIStretchCropConfiguration>(
      displayName: 'Stretch Crop',
    )
      ..centerStretchAmount = 0
      ..cropAmount = 1
      ..size = const Point(200.0, 200.0),
  ),
  FilterItem(
    'Horizontal Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionHorizontalConfiguration>(
      displayName: 'Horizontal Keystone Correction',
    )
      ..topRight = const Point(10.0, 2.0)
      ..topLeft = const Point(2.0, 10.0)
      ..bottomLeft = const Point(10.0, 5.0)
      ..bottomRight = const Point(5.0, 10.0)
      ..focalLength = 14,
  ),
  FilterItem(
    'Stripes',
    FlutterCoreImageFilters.createFilter<CIStripesGeneratorConfiguration>(
      displayName: 'Stripes',
    )
      ..width = 400
      ..center = const Point(75.0, 75.0)
      ..sharpness = 0
      ..color0 = const Color.fromRGBO(0, 0, 0, 1)
      ..color1 = const Color.fromRGBO(255, 255, 255, 1),
  ),
  FilterItem(
    'Star Shine',
    FlutterCoreImageFilters.createFilter<CIStarShineGeneratorConfiguration>(
      displayName: 'Star Shine',
    )
      ..epsilon = -2
      ..crossAngle = 0.6
      ..radius = 50
      ..crossScale = 15
      ..crossOpacity = -2
      ..color = const Color.fromRGBO(255, 204, 153, 1)
      ..crossWidth = 2.5
      ..center = const Point(150.0, 150.0),
  ),
  FilterItem(
    'Smooth Linear Gradient',
    FlutterCoreImageFilters.createFilter<CISmoothLinearGradientConfiguration>(
      displayName: 'Smooth Linear Gradient',
    )
      ..point1 = const Point(100.0, 100.0)
      ..color1 = const Color.fromRGBO(160, 140, 160, 1)
      ..color0 = const Color.fromRGBO(80, 160, 140, 1)
      ..point0 = const Point(50.0, 50.0),
  ),
  FilterItem(
    'Sixfold Rotated Tile',
    FlutterCoreImageFilters.createFilter<CISixfoldRotatedTileConfiguration>(
      displayName: 'Sixfold Rotated Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..angle = 0.5
      ..width = 50,
  ),
  FilterItem(
    'Sixfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CISixfoldReflectedTileConfiguration>(
      displayName: 'Sixfold Reflected Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..angle = 1.5
      ..width = 120,
  ),
  FilterItem(
    'Rounded Rectangle Generator',
    FlutterCoreImageFilters.createFilter<
        CIRoundedRectangleGeneratorConfiguration>(
      displayName: 'Rounded Rectangle Generator',
    )
      ..extent = const Rect.fromLTWH(5, 5, 50, 50)
      ..color = const Color.fromRGBO(200, 170, 45, 1.0)
      ..radius = 50,
  ),
  FilterItem(
    'Radial Gradient',
    FlutterCoreImageFilters.createFilter<CIRadialGradientConfiguration>(
      displayName: 'Radial Gradient',
    )
      ..radius1 = 100
      ..color0 = const Color.fromRGBO(0, 0, 0, 1)
      ..center = const Point(75.0, 75.0)
      ..radius0 = 5
      ..color1 = const Color.fromRGBO(255, 255, 255, 1),
  ),
  FilterItem(
    'Pinch Distortion',
    FlutterCoreImageFilters.createFilter<CIPinchDistortionConfiguration>(
      displayName: 'Pinch Distortion',
    )
      ..center = const Point(75.0, 75.0)
      ..scale = 1
      ..radius = 500,
  ),
  FilterItem(
    'Perspective Tile',
    FlutterCoreImageFilters.createFilter<CIPerspectiveTileConfiguration>(
      displayName: 'Perspective Tile',
    )
      ..bottomLeft = const Point(70.0, 70.0)
      ..topRight = const Point(320.0, 250.0)
      ..topLeft = const Point(60.0, 300.0)
      ..bottomRight = const Point(270.0, 70.0),
  ),
  FilterItem(
    'Perspective Correction',
    FlutterCoreImageFilters.createFilter<CIPerspectiveCorrectionConfiguration>(
      displayName: 'Perspective Correction',
    )
      ..bottomLeft = const Point(75.0, 75.0)
      ..topRight = const Point(400.0, 300.0)
      ..topLeft = const Point(60.0, 300.0)
      ..crop = false
      ..bottomRight = const Point(300.0, 70.0),
  ),
  FilterItem(
    'Parallelogram Tile',
    FlutterCoreImageFilters.createFilter<CIParallelogramTileConfiguration>(
      displayName: 'Parallelogram Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..width = 100
      ..acuteAngle = 1
      ..angle = 1,
  ),
  FilterItem(
    'Op Tile',
    FlutterCoreImageFilters.createFilter<CIOpTileConfiguration>(
      displayName: 'Op Tile',
    )
      ..center = const Point(150.0, 150.0)
      ..width = 500
      ..angle = 2
      ..scale = 5.6,
  ),
  FilterItem(
    'Nine Part Tiled',
    FlutterCoreImageFilters.createFilter<CINinePartTiledConfiguration>(
      displayName: 'Nine Part Tiled',
    )
      ..breakpoint1 = const Point(200.0, 200.0)
      ..breakpoint0 = const Point(70.0, 70.0)
      ..flipYTiles = false
      ..growAmount = const Point(130.0, 130.0),
  ),
  FilterItem(
    'Linear Gradient',
    FlutterCoreImageFilters.createFilter<CILinearGradientConfiguration>(
      displayName: 'Linear Gradient',
    )
      ..color0 = const Color.fromRGBO(100, 140, 140, 1)
      ..point1 = const Point(100.0, 100.0)
      ..point0 = const Point(200.0, 200.0)
      ..color1 = const Color.fromRGBO(200, 1, 1, 1),
  ),
  FilterItem(
    'Line Screen',
    FlutterCoreImageFilters.createFilter<CILineScreenConfiguration>(
      displayName: 'Line Screen',
    )
      ..sharpness = 0.5
      ..center = const Point(75.0, 75.0)
      ..angle = 1
      ..width = 24,
  ),
  FilterItem(
    'Light Tunnel Distortion',
    FlutterCoreImageFilters.createFilter<CILightTunnelConfiguration>(
      displayName: 'Light Tunnel Distortion',
    )
      ..radius = 300
      ..center = const Point(75.0, 75.0)
      ..rotation = 1.57,
  ),
  FilterItem(
    'Gaussian Gradient',
    FlutterCoreImageFilters.createFilter<CIGaussianGradientConfiguration>(
      displayName: 'Gaussian Gradient',
    )
      ..radius = 300
      ..center = const Point(150.0, 150.0)
      ..color1 = const Color.fromRGBO(0, 0, 0, 0)
      ..color0 = const Color.fromRGBO(160, 255, 255, 1),
  ),
  FilterItem(
    'Color Clamp',
    FlutterCoreImageFilters.createFilter<CIColorClampConfiguration>(
      displayName: 'Color Clamp',
    )
      ..maxComponents = [0.5, 0.5, 0.5, 0.5]
      ..minComponents = [0, 0, 0, 0],
  ),
  FilterItem(
    'Mask to Alpha',
    FlutterCoreImageFilters.createFilter<CIMaskToAlphaConfiguration>(
      displayName: 'Mask to Alpha',
    ),
  ),
  FilterItem(
    'Edge Work',
    FlutterCoreImageFilters.createFilter<CIEdgeWorkConfiguration>(
      displayName: 'Edge Work',
    )..radius = 15,
  ),
  FilterItem(
    'Random Generator',
    FlutterCoreImageFilters.createFilter<CIRandomGeneratorConfiguration>(
      displayName: 'Random Generator',
    ),
  ),
  FilterItem(
    'Spot Color',
    FlutterCoreImageFilters.createFilter<CISpotColorConfiguration>(
      displayName: 'Spot Color',
    )
      ..centerColor2 = const Color.fromRGBO(70, 100, 120, 1)
      ..closeness2 = 0.30
      ..contrast1 = 0.5
      ..replacementColor2 = const Color.fromRGBO(150, 88, 150, 1)
      ..centerColor1 = const Color.fromRGBO(50, 40, 50, 1)
      ..contrast3 = 0.5
      ..closeness1 = 0.21
      ..contrast2 = 0.5
      ..replacementColor1 = const Color.fromRGBO(100, 90, 70, 1)
      ..centerColor3 = const Color.fromRGBO(200, 150, 70, 1)
      ..closeness3 = 0.3
      ..replacementColor3 = const Color.fromRGBO(170, 100, 67, 1),
  ),
  FilterItem(
    'Vertical 9 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution9VerticalConfiguration>(
      displayName: 'Vertical 9 Convolution',
    )
      ..bias = 0
      ..weights = Matrix3.fromList([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Vertical 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9VerticalConfiguration>(
      displayName: 'Vertical 9 RGB Convolution',
    )
      ..bias = 0
      ..weights = Matrix3.fromList([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Horizontal 9 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution9HorizontalConfiguration>(
      displayName: 'Horizontal 9 Convolution',
    )
      ..bias = 0.3
      ..weights = Matrix3.fromList([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Horizontal 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9HorizontalConfiguration>(
      displayName: 'Horizontal 9 RGB Convolution',
    )
      ..bias = 0.5
      ..weights = Matrix3.fromList([1, 1, 0, 0, 1, 0, 0, 0, 0]),
  ),
  FilterItem(
    '7 by 7 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB7X7Configuration>(
      displayName: '7 by 7 RGB Convolution',
    )
      ..bias = 0.5
      ..weights = Mat7([
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]),
  ),
  FilterItem(
    'Kaleidoscope',
    FlutterCoreImageFilters.createFilter<CIKaleidoscopeConfiguration>(
      displayName: 'Kaleidoscope',
    )
      ..angle = 1
      ..center = const Point(200.0, 100.0)
      ..count = 32,
  ),
  FilterItem(
    'Hole Distortion',
    FlutterCoreImageFilters.createFilter<CIHoleDistortionConfiguration>(
      displayName: 'Hole Distortion',
    )
      ..radius = 500
      ..center = const Point(200.0, 100.0),
  ),
  FilterItem(
    'Glide Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIGlideReflectedTileConfiguration>(
      displayName: 'Glide Reflected Tile',
    )
      ..width = 150
      ..center = const Point(200.0, 100.0)
      ..angle = 1,
  ),
  FilterItem(
    'Glass Lozenge',
    FlutterCoreImageFilters.createFilter<CIGlassLozengeConfiguration>(
      displayName: 'Glass Lozenge',
    )
      ..refraction = 3
      ..radius = 500
      ..point0 = const Point(100.0, 200.0)
      ..point1 = const Point(200.0, 100.0),
  ),
  FilterItem(
    'Fourfold Translated Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldTranslatedTileConfiguration>(
      displayName: 'Fourfold Translated Tile',
    )
      ..center = const Point(100.0, 200.0)
      ..width = 160
      ..acuteAngle = 2
      ..angle = 1,
  ),
  FilterItem(
    'Fourfold Rotated Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldRotatedTileConfiguration>(
      displayName: 'Fourfold Rotated Tile',
    )
      ..center = const Point(100.0, 200.0)
      ..width = 150
      ..angle = 1,
  ),
  FilterItem(
    'Fourfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldReflectedTileConfiguration>(
      displayName: 'Fourfold Reflected Tile',
    )
      ..acuteAngle = 2
      ..center = const Point(200.0, 200.0)
      ..width = 150
      ..angle = 1,
  ),
  FilterItem(
    'Eightfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIEightfoldReflectedTileConfiguration>(
      displayName: 'Eightfold Reflected Tile',
    )
      ..center = const Point(150.0, 150.0)
      ..width = 100
      ..angle = 3.14,
  ),
  FilterItem(
    'Droste',
    FlutterCoreImageFilters.createFilter<CIDrosteConfiguration>(
      displayName: 'Droste',
    )
      ..insetPoint0 = const Point(150.0, 300.0)
      ..strands = 2
      ..insetPoint1 = const Point(100.0, 150.0)
      ..periodicity = 2
      ..zoom = 2
      ..rotation = 0,
  ),
  FilterItem(
    '5 by 5 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB5X5Configuration>(
      displayName: '5 by 5 RGB Convolution',
    )
      ..bias = 0.5
      ..weights = Mat5([
        1,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]),
  ),
  FilterItem(
    '3 by 3 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB3X3Configuration>(
      displayName: '3 by 3 RGB Convolution',
    )
      ..bias = 0.5
      ..weights = Matrix3.fromList([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Column Average',
    FlutterCoreImageFilters.createFilter<CIColumnAverageConfiguration>(
      displayName: 'Column Average',
    )..extent = const Rect.fromLTWH(500, 500, 20, 40),
  ),
  FilterItem(
    'Bicubic Scale Transform',
    FlutterCoreImageFilters.createFilter<CIBicubicScaleTransformConfiguration>(
      displayName: 'Bicubic Scale Transform',
    )
      ..b = 0.25
      ..scale = 0.9
      ..c = 0.9
      ..aspectRatio = 0.7,
  ),
  FilterItem(
    'Area Logarithmic Histogram',
    FlutterCoreImageFilters.createFilter<
        CIAreaLogarithmicHistogramConfiguration>(
      displayName: 'Area Logarithmic Histogram',
    )
      ..minimumStop = -10
      ..maximumStop = 4
      ..extent = const Rect.fromLTWH(500, 500, 100, 100)
      ..count = 3,
  ),
  FilterItem(
    'Area Histogram',
    FlutterCoreImageFilters.createFilter<CIAreaHistogramConfiguration>(
      displayName: 'Area Histogram',
    )
      ..scale = 0.9
      ..count = 3
      ..extent = const Rect.fromLTWH(500, 500, 100, 100),
  ),
  FilterItem(
    'Twelvefold Reflected Tile',
    FlutterCoreImageFilters.createFilter<
        CITwelvefoldReflectedTileConfiguration>(
      displayName: 'Twelvefold Reflected Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..angle = 3.14
      ..width = 100,
  ),
  FilterItem(
    'Triangle Kaleidoscope',
    FlutterCoreImageFilters.createFilter<CITriangleKaleidoscopeConfiguration>(
      displayName: 'Triangle Kaleidoscope',
    )
      ..decay = 0.5
      ..point = const Point(75.0, 75.0)
      ..rotation = 3.14
      ..size = 500,
  ),
  FilterItem(
    'Triangle Tile',
    FlutterCoreImageFilters.createFilter<CITriangleTileConfiguration>(
      displayName: 'Triangle Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..angle = 3.14
      ..width = 100,
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
    'Spot Light',
    FlutterCoreImageFilters.createFilter<CISpotLightConfiguration>(
      displayName: 'Spot Light',
    )
      ..lightPointsAt = [100, 100, 0]
      ..color = const Color.fromRGBO(100, 200, 100, 1)
      ..concentration = 0.7
      ..brightness = 6
      ..lightPosition = [200, 300, 200],
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
    'Vortex Distortion',
    FlutterCoreImageFilters.createFilter<CIVortexDistortionConfiguration>(
      displayName: 'Vortex Distortion',
    )
      ..angle = 48
      ..center = const Point(75.0, 75.0)
      ..radius = 400,
  ),
  FilterItem(
    'Color Polynomial',
    FlutterCoreImageFilters.createFilter<CIColorPolynomialConfiguration>(
      displayName: 'Color Polynomial',
    )
      ..redCoefficients = [1, 1, 0, 0]
      ..greenCoefficients = [1, 1, 0, 0]
      ..alphaCoefficients = [0, 1, 0, 0]
      ..blueCoefficients = [0, 1, 0, 0],
  ),
  FilterItem(
    'Color Matrix',
    FlutterCoreImageFilters.createFilter<CIColorMatrixConfiguration>(
      displayName: 'Color Matrix',
    )
      ..gVector = [0, 1, 0, 0]
      ..biasVector = [0, 0, 0, 0]
      ..rVector = [1, 1, 0, 0]
      ..aVector = [0, 0, 0, 1]
      ..bVector = [1, 0, 1, 0],
  ),
  FilterItem(
    'Color Cross Polynomial',
    FlutterCoreImageFilters.createFilter<CIColorCrossPolynomialConfiguration>(
      displayName: 'Color Cross Polynomial',
    )
      ..redCoefficients = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]
      ..greenCoefficients = [0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
      ..blueCoefficients = [1, 0, 1, 0, 0, 0, 0, 0, 0, 0],
  ),
  FilterItem(
    'Clamp',
    FlutterCoreImageFilters.createFilter<CIClampConfiguration>(
      displayName: 'Clamp',
    )..extent = const Rect.fromLTWH(100, 100, 320, 40),
  ),
  FilterItem(
    'Bump Distortion Linear',
    FlutterCoreImageFilters.createFilter<CIBumpDistortionLinearConfiguration>(
      displayName: 'Bump Distortion Linear',
    )
      ..center = const Point(750.0, 750.0)
      ..radius = 550
      ..scale = 0.75
      ..angle = 5.14,
  ),
  FilterItem(
    'Bump Distortion',
    FlutterCoreImageFilters.createFilter<CIBumpDistortionConfiguration>(
      displayName: 'Bump Distortion',
    )
      ..radius = 300
      ..scale = 0.75
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    '7 by 7 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution7X7Configuration>(
      displayName: '7 by 7 Convolution',
    )
      ..bias = 0.5
      ..weights = Mat7([
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]),
  ),
  FilterItem(
    'Twirl Distortion',
    FlutterCoreImageFilters.createFilter<CITwirlDistortionConfiguration>(
      displayName: 'Twirl Distortion',
    )
      ..center = const Point(75.0, 75.0)
      ..angle = 6.23
      ..radius = 250,
  ),
  FilterItem(
    'Area Min and Max Red',
    FlutterCoreImageFilters.createFilter<CIAreaMinMaxRedConfiguration>(
      displayName: 'Area Min and Max Red',
    )..extent = const Rect.fromLTWH(0, 0, 320, 40),
  ),
  FilterItem(
    'Area Min and Max',
    FlutterCoreImageFilters.createFilter<CIAreaMinMaxConfiguration>(
      displayName: 'Area Min and Max',
    )..extent = const Rect.fromLTWH(0, 0, 320, 40),
  ),
  FilterItem(
    'Area Minimum Alpha',
    FlutterCoreImageFilters.createFilter<CIAreaMinimumAlphaConfiguration>(
      displayName: 'Area Minimum Alpha',
    )..extent = const Rect.fromLTWH(0, 0, 320, 40),
  ),
  FilterItem(
    'Area Maximum Alpha',
    FlutterCoreImageFilters.createFilter<CIAreaMaximumAlphaConfiguration>(
      displayName: 'Area Maximum Alpha',
    )..extent = const Rect.fromLTWH(0, 0, 320, 40),
  ),
  FilterItem(
    'Area Maximum',
    FlutterCoreImageFilters.createFilter<CIAreaMaximumConfiguration>(
      displayName: 'Area Maximum',
    )..extent = const Rect.fromLTWH(0, 0, 10, 10),
  ),
  FilterItem(
    'Area Minimum',
    FlutterCoreImageFilters.createFilter<CIAreaMinimumConfiguration>(
      displayName: 'Area Minimum',
    )..extent = const Rect.fromLTWH(0, 0, 320, 40),
  ),
  FilterItem(
    'Area Average',
    FlutterCoreImageFilters.createFilter<CIAreaAverageConfiguration>(
      displayName: 'Area Average',
    )..extent = const Rect.fromLTWH(0, 0, 1800, 1075),
  ),
  FilterItem(
    '5 by 5 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution5X5Configuration>(
      displayName: '5 by 5 Convolution',
    )
      ..bias = 0.5
      ..weights = Mat5([
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ]),
  ),
  FilterItem(
    '3 by 3 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution3X3Configuration>(
      displayName: '3 by 3 Convolution',
    )
      ..bias = 0.5
      ..weights = Matrix3.fromList([1, 0, 0, 0, 1, 0, 0, 0, 0]),
  ),
  FilterItem(
    'Zoom Blur',
    FlutterCoreImageFilters.createFilter<CIZoomBlurConfiguration>(
      displayName: 'Zoom Blur',
    )
      ..amount = 15
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
        100,
        100,
        300,
        300,
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
    'Circular Wrap Distortion',
    FlutterCoreImageFilters.createFilter<CICircularWrapConfiguration>(
      displayName: 'Circular Wrap Distortion',
    )
      ..radius = 300
      ..angle = 3.14
      ..center = const Point(150.0, 150.0),
  ),
  FilterItem(
    'Circle Splash Distortion',
    FlutterCoreImageFilters.createFilter<CICircleSplashDistortionConfiguration>(
      displayName: 'Circle Splash Distortion',
    )
      ..radius = 450
      ..center = const Point(150.0, 150.0),
  ),
  FilterItem(
    'White Point Adjust',
    FlutterCoreImageFilters.createFilter<CIWhitePointAdjustConfiguration>(
      displayName: 'White Point Adjust',
    )..color = const Color.fromRGBO(100, 100, 100, 1.0),
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
}.sorted((a, b) => a.name.compareTo(b.name));
