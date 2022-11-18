library flutter_core_image_filters;

import 'dart:async';
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'core_image_filters_platform_interface.dart';

part 'src/ci_image_preview.dart';
part 'src/ci_video_preview.dart';
part 'src/configurations/background_image_mixin.dart';
part 'src/configurations/ci_addition_compositing.dart';
part 'src/configurations/ci_barcode_generator.dart';
part 'src/configurations/ci_blend_with_alpha_mask.dart';
part 'src/configurations/ci_blend_with_blue_mask.dart';
part 'src/configurations/ci_blend_with_mask.dart';
part 'src/configurations/ci_blend_with_red_mask.dart';
part 'src/configurations/ci_color_absolute_difference.dart';
part 'src/configurations/ci_color_blend_mode.dart';
part 'src/configurations/ci_color_burn_blend_mode.dart';
part 'src/configurations/ci_color_cube.dart';
part 'src/configurations/ci_color_dodge_blend_mode.dart';
part 'src/configurations/ci_color_map.dart';
part 'src/configurations/ci_comic_effect.dart';
part 'src/configurations/ci_darken_blend_mode.dart';
part 'src/configurations/ci_difference_blend_mode.dart';
part 'src/configurations/ci_divide_blend_mode.dart';
part 'src/configurations/ci_exclusion_blend_mode.dart';
part 'src/configurations/ci_filter_configuration.dart';
part 'src/configurations/ci_gabor_gradients.dart';
part 'src/configurations/ci_hard_light_blend_mode.dart';
part 'src/configurations/ci_hue_blend_mode.dart';
part 'src/configurations/ci_lighten_blend_mode.dart';
part 'src/configurations/ci_linear_burn_blend_mode.dart';
part 'src/configurations/ci_linear_dodge_blend_mode.dart';
part 'src/configurations/ci_luminosity_blend_mode.dart';
part 'src/configurations/ci_maximum_compositing.dart';
part 'src/configurations/ci_minimum_compositing.dart';
part 'src/configurations/ci_color_monochrome.dart';
part 'src/configurations/ci_multiply_blend_mode.dart';
part 'src/configurations/ci_multiply_compositing.dart';
part 'src/configurations/ci_no_parameters_configurations.dart';
part 'src/configurations/ci_overlay_blend_mode.dart';
part 'src/configurations/ci_pin_light_blend_mode.dart';
part 'src/configurations/ci_random_generator.dart';
part 'src/configurations/ci_saliency_map_filter.dart';
part 'src/configurations/ci_sample_nearest.dart';
part 'src/configurations/ci_saturation_blend_mode.dart';
part 'src/configurations/ci_screen_blend_mode.dart';
part 'src/configurations/ci_soft_light_blend_mode.dart';
part 'src/configurations/ci_source_atop_compositing.dart';
part 'src/configurations/ci_source_in_compositing.dart';
part 'src/configurations/ci_source_out_compositing.dart';
part 'src/configurations/ci_source_over_compositing.dart';
part 'src/configurations/ci_subtract_blend_mode.dart';
part 'src/configurations/image_mask_mixin.dart';
part 'src/parameters/ci_color_parameter.dart';
part 'src/parameters/ci_image_parameter.dart';
part 'src/parameters/ns_data_parameter.dart';
part 'src/parameters/ns_number_parameter.dart';
part 'src/parameters/slider_ns_number_parameter.dart';

class FlutterCoreImageFilters {
  static Iterable<String> get availableFilters => _availableFilters.keys;
  static final Map<String, CIFilterConfiguration Function()> _availableFilters =
      {
    'Addition Compositing': () => CIAdditionCompositingConfiguration(),
    'Barcode Generator': () => CIBarcodeGeneratorConfiguration(),
    'Blend With Alpha Mask': () => CIBlendWithAlphaMaskConfiguration(),
    'Blend With Blue Mask': () => CIBlendWithBlueMaskConfiguration(),
    'Blend With Mask': () => CIBlendWithMaskConfiguration(),
    'Blend With Red Mask': () => CIBlendWithRedMaskConfiguration(),
    'Random Generator': () => CIRandomGeneratorConfiguration(),
    'Color Absolute Difference': () => CIColorAbsoluteDifferenceConfiguration(),
    'Color Blend Mode': () => CIColorBlendModeConfiguration(),
    'Color Burn Blend Mode': () => CIColorBurnBlendModeConfiguration(),
    'Color Cube': () => CIColorCubeConfiguration(),
    'Color Dodge Blend Mode': () => CIColorDodgeBlendModeConfiguration(),
    'Color Invert': () => CIColorInvertConfiguration(),
    'Color Map': () => CIColorMapConfiguration(),
    'Color Threshold Otsu': () => CIColorThresholdOtsuConfiguration(),
    'Comic Effect': () => CIComicEffectConfiguration(),
    'Darken Blend Mode': () => CIDarkenBlendModeConfiguration(),
    'Depth To Disparity': () => CIDepthToDisparityConfiguration(),
    'Difference Blend Mode': () => CIDifferenceBlendModeConfiguration(),
    'Disparity To Depth': () => CIDisparityToDepthConfiguration(),
    'Divide Blend Mode': () => CIDivideBlendModeConfiguration(),
    'Exclusion Blend Mode': () => CIExclusionBlendModeConfiguration(),
    'Gabor Gradients': () => CIGaborGradientsConfiguration(),
    'Hard Light Blend Mode': () => CIHardLightBlendModeConfiguration(),
    'Hue Blend Mode': () => CIHueBlendModeConfiguration(),
    'Lighten Blend Mode': () => CILightenBlendModeConfiguration(),
    'Linear Burn Blend Mode': () => CILinearBurnBlendModeConfiguration(),
    'Linear Dodge Blend Mode': () => CILinearDodgeBlendModeConfiguration(),
    'Linear To SRGB Tone Curve': () => CILinearToSRGBToneCurveConfiguration(),
    'Luminosity Blend Mode': () => CILuminosityBlendModeConfiguration(),
    'Mask ToAlpha': () => CIMaskToAlphaConfiguration(),
    'Maximum Component': () => CIMaximumComponentConfiguration(),
    'Maximum': () => CIMaximumCompositingConfiguration(),
    'Median Filter': () => CIMedianFilterConfiguration(),
    'Minimum Component': () => CIMinimumComponentConfiguration(),
    'Minimum': () => CIMinimumCompositingConfiguration(),
    'Monochrome': () => CIMonochromeConfiguration(),
    'Multiply Blend Mode': () => CIMultiplyBlendModeConfiguration(),
    'Multiply': () => CIMultiplyCompositingConfiguration(),
    'Overlay Blend Mode': () => CIOverlayBlendModeConfiguration(),
    'Photo Effect Chrome': () => CIPhotoEffectChromeConfiguration(),
    'Photo Effect Fade': () => CIPhotoEffectFadeConfiguration(),
    'Photo Effect Instant': () => CIPhotoEffectInstantConfiguration(),
    'Photo Effect Mono': () => CIPhotoEffectMonoConfiguration(),
    'Photo Effect Noir': () => CIPhotoEffectNoirConfiguration(),
    'Photo Effect Process': () => CIPhotoEffectProcessConfiguration(),
    'Photo Effect Tonal': () => CIPhotoEffectTonalConfiguration(),
    'Photo Effect Transfer': () => CIPhotoEffectTransferConfiguration(),
    'Pin Light Blend Mode': () => CIPinLightBlendModeConfiguration(),
    'SRGB Tone Curve To Linear': () => CISRGBToneCurveToLinearConfiguration(),
    'Saliency Map Filter': () => CISaliencyMapFilterConfiguration(),
    'Sample Nearest': () => CISampleNearestConfiguration(),
    'Saturation Blend Mode': () => CISaturationBlendModeConfiguration(),
    'Screen Blend Mode': () => CIScreenBlendModeConfiguration(),
    'Soft Light Blend Mode': () => CISoftLightBlendModeConfiguration(),
    'Source Atop': () => CISourceAtopCompositingConfiguration(),
    'Source In': () => CISourceInCompositingConfiguration(),
    'Source Out': () => CISourceOutCompositingConfiguration(),
    'Source Over': () => CISourceOverCompositingConfiguration(),
    'Subtract Blend Mode': () => CISubtractBlendModeConfiguration(),
    'Thermal': () => CIThermalConfiguration(),
    'XRay': () => CIXRayConfiguration(),
  };

  static CIFilterConfiguration? createFilter({required String displayName}) {
    return _availableFilters[displayName]?.call();
  }
}
