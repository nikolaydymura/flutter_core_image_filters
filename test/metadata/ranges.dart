const Map<String, Map<String, Map<String, double>>> kInputRanges = {
  'CIAccordionFoldTransition': {
    'inputBottomHeight': {'min': 0.0},
    'inputNumberOfFolds': {'min': 1.0, 'max': 50.0},
    'inputFoldShadowAmount': {'min': 0.0, 'max': 1.0},
    'inputTime': {'min': 0.0, 'max': 1.0}
  },
  'CIAdditionCompositing': {},
  'CIAffineClamp': {},
  'CIAffineTile': {},
  'CIAffineTransform': {},
  'CIAreaAverage': {},
  'CIAreaHistogram': {
    'inputScale': {'min': 0.0, 'max': 1.0},
    'inputCount': {'min': 1.0, 'max': 2048.0}
  },
  'CIAreaLogarithmicHistogram': {
    'inputScale': {'min': 0.0, 'max': 1.0},
    'inputCount': {'min': 1.0, 'max': 2048.0},
    'inputMinimumStop': {'min': -12.0, 'max': -4.0},
    'inputMaximumStop': {'min': 0.0, 'max': 8.0}
  },
  'CIAreaMaximum': {},
  'CIAreaMaximumAlpha': {},
  'CIAreaMinimum': {},
  'CIAreaMinimumAlpha': {},
  'CIAreaMinMax': {},
  'CIAreaMinMaxRed': {},
  'CIAttributedTextImageGenerator': {
    'inputScaleFactor': {'min': 0.0, 'max': 4.0},
    'inputPadding': {'min': 0.0, 'max': 200.0}
  },
  'CIAztecCodeGenerator': {
    'inputCorrectionLevel': {'min': 5.0, 'max': 95.0},
    'inputLayers': {'min': 1.0, 'max': 32.0},
    'inputCompactStyle': {'min': 0.0, 'max': 1.0}
  },
  'CIBarcodeGenerator': {},
  'CIBarsSwipeTransition': {
    'inputAngle': {'min': 0.0, 'max': 6.283185307179586},
    'inputWidth': {'min': 2.0, 'max': 300.0},
    'inputBarOffset': {'min': 1.0, 'max': 100.0},
    'inputTime': {'min': 0.0, 'max': 1.0}
  },
  'CIBicubicScaleTransform': {
    'inputScale': {'min': 0.0, 'max': 100.0},
    'inputAspectRatio': {'min': 0.0, 'max': 2.0},
    'inputB': {'min': 0.0, 'max': 1.0},
    'inputC': {'min': 0.0, 'max': 1.0}
  },
  'CIBlendWithAlphaMask': {},
  'CIBlendWithBlueMask': {},
  'CIBlendWithMask': {},
  'CIBlendWithRedMask': {},
  'CIBloom': {
    'inputRadius': {'min': 0.0, 'max': 100.0},
    'inputIntensity': {'min': 0.0, 'max': 1.0}
  },
  'CIBokehBlur': {
    'inputRadius': {'min': 0.0, 'max': 500.0},
    'inputRingAmount': {'min': 0.0, 'max': 1.0},
    'inputRingSize': {'min': 0.0, 'max': 0.2},
    'inputSoftness': {'min': 0.0, 'max': 10.0}
  },
  'CIBoxBlur': {
    'inputRadius': {'min': 1.0, 'max': 100.0}
  },
  'CIBumpDistortion': {
    'inputRadius': {'min': 0.0, 'max': 600.0},
    'inputScale': {'min': -1.0, 'max': 1.0}
  },
  'CIBumpDistortionLinear': {
    'inputRadius': {'min': 0.0, 'max': 600.0},
    'inputAngle': {'min': 0.0, 'max': 6.283185307179586},
    'inputScale': {'min': -1.0, 'max': 1.0}
  },
  'CICameraCalibrationLensCorrection': {},
  'CICheckerboardGenerator': {
    'inputWidth': {'min': 0.0, 'max': 800.0},
    'inputSharpness': {'min': 0.0, 'max': 1.0}
  },
  'CICircleSplashDistortion': {
    'inputRadius': {'min': 0.0, 'max': 1000.0}
  },
  'CICircularScreen': {
    'inputWidth': {'min': 1.0, 'max': 50.0},
    'inputSharpness': {'min': 0.0, 'max': 1.0}
  },
  'CICircularWrap': {
    'inputRadius': {'min': 0.0, 'max': 600.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIClamp': {},
  'CICMYKHalftone': {
    'inputWidth': {'min': -2.0, 'max': 100.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputSharpness': {'min': 0.0, 'max': 1.0},
    'inputGCR': {'min': 0.0, 'max': 1.0},
    'inputUCR': {'min': 0.0, 'max': 1.0}
  },
  'CICode128BarcodeGenerator': {
    'inputQuietSpace': {'min': 0.0, 'max': 100.0},
    'inputBarcodeHeight': {'min': 1.0, 'max': 500.0}
  },
  'CIColorAbsoluteDifference': {},
  'CIColorBlendMode': {},
  'CIColorBurnBlendMode': {},
  'CIColorClamp': {},
  'CIColorControls': {
    'inputSaturation': {'min': 0.0, 'max': 2.0},
    'inputBrightness': {'min': -1.0, 'max': 1.0},
    'inputContrast': {'min': 0.0, 'max': 4.0}
  },
  'CIColorCrossPolynomial': {},
  'CIColorCube': {
    'inputCubeDimension': {'min': 2.0, 'max': 64.0},
    'inputExtrapolate': {'min': 0.0, 'max': 1.0}
  },
  'CIColorCubesMixedWithMask': {
    'inputCubeDimension': {'min': 2.0, 'max': 64.0},
    'inputExtrapolate': {'min': 0.0, 'max': 1.0}
  },
  'CIColorCubeWithColorSpace': {
    'inputCubeDimension': {'min': 2.0, 'max': 64.0}
  },
  'CIColorCurves': {},
  'CIColorDodgeBlendMode': {},
  'CIColorInvert': {},
  'CIColorMap': {},
  'CIColorMatrix': {},
  'CIColorMonochrome': {
    'inputIntensity': {'min': 0.0, 'max': 1.0}
  },
  'CIColorPolynomial': {},
  'CIColorPosterize': {
    'inputLevels': {'min': 1.0, 'max': 30.0}
  },
  'CIColorThreshold': {
    'inputThreshold': {'min': 0.0, 'max': 1.0}
  },
  'CIColorThresholdOtsu': {},
  'CIColumnAverage': {},
  'CIComicEffect': {},
  'CIConstantColorGenerator': {},
  'CIConvertLabToRGB': {
    'inputNormalize': {'min': 0.0, 'max': 1.0}
  },
  'CIConvertRGBtoLab': {
    'inputNormalize': {'min': 0.0, 'max': 1.0}
  },
  'CIConvolution3X3': {},
  'CIConvolution5X5': {},
  'CIConvolution7X7': {},
  'CIConvolution9Horizontal': {},
  'CIConvolution9Vertical': {},
  'CIConvolutionRGB3X3': {},
  'CIConvolutionRGB5X5': {},
  'CIConvolutionRGB7X7': {},
  'CIConvolutionRGB9Horizontal': {},
  'CIConvolutionRGB9Vertical': {},
  'CICopyMachineTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputAngle': {'min': 0.0, 'max': 6.283185307179586},
    'inputWidth': {'min': 0.1, 'max': 500.0},
    'inputOpacity': {'min': 0.0, 'max': 3.0}
  },
  'CICoreMLModelFilter': {
    'inputHeadIndex': {'min': 0.0, 'max': 10.0},
    'inputSoftmaxNormalization': {'min': 0.0, 'max': 1.0}
  },
  'CICrop': {},
  'CICrystallize': {
    'inputRadius': {'min': 1.0, 'max': 100.0}
  },
  'CIDarkenBlendMode': {},
  'CIDepthBlurEffect': {
    'inputAperture': {'min': 0.0, 'max': 22.0},
    'inputLumaNoiseScale': {'min': 0.0, 'max': 0.1},
    'inputScaleFactor': {'min': 0.0, 'max': 1.0}
  },
  'CIDepthOfField': {
    'inputSaturation': {'min': 0.0, 'max': 10.0},
    'inputUnsharpMaskRadius': {'min': 0.0, 'max': 10.0},
    'inputUnsharpMaskIntensity': {'min': 0.0, 'max': 10.0},
    'inputRadius': {'min': 0.0, 'max': 30.0}
  },
  'CIDepthToDisparity': {},
  'CIDifferenceBlendMode': {},
  'CIDiscBlur': {
    'inputRadius': {'min': 0.0, 'max': 100.0}
  },
  'CIDisintegrateWithMaskTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputShadowRadius': {'min': 0.0, 'max': 50.0},
    'inputShadowDensity': {'min': 0.0, 'max': 1.0}
  },
  'CIDisparityToDepth': {},
  'CIDisplacementDistortion': {
    'inputScale': {'min': 0.0, 'max': 200.0}
  },
  'CIDissolveTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0}
  },
  'CIDither': {
    'inputIntensity': {'min': 0.0, 'max': 5.0}
  },
  'CIDivideBlendMode': {},
  'CIDocumentEnhancer': {
    'inputAmount': {'min': 0.0, 'max': 10.0}
  },
  'CIDotScreen': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 1.0, 'max': 50.0},
    'inputSharpness': {'min': 0.0, 'max': 1.0}
  },
  'CIDroste': {
    'inputStrands': {'min': -10.0, 'max': 10.0},
    'inputPeriodicity': {'min': 1.0, 'max': 5.0},
    'inputRotation': {'min': 0.0, 'max': 6.283185307179586},
    'inputZoom': {'min': 0.01, 'max': 5.0}
  },
  'CIEdgePreserveUpsampleFilter': {
    'inputSpatialSigma': {'min': 0.0, 'max': 5.0},
    'inputLumaSigma': {'min': 0.0, 'max': 1.0}
  },
  'CIEdges': {
    'inputIntensity': {'min': 0.0, 'max': 10.0}
  },
  'CIEdgeWork': {
    'inputRadius': {'min': 0.0, 'max': 20.0}
  },
  'CIEightfoldReflectedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CIExclusionBlendMode': {},
  'CIExposureAdjust': {
    'inputEV': {'min': -10.0, 'max': 10.0}
  },
  'CIFalseColor': {},
  'CIFlashTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputMaxStriationRadius': {'min': 0.0, 'max': 10.0},
    'inputStriationStrength': {'min': 0.0, 'max': 3.0},
    'inputStriationContrast': {'min': 0.0, 'max': 5.0},
    'inputFadeThreshold': {'min': 0.0, 'max': 1.0}
  },
  'CIFourfoldReflectedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0},
    'inputAcuteAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIFourfoldRotatedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CIFourfoldTranslatedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0},
    'inputAcuteAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIGaborGradients': {},
  'CIGammaAdjust': {
    'inputPower': {'min': 0.25, 'max': 4.0}
  },
  'CIGaussianBlur': {
    'inputRadius': {'min': 0.0, 'max': 100.0}
  },
  'CIGaussianGradient': {
    'inputRadius': {'min': 0.0, 'max': 800.0}
  },
  'CIGlassDistortion': {
    'inputScale': {'min': 0.0, 'max': 500.0}
  },
  'CIGlassLozenge': {
    'inputRadius': {'min': 0.0, 'max': 1000.0},
    'inputRefraction': {'min': 0.0, 'max': 5.0}
  },
  'CIGlideReflectedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CIGloom': {
    'inputRadius': {'min': 0.0, 'max': 100.0},
    'inputIntensity': {'min': 0.0, 'max': 1.0}
  },
  'CIGuidedFilter': {
    'inputRadius': {'min': 1.0, 'max': 10.0},
    'inputEpsilon': {'min': 1e-09, 'max': 0.1}
  },
  'CIHardLightBlendMode': {},
  'CIHatchedScreen': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 1.0, 'max': 50.0},
    'inputSharpness': {'min': 0.0, 'max': 1.0}
  },
  'CIHeightFieldFromMask': {
    'inputRadius': {'min': 0.0, 'max': 300.0}
  },
  'CIHexagonalPixellate': {
    'inputScale': {'min': 1.0, 'max': 100.0}
  },
  'CIHighlightShadowAdjust': {
    'inputRadius': {'min': 0.0, 'max': 10.0},
    'inputShadowAmount': {'min': -1.0, 'max': 1.0},
    'inputHighlightAmount': {'min': 0.0, 'max': 1.0}
  },
  'CIHistogramDisplayFilter': {
    'inputHeight': {'min': 1.0, 'max': 200.0},
    'inputHighLimit': {'min': 0.0, 'max': 1.0},
    'inputLowLimit': {'min': 0.0, 'max': 1.0}
  },
  'CIHoleDistortion': {
    'inputRadius': {'min': 0.01, 'max': 1000.0}
  },
  'CIHueAdjust': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIHueBlendMode': {},
  'CIHueSaturationValueGradient': {
    'inputValue': {'min': 0.0, 'max': 1.0},
    'inputRadius': {'min': 0.0, 'max': 800.0},
    'inputSoftness': {'min': 0.0, 'max': 1.0},
    'inputDither': {'min': 0.0, 'max': 3.0}
  },
  'CIKaleidoscope': {
    'inputCount': {'min': 1.0, 'max': 64.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIKeystoneCorrectionCombined': {},
  'CIKeystoneCorrectionHorizontal': {},
  'CIKeystoneCorrectionVertical': {},
  'CIKMeans': {
    'inputCount': {'min': 0.0, 'max': 128.0},
    'inputPasses': {'min': 0.0, 'max': 20.0},
    'inputPerceptual': {'min': 0.0, 'max': 1.0}
  },
  'CILabDeltaE': {},
  'CILanczosScaleTransform': {
    'inputScale': {'min': 0.0, 'max': 1.5},
    'inputAspectRatio': {'min': 0.0, 'max': 2.0}
  },
  'CILenticularHaloGenerator': {
    'inputHaloRadius': {'min': 0.0, 'max': 1000.0},
    'inputHaloWidth': {'min': 0.0, 'max': 300.0},
    'inputHaloOverlap': {'min': 0.0, 'max': 1.0},
    'inputStriationStrength': {'min': 0.0, 'max': 3.0},
    'inputStriationContrast': {'min': 0.0, 'max': 5.0},
    'inputTime': {'min': 0.0, 'max': 1.0}
  },
  'CILightenBlendMode': {},
  'CILightTunnel': {
    'inputRotation': {'min': 0.0, 'max': 1.5707963267948966},
    'inputRadius': {'min': 1.0, 'max': 500.0}
  },
  'CILinearBurnBlendMode': {},
  'CILinearDodgeBlendMode': {},
  'CILinearGradient': {},
  'CILinearLightBlendMode': {},
  'CILinearToSRGBToneCurve': {},
  'CILineOverlay': {
    'inputNRNoiseLevel': {'min': 0.0, 'max': 0.1},
    'inputNRSharpness': {'min': 0.0, 'max': 2.0},
    'inputEdgeIntensity': {'min': 0.0, 'max': 200.0},
    'inputThreshold': {'min': 0.0, 'max': 1.0},
    'inputContrast': {'min': 0.25, 'max': 200.0}
  },
  'CILineScreen': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 1.0, 'max': 50.0},
    'inputSharpness': {'min': 0.0, 'max': 1.0}
  },
  'CILuminosityBlendMode': {},
  'CIMaskedVariableBlur': {
    'inputRadius': {'min': 0.0, 'max': 10.0}
  },
  'CIMaskToAlpha': {},
  'CIMaximumComponent': {},
  'CIMaximumCompositing': {},
  'CIMedianFilter': {},
  'CIMeshGenerator': {
    'inputWidth': {'min': 0.0, 'max': 10.0}
  },
  'CIMinimumComponent': {},
  'CIMinimumCompositing': {},
  'CIMix': {
    'inputAmount': {'min': 0.0, 'max': 1.0}
  },
  'CIModTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputAngle': {'min': -6.283185307179586, 'max': 6.283185307179586},
    'inputRadius': {'min': 1.0, 'max': 200.0},
    'inputCompression': {'min': 1.0, 'max': 800.0}
  },
  'CIMorphologyGradient': {
    'inputRadius': {'min': 0.0, 'max': 50.0}
  },
  'CIMorphologyMaximum': {
    'inputRadius': {'min': 0.0, 'max': 50.0}
  },
  'CIMorphologyMinimum': {
    'inputRadius': {'min': 0.0, 'max': 50.0}
  },
  'CIMorphologyRectangleMaximum': {
    'inputWidth': {'min': 1.0, 'max': 49.0},
    'inputHeight': {'min': 1.0, 'max': 49.0}
  },
  'CIMorphologyRectangleMinimum': {
    'inputWidth': {'min': 1.0, 'max': 49.0},
    'inputHeight': {'min': 1.0, 'max': 49.0}
  },
  'CIMotionBlur': {
    'inputRadius': {'min': 0.0, 'max': 100.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIMultiplyBlendMode': {},
  'CIMultiplyCompositing': {},
  'CINinePartStretched': {},
  'CINinePartTiled': {
    'inputFlipYTiles': {'min': 0.0, 'max': 1.0}
  },
  'CINoiseReduction': {
    'inputNoiseLevel': {'min': 0.0, 'max': 0.1},
    'inputSharpness': {'min': 0.0, 'max': 2.0}
  },
  'CIOpTile': {
    'inputScale': {'min': 0.0, 'max': 10.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 1000.0}
  },
  'CIOverlayBlendMode': {},
  'CIPageCurlTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputRadius': {'min': 0.01, 'max': 400.0}
  },
  'CIPageCurlWithShadowTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputRadius': {'min': 0.01, 'max': 400.0},
    'inputShadowSize': {'min': 0.0, 'max': 1.0},
    'inputShadowAmount': {'min': 0.0, 'max': 1.0}
  },
  'CIPaletteCentroid': {
    'inputPerceptual': {'min': 0.0, 'max': 1.0}
  },
  'CIPalettize': {
    'inputPerceptual': {'min': 0.0, 'max': 1.0}
  },
  'CIParallelogramTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputAcuteAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CIPDF417BarcodeGenerator': {
    'inputMinWidth': {'min': 56.0, 'max': 583.0},
    'inputMaxWidth': {'min': 56.0, 'max': 583.0},
    'inputMinHeight': {'min': 13.0, 'max': 283.0},
    'inputMaxHeight': {'min': 13.0, 'max': 283.0},
    'inputDataColumns': {'min': 1.0, 'max': 30.0},
    'inputRows': {'min': 3.0, 'max': 90.0},
    'inputPreferredAspectRatio': {'min': 0.0, 'max': 9.223372036854776e+18},
    'inputCompactionMode': {'min': 0.0, 'max': 3.0},
    'inputCompactStyle': {'min': 0.0, 'max': 1.0},
    'inputCorrectionLevel': {'min': 0.0, 'max': 8.0},
    'inputAlwaysSpecifyCompaction': {'min': 0.0, 'max': 1.0}
  },
  'CIPersonSegmentation': {},
  'CIPerspectiveCorrection': {},
  'CIPerspectiveRotate': {},
  'CIPerspectiveTile': {},
  'CIPerspectiveTransform': {},
  'CIPerspectiveTransformWithExtent': {},
  'CIPhotoEffectChrome': {},
  'CIPhotoEffectFade': {},
  'CIPhotoEffectInstant': {},
  'CIPhotoEffectMono': {},
  'CIPhotoEffectNoir': {},
  'CIPhotoEffectProcess': {},
  'CIPhotoEffectTonal': {},
  'CIPhotoEffectTransfer': {},
  'CIPinchDistortion': {
    'inputRadius': {'min': 0.0, 'max': 1000.0},
    'inputScale': {'min': 0.0, 'max': 2.0}
  },
  'CIPinLightBlendMode': {},
  'CIPixellate': {
    'inputScale': {'min': 1.0, 'max': 100.0}
  },
  'CIPointillize': {
    'inputRadius': {'min': 1.0, 'max': 100.0}
  },
  'CIQRCodeGenerator': {},
  'CIRadialGradient': {
    'inputRadius0': {'min': 0.0, 'max': 800.0},
    'inputRadius1': {'min': 0.0, 'max': 800.0}
  },
  'CIRandomGenerator': {},
  'CIRippleTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputWidth': {'min': 1.0, 'max': 300.0},
    'inputScale': {'min': -50.0, 'max': 50.0}
  },
  'CIRoundedRectangleGenerator': {
    'inputRadius': {'min': 0.0, 'max': 100.0}
  },
  'CIRowAverage': {},
  'CISaliencyMapFilter': {},
  'CISampleNearest': {},
  'CISaturationBlendMode': {},
  'CIScreenBlendMode': {},
  'CISepiaTone': {
    'inputIntensity': {'min': 0.0, 'max': 1.0}
  },
  'CIShadedMaterial': {
    'inputScale': {'min': 0.0, 'max': 200.0}
  },
  'CISharpenLuminance': {
    'inputSharpness': {'min': 0.0, 'max': 2.0},
    'inputRadius': {'min': 0.0, 'max': 20.0}
  },
  'CISixfoldReflectedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CISixfoldRotatedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CISmoothLinearGradient': {},
  'CISoftLightBlendMode': {},
  'CISourceAtopCompositing': {},
  'CISourceInCompositing': {},
  'CISourceOutCompositing': {},
  'CISourceOverCompositing': {},
  'CISpotColor': {
    'inputCloseness1': {'min': 0.0, 'max': 0.5},
    'inputContrast1': {'min': 0.0, 'max': 1.0},
    'inputCloseness2': {'min': 0.0, 'max': 0.5},
    'inputContrast2': {'min': 0.0, 'max': 1.0},
    'inputCloseness3': {'min': 0.0, 'max': 0.5},
    'inputContrast3': {'min': 0.0, 'max': 1.0}
  },
  'CISpotLight': {
    'inputBrightness': {'min': 0.0, 'max': 10.0},
    'inputConcentration': {'min': 0.001, 'max': 1.5}
  },
  'CISRGBToneCurveToLinear': {},
  'CIStarShineGenerator': {
    'inputRadius': {'min': 0.0, 'max': 300.0},
    'inputCrossScale': {'min': 0.0, 'max': 100.0},
    'inputCrossAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputCrossOpacity': {'min': -8.0, 'max': 0.0},
    'inputCrossWidth': {'min': 0.0, 'max': 10.0},
    'inputEpsilon': {'min': -8.0, 'max': 0.0}
  },
  'CIStraightenFilter': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793}
  },
  'CIStretchCrop': {
    'inputCropAmount': {'min': 0.0, 'max': 1.0},
    'inputCenterStretchAmount': {'min': 0.0, 'max': 1.0}
  },
  'CIStripesGenerator': {
    'inputWidth': {'min': 0.0, 'max': 800.0},
    'inputSharpness': {'min': 0.0, 'max': 1.0}
  },
  'CISubtractBlendMode': {},
  'CISunbeamsGenerator': {
    'inputSunRadius': {'min': 0.0, 'max': 800.0},
    'inputMaxStriationRadius': {'min': 0.0, 'max': 10.0},
    'inputStriationStrength': {'min': 0.0, 'max': 3.0},
    'inputStriationContrast': {'min': 0.0, 'max': 5.0},
    'inputTime': {'min': 0.0, 'max': 1.0}
  },
  'CISwipeTransition': {
    'inputTime': {'min': 0.0, 'max': 1.0},
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.1, 'max': 800.0},
    'inputOpacity': {'min': 0.0, 'max': 1.0}
  },
  'CITemperatureAndTint': {},
  'CITextImageGenerator': {
    'inputFontSize': {'min': 0.0, 'max': 128.0},
    'inputScaleFactor': {'min': 0.0, 'max': 4.0},
    'inputPadding': {'min': 0.0, 'max': 200.0}
  },
  'CIThermal': {},
  'CIToneCurve': {},
  'CITorusLensDistortion': {
    'inputRadius': {'min': 0.0, 'max': 500.0},
    'inputWidth': {'min': 0.0, 'max': 200.0},
    'inputRefraction': {'min': 0.0, 'max': 5.0}
  },
  'CITriangleKaleidoscope': {
    'inputSize': {'min': 0.0, 'max': 1000.0},
    'inputRotation': {'min': 0.0, 'max': 6.283185307179586},
    'inputDecay': {'min': 0.0, 'max': 1.0}
  },
  'CITriangleTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CITwelvefoldReflectedTile': {
    'inputAngle': {'min': -3.141592653589793, 'max': 3.141592653589793},
    'inputWidth': {'min': 0.0, 'max': 200.0}
  },
  'CITwirlDistortion': {
    'inputRadius': {'min': 0.0, 'max': 500.0},
    'inputAngle': {'min': -12.566370614359172, 'max': 12.566370614359172}
  },
  'CIUnsharpMask': {
    'inputRadius': {'min': 0.0, 'max': 100.0},
    'inputIntensity': {'min': 0.0, 'max': 1.0}
  },
  'CIVibrance': {
    'inputAmount': {'min': -1.0, 'max': 1.0}
  },
  'CIVignette': {
    'inputIntensity': {'min': -1.0, 'max': 1.0},
    'inputRadius': {'min': 0.0, 'max': 2.0}
  },
  'CIVignetteEffect': {
    'inputRadius': {'min': 0.0, 'max': 2000.0},
    'inputIntensity': {'min': -1.0, 'max': 1.0},
    'inputFalloff': {'min': 0.0, 'max': 1.0}
  },
  'CIVividLightBlendMode': {},
  'CIVortexDistortion': {
    'inputRadius': {'min': 0.0, 'max': 800.0},
    'inputAngle': {'min': -94.24777960769379, 'max': 94.24777960769379}
  },
  'CIWhitePointAdjust': {},
  'CIXRay': {},
  'CIZoomBlur': {
    'inputAmount': {'min': -200.0, 'max': 200.0}
  }
};
