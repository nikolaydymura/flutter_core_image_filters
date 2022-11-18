library flutter_core_image_filters;

import 'dart:async';
import 'dart:io' show File, Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';

import 'core_image_filters_platform_interface.dart';

part 'src/ci_image_preview.dart';
part 'src/ci_video_preview.dart';
part 'src/configurations/ci_addition_compositing.dart';
part 'src/configurations/ci_color_absolute_difference.dart';
part 'src/configurations/ci_color_cube.dart';
part 'src/configurations/ci_color_map.dart';
part 'src/configurations/ci_filter_configuration.dart';
part 'src/configurations/ci_monochrome.dart';
part 'src/configurations/ci_no_parameters_configurations.dart';
part 'src/parameters/ci_color_parameter.dart';
part 'src/parameters/ci_image_parameter.dart';
part 'src/parameters/ns_data_parameter.dart';
part 'src/parameters/ns_number_parameter.dart';
part 'src/parameters/slider_ns_number_parameter.dart';

Map<String, CIFilterConfiguration Function()> availableFilters =
    kDebugMode || Platform.isIOS
        ? {
            'Addition': () => CIAdditionCompositingConfiguration(),
            'Color Monochrome': () => CIMonochromeConfiguration(),
            'Color Cube': () => CIColorCubeConfiguration(),
            'Color Absolute Difference': () =>
                CIColorAbsoluteDifferenceConfiguration(),
            'Color Invert': () => CIColorInvertConfiguration(),
            'Color Map': () => CIColorMapConfiguration(),
            'Color Threshold Otsu': () => CIColorThresholdOtsuConfiguration(),
            'Depth To Disparity': () => CIDepthToDisparityConfiguration(),
            'Disparity To Depth': () => CIDisparityToDepthConfiguration(),
            'Linear To SRGB Tone Curve': () =>
                CILinearToSRGBToneCurveConfiguration(),
            'Mask to Alpha': () => CIMaskToAlphaConfiguration(),
            'Maximum Component': () => CIMaximumComponentConfiguration(),
            'Minimum Component': () => CIMinimumComponentConfiguration(),
            'Median': () => CIMedianFilterConfiguration(),
            'Photo Effect Chrome': () => CIPhotoEffectChromeConfiguration(),
            'Photo Effect Fade': () => CIPhotoEffectFadeConfiguration(),
            'Photo Effect Instant': () => CIPhotoEffectInstantConfiguration(),
            'Photo Effect Mono': () => CIPhotoEffectMonoConfiguration(),
            'Photo Effect Noir': () => CIPhotoEffectNoirConfiguration(),
            'Photo Effect Process': () => CIPhotoEffectProcessConfiguration(),
            'Photo Effect Tonal': () => CIPhotoEffectTonalConfiguration(),
            'Photo Effect Transfer': () => CIPhotoEffectTransferConfiguration(),
            'SRGB Tone Curve To Linear': () =>
                CISRGBToneCurveToLinearConfiguration(),
            'Thermal': () => CIThermalConfiguration(),
            'XRay': () => CIXRayConfiguration(),
          }
        : {};
