import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

class FilterItem {
  final String name;
  final CIFilterConfiguration configuration;

  FilterItem(this.name, this.configuration);
}

final kFailedFilters = [
  FilterItem(
    'Combined Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionCombinedConfiguration>(
      displayName: 'Combined Keystone Correction',
    )
      ..topRight = const Point(10.0, 2.0)
      ..topLeft = const Point(2.0, 10.0)
      ..bottomLeft = const Point(10.0, 5.0)
      ..bottomRight = const Point(5.0, 10.0)
      ..focalLength = 14,
  ),
  FilterItem(
    'Combined Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionCombinedConfiguration>(
      displayName: 'Combined Keystone Correction',
    ),
    //    ..topRight = const Point(10.0, 2.0)
    //    ..topLeft = const Point(2.0, 10.0)
    //    ..bottomLeft = const Point(10.0, 5.0)
    //    ..bottomRight = const Point(5.0, 10.0)
    //    ..focalLength = 14,
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
    'Kaleidoscope',
    FlutterCoreImageFilters.createFilter<CIKaleidoscopeConfiguration>(
      displayName: 'Kaleidoscope',
    ),
    //    ..angle = 1
    //    ..center = const Point(200.0, 100.0)
    //    ..count = 32,
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
    'Hole Distortion',
    FlutterCoreImageFilters.createFilter<CIHoleDistortionConfiguration>(
      displayName: 'Hole Distortion',
    ),
    //   ..radius = 500
    //    ..center = const Point(200.0, 100.0),
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
    'Glide Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIGlideReflectedTileConfiguration>(
      displayName: 'Glide Reflected Tile',
    ),
    //    ..width = 150
    //    ..center = const Point(200.0, 100.0)
    //     ..angle = 1,
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
    'Glass Lozenge',
    FlutterCoreImageFilters.createFilter<CIGlassLozengeConfiguration>(
      displayName: 'Glass Lozenge',
    ),
    //    ..refraction = 3
    //    ..radius = 500
    //    ..point0 = const Point(100.0, 200.0)
    //    ..point1 = const Point(200.0, 100.0),
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
    'Gaussian Gradient',
    FlutterCoreImageFilters.createFilter<CIGaussianGradientConfiguration>(
      displayName: 'Gaussian Gradient',
    ),
    //    ..radius = 300
    //   ..center = const Point(150.0, 150.0)
    //   ..color1 = const Color.fromRGBO(0, 0, 0, 0)
    //   ..color0 = const Color.fromRGBO(160, 255, 255, 1),
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
    'Fourfold Translated Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldTranslatedTileConfiguration>(
      displayName: 'Fourfold Translated Tile',
    ),
    //    ..center = const Point(100.0, 200.0)
    //    ..width = 160
    //    ..acuteAngle = 2
    //    ..angle = 1,
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
    'Fourfold Rotated Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldRotatedTileConfiguration>(
      displayName: 'Fourfold Rotated Tile',
    ),
    //   ..center = const Point(100.0, 200.0)
    //    ..width = 150
    //   ..angle = 1,
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
    'Fourfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldReflectedTileConfiguration>(
      displayName: 'Fourfold Reflected Tile',
    ),
    //    ..acuteAngle = 2
    //    ..center = const Point(200.0, 200.0)
    //    ..width = 150
    //    ..angle = 1,
  ),
  FilterItem(
    'Eightfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIEightfoldReflectedTileConfiguration>(
      displayName: 'Eightfold Reflected Tile',
    )
      ..center = const Point(150.0, 150.0)
      ..width = 100
      ..angle = 0,
  ),
  FilterItem(
    'Eightfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIEightfoldReflectedTileConfiguration>(
      displayName: 'Eightfold Reflected Tile',
    ),
    //    ..center = const Point(150.0, 150.0)
    //    ..width = 100
    //    ..angle = 0,
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
    'Droste',
    FlutterCoreImageFilters.createFilter<CIDrosteConfiguration>(
      displayName: 'Droste',
    ),
    //    ..insetPoint0 = const Point(150.0, 300.0)
    //    ..strands = 2
    //    ..insetPoint1 = const Point(100.0, 150.0)
    //    ..periodicity = 2
    //    ..zoom = 2
    //    ..rotation = 0,
  ),
  FilterItem(
    'Vertical 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9VerticalConfiguration>(
      displayName: 'Vertical 9 RGB Convolution',
    )
      ..bias = 0
      ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Vertical 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9VerticalConfiguration>(
      displayName: 'Vertical 9 RGB Convolution',
    ),
    //    ..bias = 0
    //    ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Horizontal 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9HorizontalConfiguration>(
      displayName: 'Horizontal 9 RGB Convolution',
    )
      ..bias = 0.5
      ..weights = Mat3([1, 1, 0, 0, 1, 0, 0, 0, 0]),
  ),
  FilterItem(
    'Horizontal 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9HorizontalConfiguration>(
      displayName: 'Horizontal 9 RGB Convolution',
    ),
    //    ..bias = 0.5
    //    ..weights = Mat3([1, 1, 0, 0, 1, 0, 0, 0, 0]),
  ),
  FilterItem(
    '7 by 7 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB7X7Configuration>(
      displayName: '7 by 7 RGB Convolution',
    )
      ..bias = 1
      ..weights = Mat7([
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
        1,
      ]),
  ),
  FilterItem(
    '7 by 7 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB7X7Configuration>(
      displayName: '7 by 7 RGB Convolution',
    ),
    /*    ..bias = 1
      ..weights = Mat7([
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
        1,
      ]),
  */
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
        0
      ]),
  ),
  FilterItem(
    '5 by 5 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB5X5Configuration>(
      displayName: '5 by 5 RGB Convolution',
    ),
    //    ..bias = 0.5
    //    ..weights = Mat5([
    //             1,
    //             0,
    //             1,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             1,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0,
    //             0
    //           ]),
  ),
  FilterItem(
    '3 by 3 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB3X3Configuration>(
      displayName: '3 by 3 RGB Convolution',
    )
      ..bias = 0.5
      ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    '3 by 3 RGB Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolutionRGB3X3Configuration>(
      displayName: '3 by 3 RGB Convolution',
    ),
    //    ..bias = 0.5
    //    ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Vertical 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9VerticalConfiguration>(
      displayName: 'Vertical 9 RGB Convolution',
    )
      ..bias = 0
      ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Vertical 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9VerticalConfiguration>(
      displayName: 'Vertical 9 RGB Convolution',
    ),
    //    ..bias = 0
    //    ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Horizontal 9 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution9HorizontalConfiguration>(
      displayName: 'Horizontal 9 Convolution',
    )
      ..bias = 1
      ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Horizontal 9 Convolution',
    FlutterCoreImageFilters.createFilter<CIConvolution9HorizontalConfiguration>(
      displayName: 'Horizontal 9 Convolution',
    ),
    //    ..bias = 0
    //    ..weights = Mat3([0, 0, 0, 1, 1, 1, 0, 0, 0]),
  ),
  FilterItem(
    'Zoom Blur',
    FlutterCoreImageFilters.createFilter<CIZoomBlurConfiguration>(
      displayName: 'Zoom Blur',
    )
      ..amount = 100
      ..center = const Point(300.0, 300.0),
  ),
  FilterItem(
    'Sunbeams',
    FlutterCoreImageFilters.createFilter<CISunbeamsGeneratorConfiguration>(
      displayName: 'Sunbeams',
    )
      ..center = const Point(75.0, 75.0)
      ..striationContrast = 2.6
      ..time = 1
      ..striationStrength = 2
      ..maxStriationRadius = 5
      ..sunRadius = 400
      ..color = const Color.fromRGBO(130, 257, 1, 1),
  ),
  FilterItem(
    'Stripes',
    FlutterCoreImageFilters.createFilter<CIStripesGeneratorConfiguration>(
      displayName: 'Stripes',
    )
      ..width = 400
      ..center = const Point(75.0, 75.0)
      ..sharpness = 1
      ..color0 = const Color.fromRGBO(0, 0, 0, 1)
      ..color1 = const Color.fromRGBO(255, 255, 255, 1),
  ),
  FilterItem(
    'Stretch Crop',
    FlutterCoreImageFilters.createFilter<CIStretchCropConfiguration>(
      displayName: 'Stretch Crop',
    )
      ..centerStretchAmount = 0.5
      ..cropAmount = 0.5
      ..size = const Point(640.0, 380.0),
  ),
  FilterItem(
    'Star Shine',
    FlutterCoreImageFilters.createFilter<CIStarShineGeneratorConfiguration>(
      displayName: 'Star Shine',
    )
      ..epsilon = -4
      ..crossAngle = 3.14
      ..radius = 150
      ..crossScale = 45
      ..crossOpacity = -4
      ..color = const Color.fromRGBO(100, 200, 100, 1)
      ..crossWidth = 5
      ..center = const Point(75.0, 75.0),
  ),
  FilterItem(
    'Smooth Linear Gradient',
    FlutterCoreImageFilters.createFilter<CISmoothLinearGradientConfiguration>(
      displayName: 'Smooth Linear Gradient',
    )
      ..point1 = const Point(0.0, 0.0)
      ..color1 = const Color.fromRGBO(255, 255, 255, 1)
      ..color0 = const Color.fromRGBO(0, 0, 0, 1)
      ..point0 = const Point(100.0, 100.0),
  ),
  FilterItem(
    'Sixfold Rotated Tile',
    FlutterCoreImageFilters.createFilter<CISixfoldRotatedTileConfiguration>(
      displayName: 'Sixfold Rotated Tile',
    )
      ..center = const Point(150.0, 150.0)
      ..angle = 3.14
      ..width = 100,
  ),
  FilterItem(
    'Sixfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CISixfoldReflectedTileConfiguration>(
      displayName: 'Sixfold Reflected Tile',
    )
      ..center = const Point(150.0, 150.0)
      ..angle = 3.14
      ..width = 100,
  ),
  FilterItem(
    'Row Average',
    FlutterCoreImageFilters.createFilter<CIRowAverageConfiguration>(
      displayName: 'Row Average',
    )..extent = const Rect.fromLTWH(0, 0, 640, 80),
  ),
  FilterItem(
    'Rounded Rectangle Generator',
    FlutterCoreImageFilters.createFilter<
        CIRoundedRectangleGeneratorConfiguration>(
      displayName: 'Rounded Rectangle Generator',
    )
      ..extent = const Rect.fromLTWH(10, 10, 300, 300)
      ..color = const Color.fromRGBO(150, 150, 150, 1.0)
      ..radius = 50,
  ),
  FilterItem(
    'Radial Gradient',
    FlutterCoreImageFilters.createFilter<CIRadialGradientConfiguration>(
      displayName: 'Radial Gradient',
    )
      ..radius1 = 400
      ..color0 = const Color.fromRGBO(150, 150, 150, 1)
      ..center = const Point(80.0, 80.0)
      ..radius0 = 400
      ..color1 = const Color.fromRGBO(0, 0, 0, 1),
  ),
  FilterItem(
    'Pinch Distortion',
    FlutterCoreImageFilters.createFilter<CIPinchDistortionConfiguration>(
      displayName: 'Pinch Distortion',
    )
      ..center = const Point(80.0, 80.0)
      ..scale = 1
      ..radius = 600,
  ),
  FilterItem(
    'Perspective Transform with Extent',
    FlutterCoreImageFilters.createFilter<
        CIPerspectiveTransformWithExtentConfiguration>(
      displayName: 'Perspective Transform with Extent',
    )
      ..bottomLeft = const Point(80.0, 80.0)
      ..topRight = const Point(300.0, 250.0)
      ..topLeft = const Point(60, 200.0)
      ..extent = const Rect.fromLTWH(20, 20, 150, 150)
      ..bottomRight = const Point(270.0, 70.0),
  ),
  FilterItem(
    'Perspective Transform',
    FlutterCoreImageFilters.createFilter<CIPerspectiveTransformConfiguration>(
      displayName: 'Perspective Transform',
    )
      ..bottomLeft = const Point(80.0, 80.0)
      ..topRight = const Point(300.0, 250.0)
      ..topLeft = const Point(60, 200.0)
      ..bottomRight = const Point(270.0, 70.0),
  ),
  FilterItem(
    'Perspective Tile',
    FlutterCoreImageFilters.createFilter<CIPerspectiveTileConfiguration>(
      displayName: 'Perspective Tile',
    )
      ..bottomLeft = const Point(80.0, 80.0)
      ..topRight = const Point(300.0, 250.0)
      ..topLeft = const Point(60, 200.0)
      ..bottomRight = const Point(270.0, 70.0),
  ),
  FilterItem(
    'Perspective Correction',
    FlutterCoreImageFilters.createFilter<CIPerspectiveCorrectionConfiguration>(
      displayName: 'Perspective Correction',
    )
      ..bottomLeft = const Point(80.0, 80.0)
      ..topRight = const Point(300.0, 250.0)
      ..topLeft = const Point(60, 200.0)
      ..crop = false
      ..bottomRight = const Point(270.0, 70.0),
  ),
  FilterItem(
    'Parallelogram Tile',
    FlutterCoreImageFilters.createFilter<CIParallelogramTileConfiguration>(
      displayName: 'Parallelogram Tile',
    )
      ..center = const Point(150.0, 150.0)
      ..width = 100
      ..acuteAngle = 1.570796326794897
      ..angle = 0,
  ),
  FilterItem(
    'Op Tile',
    FlutterCoreImageFilters.createFilter<CIOpTileConfiguration>(
      displayName: 'Op Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..width = 500
      ..angle = 3.14
      ..scale = 5,
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
    'Linear Gradient',
    FlutterCoreImageFilters.createFilter<CILinearGradientConfiguration>(
      displayName: 'Linear Gradient',
    )
      ..color0 = const Color.fromRGBO(100, 140, 140, 1)
      ..point1 = const Point(100.0, 100.0)
      ..point0 = const Point(200.0, 200.0)
      ..color1 = const Color.fromRGBO(1, 1, 1, 1),
  ),
  FilterItem(
    'Light Tunnel Distortion',
    FlutterCoreImageFilters.createFilter<CILightTunnelConfiguration>(
      displayName: 'Light Tunnel Distortion',
    )
      ..radius = 250
      ..center = const Point(75.0, 75.0)
      ..rotation = 0.28,
  ),
  FilterItem(
    'Lenticular Halo',
    FlutterCoreImageFilters.createFilter<
        CILenticularHaloGeneratorConfiguration>(
      displayName: 'Lenticular Halo',
    )
      ..haloRadius = 500
      ..color = const Color.fromRGBO(100, 100, 88, 1)
      ..center = const Point(75.0, 75.0)
      ..striationContrast = 1
      ..haloOverlap = 0.77
      ..time = 0
      ..striationStrength = 0.5
      ..haloWidth = 87,
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
    'Kaleidoscope',
    FlutterCoreImageFilters.createFilter<CIKaleidoscopeConfiguration>(
      displayName: 'Kaleidoscope',
    )
      ..angle = 3.14
      ..center = const Point(75.0, 75.0)
      ..count = 32,
  ),
  FilterItem(
    'Hole Distortion',
    FlutterCoreImageFilters.createFilter<CIHoleDistortionConfiguration>(
      displayName: 'Hole Distortion',
    )
      ..radius = 500
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
    'Glide Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIGlideReflectedTileConfiguration>(
      displayName: 'Glide Reflected Tile',
    )
      ..width = 100
      ..center = const Point(75.0, 75.0)
      ..angle = 3.14,
  ),
  FilterItem(
    'Glass Lozenge',
    FlutterCoreImageFilters.createFilter<CIGlassLozengeConfiguration>(
      displayName: 'Glass Lozenge',
    )
      ..refraction = 2.5
      ..radius = 500
      ..point0 = const Point(75.0, 75.0)
      ..point1 = const Point(150.0, 75.0),
  ),
  FilterItem(
    'Gaussian Gradient',
    FlutterCoreImageFilters.createFilter<CIGaussianGradientConfiguration>(
      displayName: 'Gaussian Gradient',
    )
      ..radius = 600
      ..center = const Point(75.0, 75.0)
      ..color1 = const Color.fromRGBO(0, 0, 0, 0)
      ..color0 = const Color.fromRGBO(255, 255, 255, 1),
  ),
  FilterItem(
    'Fourfold Translated Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldTranslatedTileConfiguration>(
      displayName: 'Fourfold Translated Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..width = 100
      ..angle = 3.14
      ..acuteAngle = 3.14,
  ),
  FilterItem(
    'Fourfold Rotated Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldRotatedTileConfiguration>(
      displayName: 'Fourfold Rotated Tile',
    )
      ..center = const Point(75.0, 75.0)
      ..width = 100
      ..angle = 3.14,
  ),
  FilterItem(
    'Fourfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CIFourfoldReflectedTileConfiguration>(
      displayName: 'Fourfold Reflected Tile',
    )
      ..acuteAngle = 3.14
      ..center = const Point(75.0, 75.0)
      ..width = 100
      ..angle = 3.14,
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
      ..insetPoint0 = const Point(100.0, 100.0)
      ..strands = 5
      ..insetPoint1 = const Point(200.0, 200.0)
      ..periodicity = 3
      ..zoom = 3
      ..rotation = 3.14,
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
    'Vertical 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9VerticalConfiguration>(
      displayName: 'Vertical 9 RGB Convolution',
    )
      ..bias = 1
      ..weights = Mat3([1, 1, 1, 1, 0, 1, 1, 1, 1]),
  ),
  FilterItem(
    'Horizontal 9 RGB Convolution',
    FlutterCoreImageFilters.createFilter<
        CIConvolutionRGB9HorizontalConfiguration>(
      displayName: 'Horizontal 9 RGB Convolution',
    )
      ..bias = 0
      ..weights = Mat3([1, 1, 1, 1, 0, 1, 1, 1, 1]),
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
    'Random Generator',
    FlutterCoreImageFilters.createFilter<CIRandomGeneratorConfiguration>(
      displayName: 'Random Generator',
    ),
  ),
  FilterItem(
    'Person Segmentation',
    FlutterCoreImageFilters.createFilter<CIPersonSegmentationConfiguration>(
      displayName: 'Person Segmentation',
    )..qualityLevel = 1,
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
    )..radius = 12,
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
