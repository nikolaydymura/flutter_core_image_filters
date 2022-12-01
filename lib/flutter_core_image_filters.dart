library flutter_core_image_filters;

import 'dart:async';
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'src/messages/filter_messages.g.dart';
import 'src/messages/preview_messages.g.dart';

part 'src/ci_image_preview.dart';
part 'src/ci_video_preview.dart';
part 'src/configurations/background_image_mixin.dart';
part 'src/configurations/ci_accordion_fold_transition.dart';
part 'src/configurations/ci_addition_compositing.dart';
part 'src/configurations/ci_attributed_text_image_generator.dart';
part 'src/configurations/ci_aztec_code_generator.dart';
part 'src/configurations/ci_barcode_generator.dart';
part 'src/configurations/ci_bars_swipe_transition.dart';
part 'src/configurations/ci_bicubic_scale_transform.dart';
part 'src/configurations/ci_blend_with_alpha_mask.dart';
part 'src/configurations/ci_blend_with_blue_mask.dart';
part 'src/configurations/ci_blend_with_mask.dart';
part 'src/configurations/ci_blend_with_red_mask.dart';
part 'src/configurations/ci_bloom.dart';
part 'src/configurations/ci_bokeh_blur.dart';
part 'src/configurations/ci_box_blur.dart';
part 'src/configurations/ci_code_128_barcode_generator.dart';
part 'src/configurations/ci_color_absolute_difference.dart';
part 'src/configurations/ci_color_blend_mode.dart';
part 'src/configurations/ci_color_burn_blend_mode.dart';
part 'src/configurations/ci_color_controls.dart';
part 'src/configurations/ci_color_cube.dart';
part 'src/configurations/ci_color_cubes_mixed_with_mask.dart';
part 'src/configurations/ci_color_dodge_blend_mode.dart';
part 'src/configurations/ci_color_map.dart';
part 'src/configurations/ci_color_monochrome.dart';
part 'src/configurations/ci_color_posterize.dart';
part 'src/configurations/ci_color_threshold.dart';
part 'src/configurations/ci_comic_effect.dart';
part 'src/configurations/ci_constant_color_generator.dart';
part 'src/configurations/ci_darken_blend_mode.dart';
part 'src/configurations/ci_difference_blend_mode.dart';
part 'src/configurations/ci_disc_blur.dart';
part 'src/configurations/ci_displacement_distortion.dart';
part 'src/configurations/ci_dissolve_transition.dart';
part 'src/configurations/ci_dither.dart';
part 'src/configurations/ci_divide_blend_mode.dart';
part 'src/configurations/ci_document_enhancer.dart';
part 'src/configurations/ci_edge_preserve_upsample_filter.dart';
part 'src/configurations/ci_edge_work.dart';
part 'src/configurations/ci_edges.dart';
part 'src/configurations/ci_exclusion_blend_mode.dart';
part 'src/configurations/ci_exposure_adjust.dart';
part 'src/configurations/ci_false_color.dart';
part 'src/configurations/ci_filter_configuration.dart';
part 'src/configurations/ci_gabor_gradients.dart';
part 'src/configurations/ci_gamma_adjust.dart';
part 'src/configurations/ci_gaussian_blur.dart';
part 'src/configurations/ci_gloom.dart';
part 'src/configurations/ci_guided_filter.dart';
part 'src/configurations/ci_hard_light_blend_mode.dart';
part 'src/configurations/ci_height_field_from_ask.dart';
part 'src/configurations/ci_highlight_shadow_adjust.dart';
part 'src/configurations/ci_histogram_display_filter.dart';
part 'src/configurations/ci_hue_adjust.dart';
part 'src/configurations/ci_hue_blend_mode.dart';
part 'src/configurations/ci_lab_delta_e.dart';
part 'src/configurations/ci_lanczos_scale_transform.dart';
part 'src/configurations/ci_lighten_blend_mode.dart';
part 'src/configurations/ci_line_overlay.dart';
part 'src/configurations/ci_linear_burn_blend_mode.dart';
part 'src/configurations/ci_linear_dodge_blend_mode.dart';
part 'src/configurations/ci_lookup_table.dart';
part 'src/configurations/ci_luminosity_blend_mode.dart';
part 'src/configurations/ci_masked_variable_blur.dart';
part 'src/configurations/ci_maximum_compositing.dart';
part 'src/configurations/ci_minimum_compositing.dart';
part 'src/configurations/ci_mix.dart';
part 'src/configurations/ci_morphology_gradient.dart';
part 'src/configurations/ci_morphology_maximum.dart';
part 'src/configurations/ci_morphology_minimum.dart';
part 'src/configurations/ci_morphology_rectangle_maximum.dart';
part 'src/configurations/ci_morphology_rectangle_minimum.dart';
part 'src/configurations/ci_motion_blur.dart';
part 'src/configurations/ci_multiply_blend_mode.dart';
part 'src/configurations/ci_multiply_compositing.dart';
part 'src/configurations/ci_no_parameters_configurations.dart';
part 'src/configurations/ci_noise_reduction.dart';
part 'src/configurations/ci_overlay_blend_mode.dart';
part 'src/configurations/ci_palette_centroid.dart';
part 'src/configurations/ci_palettize.dart';
part 'src/configurations/ci_pdf417_barcode_generator.dart';
part 'src/configurations/ci_perspective_rotate.dart';
part 'src/configurations/ci_pin_light_blend_mode.dart';
part 'src/configurations/ci_random_generator.dart';
part 'src/configurations/ci_saliency_map_filter.dart';
part 'src/configurations/ci_sample_nearest.dart';
part 'src/configurations/ci_saturation_blend_mode.dart';
part 'src/configurations/ci_screen_blend_mode.dart';
part 'src/configurations/ci_sepia_tone.dart';
part 'src/configurations/ci_shaded_material.dart';
part 'src/configurations/ci_sharpen_luminance.dart';
part 'src/configurations/ci_soft_light_blend_mode.dart';
part 'src/configurations/ci_source_atop_compositing.dart';
part 'src/configurations/ci_source_in_compositing.dart';
part 'src/configurations/ci_source_out_compositing.dart';
part 'src/configurations/ci_source_over_compositing.dart';
part 'src/configurations/ci_straighten_filter.dart';
part 'src/configurations/ci_subtract_blend_mode.dart';
part 'src/configurations/ci_unsharp_mask.dart';
part 'src/configurations/ci_vibrance.dart';
part 'src/configurations/ci_vignette.dart';
part 'src/configurations/ci_white_point_adjust.dart';
part 'src/configurations/image_mask_mixin.dart';
part 'src/parameters/cg_rect_parameter.dart';
part 'src/parameters/ci_color_parameter.dart';
part 'src/parameters/ci_image_parameter.dart';
part 'src/parameters/ns_data_parameter.dart';
part 'src/parameters/ns_number_parameter.dart';
part 'src/parameters/slider_ns_number_parameter.dart';

class FlutterCoreImageFilters {
  static Iterable<String> get availableFilters => _availableFilters.keys;
  static final Map<String, CIFilterConfiguration Function()> _availableFilters =
      {
    'Accordion Fold Transition': () => CIAccordionFoldTransitionConfiguration(),
    'Addition Compositing': () => CIAdditionCompositingConfiguration(),
    'Attributed TextImage Generator': () =>CIAttributedTextImageGeneratorConfiguration(),
    'Aztec Code Generator': () => CIAztecCodeGeneratorConfiguration(),
    'Barcode Generator': () => CIBarcodeGeneratorConfiguration(),
    'Bars Swipe Transition': () => CIBarsSwipeTransitionConfiguration(),
    'Bicubic Scale Transform': () => CIBicubicScaleTransformConfiguration(),
    'Blend With Alpha Mask': () => CIBlendWithAlphaMaskConfiguration(),
    'Blend With Blue Mask': () => CIBlendWithBlueMaskConfiguration(),
    'Blend With Mask': () => CIBlendWithMaskConfiguration(),
    'Blend With Red Mask': () => CIBlendWithRedMaskConfiguration(),
    'Bloom': () => CIBloomConfiguration(),
    'Bokeh Blur': () => CIBokehBlurConfiguration(),
    'Box Blur': () => CIBoxBlurConfiguration(),
    'Code 128 Barcode Generator': () => CICode128BarcodeGeneratorConfiguration(),
    'Color Absolute Difference': () => CIColorAbsoluteDifferenceConfiguration(),
    'Color Blend Mode': () => CIColorBlendModeConfiguration(),
    'Color Burn Blend Mode': () => CIColorBurnBlendModeConfiguration(),
    'Color Controls': () => CIColorControlsConfiguration(),
    'Color Cube': () => CIColorCubeConfiguration(),
    'Color Cubes Mixed With Mask': () =>CIColorCubesMixedWithMaskConfiguration(),
    'Color Dodge Blend Mode': () => CIColorDodgeBlendModeConfiguration(),
    'Color Invert': () => CIColorInvertConfiguration(),
    'Color Map': () => CIColorMapConfiguration(),
    'Color Monochrome': () => CIMonochromeConfiguration(),
    'Color Posterize': () => CIColorPosterizeConfiguration(),
    'Color Threshold Otsu': () => CIColorThresholdOtsuConfiguration(),
    'Color Threshold': () => CIColorThresholdConfiguration(),
    'Comic Effect': () => CIComicEffectConfiguration(),
    'Constant Color Generator': () => CIConstantColorGeneratorConfiguration(),
    'Darken Blend Mode': () => CIDarkenBlendModeConfiguration(),
    'Depth To Disparity': () => CIDepthToDisparityConfiguration(),
    'Difference Blend Mode': () => CIDifferenceBlendModeConfiguration(),
    'Disc Blur': () => CIDiscBlurConfiguration(),
    'Disparity To Depth': () => CIDisparityToDepthConfiguration(),
    'Displacement Distortion': () => CIDisplacementDistortionConfiguration(),
    'Dissolve Transition': () => CIDissolveTransitionConfiguration(),
    'Dither': () => CIDitherConfiguration(),
    'Divide Blend Mode': () => CIDivideBlendModeConfiguration(),
    'Document Enhancer': () => CIDocumentEnhancerConfiguration(),
    'Edge Preserve Upsample Filter': () =>CIEdgePreserveUpsampleFilterConfiguration(),
    'Edge Work': () => CIEdgeWorkConfiguration(),
    'Edges': () => CIEdgesConfiguration(),
    'Exclusion Blend Mode': () => CIExclusionBlendModeConfiguration(),
    'Exposure Adjust': () => CIExposureAdjustConfiguration(),
    'False Color': () => CIFalseColorConfiguration(),
    'Gabor Gradients': () => CIGaborGradientsConfiguration(),
    'Gamma Adjust': () => CIGammaAdjustConfiguration(),
    'Gaussian Blur': () => CIGaussianBlurConfiguration(),
    'Gloom': () => CIGloomConfiguration(),
    'Guided Filter': () => CIGuidedFilterConfiguration(),
    'Hard Light Blend Mode': () => CIHardLightBlendModeConfiguration(),
    'Height Field From Mask': () => CIHeightFieldFromMaskConfiguration(),
    'Highlight Shadow Adjust': () => CIHighlightShadowAdjustConfiguration(),
    'Histogram Display Filter': () => CIHistogramDisplayFilterConfiguration(),
    'Hue Adjust': () => CIHueAdjustConfiguration(),
    'Hue Blend Mode': () => CIHueBlendModeConfiguration(),
    'Lab Delta E': () => CILabDeltaEConfiguration(),
    'Lanczos Scale Transform': () => CILanczosScaleTransformConfiguration(),
    'Lighten Blend Mode': () => CILightenBlendModeConfiguration(),
    'Line Overlay': () => CILineOverlayConfiguration(),
    'Linear Burn Blend Mode': () => CILinearBurnBlendModeConfiguration(),
    'Linear Dodge Blend Mode': () => CILinearDodgeBlendModeConfiguration(),
    'Linear To SRGB Tone Curve': () => CILinearToSRGBToneCurveConfiguration(),
    'Lookup Table': () => CILookupTableConfiguration(),
    'Luminosity Blend Mode': () => CILuminosityBlendModeConfiguration(),
    'Mask ToAlpha': () => CIMaskToAlphaConfiguration(),
    'Masked Variable Blur': () => CIMaskedVariableBlurConfiguration(),
    'Maximum Component': () => CIMaximumComponentConfiguration(),
    'Maximum': () => CIMaximumCompositingConfiguration(),
    'Median Filter': () => CIMedianFilterConfiguration(),
    'Minimum Component': () => CIMinimumComponentConfiguration(),
    'Minimum': () => CIMinimumCompositingConfiguration(),
    'Monochrome': () => CIMonochromeConfiguration(),
    'Morphology Gradient': () => CIMorphologyGradientConfiguration(),
    'Morphology Maximum': () => CIMorphologyMaximumConfiguration(),
    'Morphology Minimum': () => CIMorphologyMinimumConfiguration(),
    'Morphology Rectangle Maximum': () => CIMorphologyRectangleMaximumConfiguration(),
    'Morphology Rectangle Minimum': () =>CIMorphologyRectangleMinimumConfiguration(),
    'Motion Blur': () => CIMotionBlurConfiguration(),
    'Multiply Blend Mode': () => CIMultiplyBlendModeConfiguration(),
    'Multiply': () => CIMultiplyCompositingConfiguration(),
    'Noise Reduction': () => CINoiseReductionConfiguration(),
    'Overlay Blend Mode': () => CIOverlayBlendModeConfiguration(),
    'PDF417 Barcode Generator': () => CIPDF417BarcodeGeneratorConfiguration(),
    'Palette Centroid': () => CIPaletteCentroidConfiguration(),
    'Palettize': () => CIPalettizeConfiguration(),
    'Perspective Rotate': () => CIPerspectiveRotateConfiguration(),
    'Photo Effect Chrome': () => CIPhotoEffectChromeConfiguration(),
    'Photo Effect Fade': () => CIPhotoEffectFadeConfiguration(),
    'Photo Effect Instant': () => CIPhotoEffectInstantConfiguration(),
    'Photo Effect Mono': () => CIPhotoEffectMonoConfiguration(),
    'Photo Effect Noir': () => CIPhotoEffectNoirConfiguration(),
    'Photo Effect Process': () => CIPhotoEffectProcessConfiguration(),
    'Photo Effect Tonal': () => CIPhotoEffectTonalConfiguration(),
    'Photo Effect Transfer': () => CIPhotoEffectTransferConfiguration(),
    'Pin Light Blend Mode': () => CIPinLightBlendModeConfiguration(),
    'Random Generator': () => CIRandomGeneratorConfiguration(),
    'SRGB Tone Curve To Linear': () => CISRGBToneCurveToLinearConfiguration(),
    'Saliency Map Filter': () => CISaliencyMapFilterConfiguration(),
    'Sample Nearest': () => CISampleNearestConfiguration(),
    'Saturation Blend Mode': () => CISaturationBlendModeConfiguration(),
    'Screen Blend Mode': () => CIScreenBlendModeConfiguration(),
    'Sepia Tone': () => CISepiaToneConfiguration(),
    'Shaded Material': () => CIShadedMaterialConfiguration(),
    'Sharpen Luminance': () => CISharpenLuminanceConfiguration(),
    'Soft Light Blend Mode': () => CISoftLightBlendModeConfiguration(),
    'Source Atop': () => CISourceAtopCompositingConfiguration(),
    'Source In': () => CISourceInCompositingConfiguration(),
    'Source Out': () => CISourceOutCompositingConfiguration(),
    'Source Over': () => CISourceOverCompositingConfiguration(),
    'Straighten Filter': () => CIStraightenFilterConfiguration(),
    'Subtract Blend Mode': () => CISubtractBlendModeConfiguration(),
    'Thermal': () => CIThermalConfiguration(),
    'Unsharp Mask': () => CIUnsharpMaskConfiguration(),
    'Vibrance': () => CIVibranceConfiguration(),
    'Vignette': () => CIVignetteConfiguration(),
    'White Point Adjust': () => CIWhitePointAdjustConfiguration(),
    'XRay': () => CIXRayConfiguration(),
  };

  static CIFilterConfiguration? createFilter({required String displayName}) {
    return _availableFilters[displayName]?.call();
  }
}
