library flutter_core_image_filters;

import 'dart:async';
import 'dart:io' show File, Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'core_image_filters_platform_interface.dart';

part 'src/ci_image_preview.dart';
part 'src/configurations/ci_color_cube.dart';
part 'src/configurations/ci_filter_configuration.dart';
part 'src/configurations/ci_monochrome.dart';
part 'src/parameters/ci_color_parameter.dart';
part 'src/parameters/ns_data_parameter.dart';
part 'src/parameters/ns_number_parameter.dart';
part 'src/parameters/slider_ns_number_parameter.dart';

Map<String, CIFilterConfiguration Function()> availableFilters =
    kDebugMode || Platform.isIOS
        ? {
            'Color Monochrome': () => CIMonochromeConfiguration(),
            'Color Cube': () => CIColorCubeConfiguration(),
          }
        : {};
