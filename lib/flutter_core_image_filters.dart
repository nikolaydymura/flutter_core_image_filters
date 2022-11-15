import 'src/configurations/ci_color_cube.dart';

import 'dart:io' show Platform;

import 'src/configurations/ci_depth_to_disparity.dart';
import 'src/configurations/ci_linear_to_srgb_tone_curve.dart';
import 'src/configurations/ci_medianFilter.dart';
import 'src/configurations/ci_monochrome.dart';
export 'src/configurations/ci_filter_configuration.dart';
import 'src/configurations/ci_addition_compositing.dart';
import 'src/configurations/ci_color_absolute_difference.dart';
import 'src/configurations/ci_color_threshold_otsu.dart';
import 'src/configurations/ci_disparity_to_depth.dart';
import 'src/configurations/ci_filter_configuration.dart';
export 'src/ci_image_preview.dart';

Map<String, CIFilterConfiguration Function()> availableFilters = Platform.isIOS
    ? {
        'Addition Compositing': () => CIAdditionCompositingConfiguration(),
        'Color Absolute Difference': () =>
            CIColorAbsoluteDifferenceConfiguration(),
        'Color Cube': () => CIColorCubeConfiguration(),
        'Color Threshold Otsu': () => CIColorThresholdOtsuConfiguration(),
        'Depth To Disparity': () => CIDepthToDisparityConfiguration(),
        'Disparity To Depth': () => CIDisparityToDepthConfiguration(),
        'Linear To SRGB Tone Curve': () =>
            CILinearToSRGBToneCurveConfiguration(),
        'Median Filter': () => CIMedianFilterConfiguration(),
        'Monochrome': () => CIMonochromeConfiguration(),
      }
    : {};
