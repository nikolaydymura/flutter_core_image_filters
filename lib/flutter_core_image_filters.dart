import 'src/configurations/ci_color_cube.dart';

import 'dart:io' show Platform;

import 'src/configurations/ci_color_invert.dart';
import 'src/configurations/ci_color_map.dart';
import 'src/configurations/ci_depth_to_disparity.dart';
import 'src/configurations/ci_linear_to_srgb_tone_curve.dart';
import 'src/configurations/ci_mask_to_alpha.dart';
import 'src/configurations/ci_maximum_component.dart';
import 'src/configurations/ci_medianFilter.dart';
import 'src/configurations/ci_minimum_component.dart';
import 'src/configurations/ci_monochrome.dart';
export 'src/configurations/ci_filter_configuration.dart';
import 'src/configurations/ci_addition_compositing.dart';
import 'src/configurations/ci_color_absolute_difference.dart';
import 'src/configurations/ci_color_threshold_otsu.dart';
import 'src/configurations/ci_disparity_to_depth.dart';
import 'src/configurations/ci_filter_configuration.dart';
import 'src/configurations/ci_photo_eEffect_chrome.dart';
import 'src/configurations/ci_photo_effect_fade.dart';
import 'src/configurations/ci_photo_effect_instant.dart';
import 'src/configurations/ci_photo_effect_mono.dart';
import 'src/configurations/ci_photo_effect_noir.dart';
import 'src/configurations/ci_photo_effect_process.dart';
import 'src/configurations/ci_photo_effect_tonal.dart';
import 'src/configurations/ci_photo_effect_transfer.dart';
import 'src/configurations/ci_srgb_tone_curve_to_linear.dart';
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
      }
    : {};
