import 'src/configurations/ci_barcode_generator.dart';
import 'src/configurations/ci_blend_with_alpha_mask.dart';
import 'src/configurations/ci_blend_with_blue_mask.dart';
import 'src/configurations/ci_blend_with_mask.dart';
import 'src/configurations/ci_blend_with_red_mask.dart';
import 'src/configurations/ci_color_blend_mode.dart';
import 'src/configurations/ci_color_burn_blend_mode.dart';
import 'src/configurations/ci_color_cube.dart';

import 'dart:io' show Platform;

import 'src/configurations/ci_color_dodge_blend_mode.dart';
import 'src/configurations/ci_color_invert.dart';
import 'src/configurations/ci_color_map.dart';
import 'src/configurations/ci_comic_effect.dart';
import 'src/configurations/ci_darken_blend_mode.dart';
import 'src/configurations/ci_depth_to_disparity.dart';
import 'src/configurations/ci_difference_blend_mode.dart';
import 'src/configurations/ci_divide_blend_mode.dart';
import 'src/configurations/ci_exclusion_blend_mode.dart';
import 'src/configurations/ci_gabor_gradients.dart';
import 'src/configurations/ci_hard_light_blend_mode.dart';
import 'src/configurations/ci_hue_blend_mode.dart';
import 'src/configurations/ci_lighten_blend_mode.dart';
import 'src/configurations/ci_linear_burn_blend_mode.dart';
import 'src/configurations/ci_linear_dodge_blend_mode.dart';
import 'src/configurations/ci_linear_to_srgb_tone_curve.dart';
import 'src/configurations/ci_luminosity_blend_mode.dart';
import 'src/configurations/ci_mask_to_alpha.dart';
import 'src/configurations/ci_maximum_component.dart';
import 'src/configurations/ci_maximum_compositing.dart';
import 'src/configurations/ci_medianFilter.dart';
import 'src/configurations/ci_minimum_component.dart';
import 'src/configurations/ci_minimum_compositing.dart';
import 'src/configurations/ci_monochrome.dart';
export 'src/configurations/ci_filter_configuration.dart';
import 'src/configurations/ci_addition_compositing.dart';
import 'src/configurations/ci_color_absolute_difference.dart';
import 'src/configurations/ci_color_threshold_otsu.dart';
import 'src/configurations/ci_disparity_to_depth.dart';
import 'src/configurations/ci_filter_configuration.dart';
import 'src/configurations/ci_multiply_blend_mode.dart';
import 'src/configurations/ci_multiply_compositing.dart';
import 'src/configurations/ci_overlay_blend_mode.dart';
import 'src/configurations/ci_photo_eEffect_chrome.dart';
import 'src/configurations/ci_photo_effect_fade.dart';
import 'src/configurations/ci_photo_effect_instant.dart';
import 'src/configurations/ci_photo_effect_mono.dart';
import 'src/configurations/ci_photo_effect_noir.dart';
import 'src/configurations/ci_photo_effect_process.dart';
import 'src/configurations/ci_photo_effect_tonal.dart';
import 'src/configurations/ci_photo_effect_transfer.dart';
import 'src/configurations/ci_pin_light_blend_mode.dart';
import 'src/configurations/ci_random_generator.dart';
import 'src/configurations/ci_saliency_map_filter.dart';
import 'src/configurations/ci_sample_nearest.dart';
import 'src/configurations/ci_saturation_blend_mode.dart';
import 'src/configurations/ci_screen_blend_mode.dart';
import 'src/configurations/ci_soft_light_blend_mode.dart';
import 'src/configurations/ci_sourceIn_compositing.dart';
import 'src/configurations/ci_source_out_compositing.dart';
import 'src/configurations/ci_source_over_compositing.dart';
import 'src/configurations/ci_sourcea_atop_compositing.dart';
import 'src/configurations/ci_srgb_tone_curve_to_linear.dart';
import 'src/configurations/ci_subtract_blend_mode.dart';
import 'src/configurations/ci_thermal.dart';
import 'src/configurations/ci_xray.dart';
export 'src/ci_image_preview.dart';

Map<String, CIFilterConfiguration Function()> availableFilters = Platform.isIOS
    ? {
        'Addition Compositing': () => CIAdditionCompositingConfiguration(),
        'Color Cube': () => CIColorCubeConfiguration(),
        'Monochrome': () => CIMonochromeConfiguration(),
        'Color Absolute Difference': () =>
            CIColorAbsoluteDifferenceConfiguration(),
        'Color Invert': () => CIColorInvertConfiguration(),
        'Color Map': () => CIColorMapConfiguration(),
        'Color Threshold Otsu': () => CIColorThresholdOtsuConfiguration(),
        'Depth To Disparity': () => CIDepthToDisparityConfiguration(),
        'Disparity To Depth': () => CIDisparityToDepthConfiguration(),
        'Linear To SRGB Tone Curve': () =>
            CILinearToSRGBToneCurveConfiguration(),
        'Mask ToAlpha': () => CIMaskToAlphaConfiguration(),
        'Maximum Component': () => CIMaximumComponentConfiguration(),
        'Minimum Component': () => CIMinimumComponentConfiguration(),
        'Median Filter': () => CIMedianFilterConfiguration(),
        'Photo Effect Chrome': () => CIPhotoEffectChromeConfiguration(),
        'PhotoEffectFade': () => CIPhotoEffectFadeConfiguration(),
        'PhotoEffectInstant': () => CIPhotoEffectInstantConfiguration(),
        'PhotoEffectMono': () => CIPhotoEffectMonoConfiguration(),
        'PhotoEffectNoir': () => CIPhotoEffectNoirConfiguration(),
        'PhotoEffectProcess': () => CIPhotoEffectProcessConfiguration(),
        'PhotoEffectTonal': () => CIPhotoEffectTonalConfiguration(),
        'PhotoEffectTransfer': () => CIPhotoEffectTransferConfiguration(),
        'SRGB Tone Curve To Linear': () =>
            CISRGBToneCurveToLinearConfiguration(),
        'Thermal': () => CIThermalConfiguration(),
        'XRay': () => CIXRayConfiguration(),
        'Color Blend Mode': () => CIColorBlendModeConfiguration(),
        'CIColorBurnBlendMode': () => CIColorBurnBlendModeConfiguration(),
        'CIColorDodgeBlendMode': () => CIColorDodgeBlendModeConfiguration(),
        'CIDarkenBlendMode': () => CIDarkenBlendModeConfiguration(),
        'CIDifferenceBlendMode': () => CIDifferenceBlendModeConfiguration(),
        'CIDivideBlendMode': () => CIDivideBlendModeConfiguration(),
        'CIExclusionBlendMode': () => CIExclusionBlendModeConfiguration(),
        'CIHardLightBlendMode': () => CIHardLightBlendModeConfiguration(),
        'CIHueBlendMode': () => CIHueBlendModeConfiguration(),
        'CILightenBlendMode': () => CILightenBlendModeConfiguration(),
        'CILinearBurnBlendMode': () => CILinearBurnBlendModeConfiguration(),
        'CILinearDodgeBlendMode': () => CILinearDodgeBlendModeConfiguration(),
        'CILuminosityBlendMode': () => CILuminosityBlendModeConfiguration(),
        'CIMaximumCompositing': () => CIMaximumCompositingConfiguration(),
        'CIMinimumCompositing': () => CIMinimumCompositingConfiguration(),
        'CIMultiplyBlendMode': () => CIMultiplyBlendModeConfiguration(),
        'CIMultiplyCompositing': () => CIMultiplyCompositingConfiguration(),
        'CIOverlayBlendMode': () => CIOverlayBlendModeConfiguration(),
        'CIPinLightBlendMode': () => CIPinLightBlendModeConfiguration(),
        'CISaturationBlendMode': () => CISaturationBlendModeConfiguration(),
        'CIScreenBlendMode': () => CIScreenBlendModeConfiguration(),
        'CISoftLightBlendMode': () => CISoftLightBlendModeConfiguration(),
        'CISourceAtopCompositing': () => CISourceAtopCompositingConfiguration(),
        'CISourceInCompositing': () => CISourceInCompositingConfiguration(),
        'CISourceOutCompositing': () => CISourceOutCompositingConfiguration(),
        'CISourceOverCompositing': () => CISourceOverCompositingConfiguration(),
        'CISubtractBlendMode': () => CISubtractBlendModeConfiguration(),
        'CIBarcodeGenerator': () => CIBarcodeGeneratorConfiguration(),
        'CIRandomGenerator': () => CIRandomGeneratorConfiguration(),
        'CIBlendWithAlphaMask': () => CIBlendWithAlphaMaskConfiguration(),
        'CIBlendWithBlueMask': () => CIBlendWithBlueMaskConfiguration(),
        'CIBlendWithMask': () => CIBlendWithMaskConfiguration(),
        'CIBlendWithRedMask': () => CIBlendWithRedMaskConfiguration(),
        'CIComicEffect': () => CIComicEffectConfiguration(),
        'CIGaborGradients': () => CIGaborGradientsConfiguration(),
        'CISaliencyMapFilter': () => CISaliencyMapFilterConfiguration(),
        'CISampleNearest': () => CISampleNearestConfiguration(),
      }
    : {};
