import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

class FilterItem {
  final String name;
  final CIFilterConfiguration configuration;

  FilterItem(this.name, this.configuration);
}

final kFilters = [
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
