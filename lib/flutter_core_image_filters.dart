import 'src/configurations/ci_attributed_text_image_generator.dart';
import 'src/configurations/ci_aztec_code_generator.dart';
import 'src/configurations/ci_bicubic_scale_transform.dart';
import 'src/configurations/ci_bloom.dart';
import 'src/configurations/ci_bokeh_blur.dart';
import 'src/configurations/ci_box_blur.dart';
import 'src/configurations/ci_code_128_barcode_generator.dart';
import 'src/configurations/ci_color_controls.dart';
import 'src/configurations/ci_color_cubes_mixed_with_mask.dart';
import 'src/configurations/ci_color_posterize.dart';
import 'src/configurations/ci_constant_color_generator.dart';
import 'src/configurations/ci_displacement_distortion.dart';
import 'src/configurations/ci_dither.dart';
import 'src/configurations/ci_edge_work.dart';
import 'src/configurations/ci_histogram_display_filter.dart';
import 'src/configurations/ci_lanczos_scale_transform.dart';
import 'src/configurations/ci_edge_preserve_upsample_filter.dart';
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
import 'src/configurations/ci_palettize.dart';
import 'src/configurations/ci_pdf417_barcode_generator.dart';
import 'src/configurations/ci_perspective_rotate.dart';
import 'src/configurations/ci_vignette.dart';
import 'src/configurations/ci_sepia_tone.dart';
import 'src/configurations/ci_palette_centroid.dart';
import 'src/configurations/ci_unsharp_mask.dart';
import 'src/configurations/ci_sharpen_luminance.dart';
import 'src/configurations/ci_straighten_filter.dart';
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
        'Displacement Distortion': () =>
            CIDisplacementDistortionConfiguration(),
        'Attributed TextImage Generator': () =>
            CIAttributedTextImageGeneratorConfiguration(),
        'Aztec Code Generator': () => CIAztecCodeGeneratorConfiguration(),
        'Code 128 Barcode Generator': () =>
            CICode128BarcodeGeneratorConfiguration(),
        'Constant Color Generator': () =>
            CIConstantColorGeneratorConfiguration(),
        'PDF417 Barcode Generator': () =>
            CIPDF417BarcodeGeneratorConfiguration(),
        'Bicubic Scale Transform': () => CIBicubicScaleTransformConfiguration(),
        'Edge Preserve Upsample Filter': () =>
            CIEdgePreserveUpsampleFilterConfiguration(),
        'Lanczos Scale Transform': () => CILanczosScaleTransformConfiguration(),
        'Perspective Rotate': () => CIPerspectiveRotateConfiguration(),
        'Straighten Filter': () => CIStraightenFilterConfiguration(),
        'Histogram Display Filter': () =>
            CIHistogramDisplayFilterConfiguration(),
        'Sharpen Luminance': () => CISharpenLuminanceConfiguration(),
        'Unsharp Mask': () => CIUnsharpMaskConfiguration(),
        'Bloom': () => CIBloomConfiguration(),
        'Edge Work': () => CIEdgeWorkConfiguration(),
      }
    : {};
