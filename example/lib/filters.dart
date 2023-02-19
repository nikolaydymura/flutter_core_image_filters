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
