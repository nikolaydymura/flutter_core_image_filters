import 'src/configurations/ci_bokeh_blur.dart';
import 'src/configurations/ci_filter_configuration.dart';

import 'src/configurations/ci_color_cube.dart';

import 'dart:io' show Platform;

import 'src/configurations/ci_monochrome.dart';
export 'src/configurations/ci_filter_configuration.dart';
export 'src/ci_image_preview.dart';

Map<String, CIFilterConfiguration Function()> availableFilters = Platform.isIOS
    ? {

        'Color Cube': () => CIColorCubeConfiguration(),
  'Bokeh Blur Configuration': () => CIBokehBlurConfiguration(),
          'Color Monochrome': () => CIMonochromeConfiguration(),
      }
    : {};
