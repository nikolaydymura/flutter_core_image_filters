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
    'Sunbeams',
    FlutterCoreImageFilters.createFilter<CISunbeamsGeneratorConfiguration>(
      displayName: 'Sunbeams',
    ),
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
    'Stripes',
    FlutterCoreImageFilters.createFilter<CIStripesGeneratorConfiguration>(
      displayName: 'Stripes',
    ),
  ),
  FilterItem(
    'Stretch Crop',
    FlutterCoreImageFilters.createFilter<CIStretchCropConfiguration>(
      displayName: 'Stretch Crop',
    )
      ..centerStretchAmount = 0.5
      ..cropAmount = 0.5
      ..size = const Point(690.0, 380.0),
  ),
  FilterItem(
    'Stretch Crop',
    FlutterCoreImageFilters.createFilter<CIStretchCropConfiguration>(
      displayName: 'Stretch Crop',
    ),
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
    'Star Shine',
    FlutterCoreImageFilters.createFilter<CIStarShineGeneratorConfiguration>(
      displayName: 'Star Shine',
    ),
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
    'Smooth Linear Gradient',
    FlutterCoreImageFilters.createFilter<CISmoothLinearGradientConfiguration>(
      displayName: 'Smooth Linear Gradient',
    ),
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
    'Sixfold Rotated Tile',
    FlutterCoreImageFilters.createFilter<CISixfoldRotatedTileConfiguration>(
      displayName: 'Sixfold Rotated Tile',
    ),
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
    'Sixfold Reflected Tile',
    FlutterCoreImageFilters.createFilter<CISixfoldReflectedTileConfiguration>(
      displayName: 'Sixfold Reflected Tile',
    ),
  ),
  FilterItem(
    'Row Average',
    FlutterCoreImageFilters.createFilter<CIRowAverageConfiguration>(
      displayName: 'Row Average',
    )..extent = const Rect.fromLTWH(30, 30, 320, 40),
  ),
  FilterItem(
    'Row Average',
    FlutterCoreImageFilters.createFilter<CIRowAverageConfiguration>(
      displayName: 'Row Average',
    ),
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
    'Rounded Rectangle Generator',
    FlutterCoreImageFilters.createFilter<
        CIRoundedRectangleGeneratorConfiguration>(
      displayName: 'Rounded Rectangle Generator',
    ),
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
    'Radial Gradient',
    FlutterCoreImageFilters.createFilter<CIRadialGradientConfiguration>(
      displayName: 'Radial Gradient',
    ),
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
    'Pinch Distortion',
    FlutterCoreImageFilters.createFilter<CIPinchDistortionConfiguration>(
      displayName: 'Pinch Distortion',
    ),
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
    'Perspective Transform with Extent',
    FlutterCoreImageFilters.createFilter<
        CIPerspectiveTransformWithExtentConfiguration>(
      displayName: 'Perspective Transform with Extent',
    ),
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
    'Perspective Transform',
    FlutterCoreImageFilters.createFilter<CIPerspectiveTransformConfiguration>(
      displayName: 'Perspective Transform',
    ),
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
    'Perspective Tile',
    FlutterCoreImageFilters.createFilter<CIPerspectiveTileConfiguration>(
      displayName: 'Perspective Tile',
    ),
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
    'Perspective Correction',
    FlutterCoreImageFilters.createFilter<CIPerspectiveCorrectionConfiguration>(
      displayName: 'Perspective Correction',
    ),
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
    'Parallelogram Tile',
    FlutterCoreImageFilters.createFilter<CIParallelogramTileConfiguration>(
      displayName: 'Parallelogram Tile',
    ),
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
    'Op Tile',
    FlutterCoreImageFilters.createFilter<CIOpTileConfiguration>(
      displayName: 'Op Tile',
    ),
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
    'Nine Part Tiled',
    FlutterCoreImageFilters.createFilter<CINinePartTiledConfiguration>(
      displayName: 'Nine Part Tiled',
    ),
  ),
  FilterItem(
    'Nine Part Stretched',
    FlutterCoreImageFilters.createFilter<CINinePartStretchedConfiguration>(
      displayName: 'Nine Part Stretched',
    )
      ..breakpoint0 = const Point(80.0, 80.0)
      ..breakpoint1 = const Point(40.0, 40.0)
      ..growAmount = const Point(70.0, 70.0),
  ),
  FilterItem(
    'Nine Part Stretched',
    FlutterCoreImageFilters.createFilter<CINinePartStretchedConfiguration>(
      displayName: 'Nine Part Stretched',
    ),
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
    'Line Screen',
    FlutterCoreImageFilters.createFilter<CILineScreenConfiguration>(
      displayName: 'Line Screen',
    ),
  ),
  FilterItem(
    'Linear Gradient',
    FlutterCoreImageFilters.createFilter<CILinearGradientConfiguration>(
      displayName: 'Linear Gradient',
    )
      ..color0 = const Color.fromRGBO(0, 0, 0, 1)
      ..point1 = const Point(75.0, 0.0)
      ..point0 = const Point(0.0, 75.0)
      ..color1 = const Color.fromRGBO(255, 255, 255, 1),
  ),
  FilterItem(
    'Linear Gradient',
    FlutterCoreImageFilters.createFilter<CILinearGradientConfiguration>(
      displayName: 'Linear Gradient',
    ),
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
    'Light Tunnel Distortion',
    FlutterCoreImageFilters.createFilter<CILightTunnelConfiguration>(
      displayName: 'Light Tunnel Distortion',
    ),
  ),
  FilterItem(
    'Lenticular Halo',
    FlutterCoreImageFilters.createFilter<
        CILenticularHaloGeneratorConfiguration>(
      displayName: 'Lenticular Halo',
    )
      ..haloRadius = 500
      ..color = const Color.fromRGBO(209, 204, 255, 1)
      ..center = const Point(75.0, 75.0)
      ..striationContrast = 3
      ..haloOverlap = 0.55
      ..time = 1
      ..striationStrength = 1.5
      ..haloWidth = 150,
  ),
  FilterItem(
    'Lenticular Halo',
    FlutterCoreImageFilters.createFilter<
        CILenticularHaloGeneratorConfiguration>(
      displayName: 'Lenticular Halo',
    ),
  ),
  FilterItem(
    'Vertical Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionVerticalConfiguration>(
      displayName: 'Vertical Keystone Correction',
    )
      ..topRight = const Point(10.0, 2.0)
      ..topLeft = const Point(2.0, 10.0)
      ..bottomLeft = const Point(10.0, 5.0)
      ..bottomRight = const Point(5.0, 10.0)
      ..focalLength = 14,
  ),
  FilterItem(
    'Vertical Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionVerticalConfiguration>(
      displayName: 'Vertical Keystone Correction',
    ),
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
    'Horizontal Keystone Correction',
    FlutterCoreImageFilters.createFilter<
        CIKeystoneCorrectionHorizontalConfiguration>(
      displayName: 'Horizontal Keystone Correction',
    ),
  ),
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
