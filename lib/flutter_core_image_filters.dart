import 'src/configurations/ci_bokeh_blur.dart';
import 'src/configurations/ci_box_blur.dart';
import 'src/configurations/ci_color_controls.dart';
import 'src/configurations/ci_color_cubes_mixed_with_mask.dart';
import 'src/configurations/ci_color_posterize.dart';
import 'src/configurations/ci_dither.dart';
import 'src/configurations/ci_exposure_adjust.dart';
import 'src/configurations/ci_color_threshold.dart';
import 'src/configurations/ci_false_color.dart';
import 'src/configurations/ci_gamma_adjust.dart';
import 'src/configurations/ci_gaussian_blur.dart';
import 'src/configurations/ci_disc_blur.dart';
import 'src/configurations/ci_filter_configuration.dart';

import 'src/configurations/ci_color_cube.dart';

import 'dart:io' show Platform;

import 'src/configurations/ci_document_enhancer.dart';
import 'src/configurations/ci_lab_delta_e.dart';
import 'src/configurations/ci_palette_centroid copy.dart';
import 'src/configurations/ci_sepia_tone copy.dart';
import 'src/configurations/ci_sepia_tone.dart';
import 'src/configurations/ci_palette_centroid.dart';
import 'src/configurations/ci_vibrance.dart';
import 'src/configurations/ci_hue_adjust.dart';
import 'src/configurations/ci_masked_variable_blur.dart';
import 'src/configurations/ci_monochrome.dart';
import 'src/configurations/ci_morphology_gradient.dart';
import 'src/configurations/ci_morphology_maximum.dart';
import 'src/configurations/ci_morphology_minimum.dart';
import 'src/configurations/ci_morphology_rectangle_minimum.dart';
import 'src/configurations/ci_morphology_rectangle_maximum.dart';
import 'src/configurations/ci_motion_blur.dart';
import 'src/configurations/ci_noise_reduction.dart';
import 'src/configurations/ci_white_point_adjust.dart';
export 'src/configurations/ci_filter_configuration.dart';
export 'src/ci_image_preview.dart';

Map<String, CIFilterConfiguration Function()> availableFilters = Platform.isIOS
    ? {
        'Bokeh Blur': () => CIBokehBlurConfiguration(),
        'Box Blur': () => CIBoxBlurConfiguration(),
        'Disc Blur': () => CIDiscBlurConfiguration(),
        'Gaussian Blur': () => CIGaussianBlurConfiguration(),
        'Masked Variable Blur': () => CIMaskedVariableBlurConfiguration(),
        'Morphology Gradient': () => CIMorphologyGradientConfiguration(),
        'Morphology Maximum': () => CIMorphologyMaximumConfiguration(),
        'Morphology Minimum': () => CIMorphologyMinimumConfiguration(),
        'Morphology Rectangle Maximum': () =>
            CIMorphologyRectangleMaximumConfiguration(),
        'Morphology Rectangle Minimum': () =>
            CIMorphologyRectangleMinimumConfiguration(),
        'Motion Blur': () => CIMotionBlurConfiguration(),
        'Noise Reduction': () => CINoiseReductionConfiguration(),
        'Color Controls': () => CIColorControlsConfiguration(),
        'Color Threshold': () => CIColorThresholdConfiguration(),
        'Exposure Adjust': () => CIExposureAdjustConfiguration(),
        'Gamma Adjust': () => CIGammaAdjustConfiguration(),
        'Hue Adjust': () => CIHueAdjustConfiguration(),
        'Vibrance': () => CIVibranceConfiguration(),
        'White Point Adjust': () => CIWhitePointAdjustConfiguration(),
        'Color Cube': () => CIColorCubeConfiguration(),
        'Color Cubes Mixed With Mask': () =>
            CIColorCubesMixedWithMaskConfiguration(),
        'Color Monochrome': () => CIMonochromeConfiguration(),
        'Color Posterize': () => CIColorPosterizeConfiguration(),
        'Dither': () => CIDitherConfiguration(),
        'Document Enhancer': () => CIDocumentEnhancerConfiguration(),
        'False Color': () => CIFalseColorConfiguration(),
        'Lab Delta E': () => CILabDeltaEConfiguration(),
        'Palette Centroid': () => CIPaletteCentroidConfiguration(),
        'Palettize': () => CIPalettizeConfiguration(),
        'Sepia Tone': () => CISepiaToneConfiguration(),
        'Vignette': () => CIVignetteConfiguration(),
      }
    : {};
