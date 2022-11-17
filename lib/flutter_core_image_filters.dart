import 'src/configurations/ci_bokeh_blur.dart';
import 'src/configurations/ci_box_blur.dart';
import 'src/configurations/ci_gaussian_blur.dart';
import 'src/configurations/ci_disc_blur.dart';
import 'src/configurations/ci_filter_configuration.dart';

import 'src/configurations/ci_color_cube.dart';

import 'dart:io' show Platform;

import 'src/configurations/ci_masked_variable_blur.dart';
import 'src/configurations/ci_monochrome.dart';
import 'src/configurations/ci_morphology_gradient.dart';
import 'src/configurations/ci_morphology_maximum.dart';
import 'src/configurations/ci_morphology_minimum.dart';
import 'src/configurations/ci_morphology_rectangle_minimum.dart';
import 'src/configurations/ci_morphology_rectangle_maximum.dart';
import 'src/configurations/ci_motion_blur.dart';
import 'src/configurations/ci_noise_reduction.dart';
export 'src/configurations/ci_filter_configuration.dart';
export 'src/ci_image_preview.dart';

Map<String, CIFilterConfiguration Function()> availableFilters = Platform.isIOS
    ? {
        'Color Cube': () => CIColorCubeConfiguration(),
        'Bokeh Blur': () => CIBokehBlurConfiguration(),
        'Box Blur': () => CIBoxBlurConfiguration(),
        'Disc Blur': () => CIDiscBlurConfiguration(),
        'Gaussian Blur': () => CIGaussianBlurConfiguration(),
        'Masked Variable Blur': () => CIMaskedVariableBlurConfiguration(),
        'Color Monochrome': () => CIMonochromeConfiguration(),
        'Morphology Gradient': () => CIMorphologyGradientConfiguration(),
        'Morphology Maximum': () => CIMorphologyMaximumConfiguration(),
        'Morphology Minimum': () => CIMorphologyMinimumConfiguration(),
        'Morphology Rectangle Maximum': () =>
            CIMorphologyRectangleMaximumConfiguration(),
        'Morphology Rectangle Minimum': () =>
            CIMorphologyRectangleMinimumConfiguration(),
        'Motion Blur': () => CIMotionBlurConfiguration(),
        'Noise Reduction': () => CINoiseReductionConfiguration(),
      }
    : {};
