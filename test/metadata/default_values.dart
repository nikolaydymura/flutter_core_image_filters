import 'package:flutter/material.dart';

const Map<String, Map<String, dynamic>> kDefaultValues = {
  'CIAccordionFoldTransition': {
    'inputBottomHeight': 0,
    'inputNumberOfFolds': 3,
    'inputFoldShadowAmount': 0.1,
    'inputTime': 0
  },
  'CIAdditionCompositing': {},
  'CIAffineClamp': {
    'inputTransform': [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]
  },
  'CIAffineTile': {
    'inputTransform': [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]
  },
  'CIAffineTransform': {
    'inputTransform': [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]
  },
  'CIAreaAverage': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAreaHistogram': {
    'inputExtent': [0, 0, 640, 80],
    'inputScale': 1,
    'inputCount': 64
  },
  'CIAreaLogarithmicHistogram': {
    'inputExtent': [0, 0, 640, 80],
    'inputScale': 1,
    'inputCount': 64,
    'inputMinimumStop': -10,
    'inputMaximumStop': 4
  },
  'CIAreaMaximum': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAreaMaximumAlpha': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAreaMinimum': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAreaMinimumAlpha': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAreaMinMax': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAreaMinMaxRed': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIAttributedTextImageGenerator': {'inputScaleFactor': 1, 'inputPadding': 0},
  'CIAztecCodeGenerator': {'inputCorrectionLevel': 23},
  'CIBarcodeGenerator': {},
  'CIBarsSwipeTransition': {
    'inputAngle': 3.141592653589793,
    'inputWidth': 30,
    'inputBarOffset': 10,
    'inputTime': 0
  },
  'CIBicubicScaleTransform': {
    'inputScale': 1,
    'inputAspectRatio': 1,
    'inputB': 0,
    'inputC': 0.75
  },
  'CIBlendWithAlphaMask': {},
  'CIBlendWithBlueMask': {},
  'CIBlendWithMask': {},
  'CIBlendWithRedMask': {},
  'CIBloom': {'inputRadius': 10, 'inputIntensity': 0.5},
  'CIBokehBlur': {
    'inputRadius': 20,
    'inputRingAmount': 0,
    'inputRingSize': 0.1,
    'inputSoftness': 1
  },
  'CIBoxBlur': {'inputRadius': 10},
  'CIBumpDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 300,
    'inputScale': 0.5
  },
  'CIBumpDistortionLinear': {
    'inputCenter': [150, 150],
    'inputRadius': 300,
    'inputAngle': 0,
    'inputScale': 0.5
  },
  'CICameraCalibrationLensCorrection': {'inputUseInverseLookUpTable': 0},
  'CICheckerboardGenerator': {
    'inputCenter': [150, 150],
    'inputColor0': Color.fromRGBO(255, 255, 255, 1.0),
    'inputColor1': Color.fromRGBO(0, 0, 0, 1.0),
    'inputWidth': 80,
    'inputSharpness': 1
  },
  'CICircleSplashDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 150
  },
  'CICircularScreen': {
    'inputCenter': [150, 150],
    'inputWidth': 6,
    'inputSharpness': 0.7
  },
  'CICircularWrap': {
    'inputCenter': [150, 150],
    'inputRadius': 150,
    'inputAngle': 0
  },
  'CIClamp': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CICMYKHalftone': {
    'inputCenter': [150, 150],
    'inputWidth': 6,
    'inputAngle': 0,
    'inputSharpness': 0.7,
    'inputGCR': 1,
    'inputUCR': 0.5
  },
  'CICode128BarcodeGenerator': {
    'inputQuietSpace': 10,
    'inputBarcodeHeight': 32
  },
  'CIColorAbsoluteDifference': {},
  'CIColorBlendMode': {},
  'CIColorBurnBlendMode': {},
  'CIColorClamp': {
    'inputMinComponents': [0, 0, 0, 0],
    'inputMaxComponents': [1, 1, 1, 1]
  },
  'CIColorControls': {
    'inputSaturation': 1,
    'inputBrightness': 0,
    'inputContrast': 1
  },
  'CIColorCrossPolynomial': {
    'inputRedCoefficients': [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    'inputGreenCoefficients': [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    'inputBlueCoefficients': [0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
  },
  'CIColorCube': {'inputCubeDimension': 2, 'inputExtrapolate': 0},
  'CIColorCubesMixedWithMask': {'inputCubeDimension': 2, 'inputExtrapolate': 0},
  'CIColorCubeWithColorSpace': {'inputCubeDimension': 2},
  'CIColorCurves': {
    'inputCurvesDomain': [0, 1]
  },
  'CIColorDodgeBlendMode': {},
  'CIColorInvert': {},
  'CIColorMap': {},
  'CIColorMatrix': {
    'inputRVector': [1, 0, 0, 0],
    'inputGVector': [0, 1, 0, 0],
    'inputBVector': [0, 0, 1, 0],
    'inputAVector': [0, 0, 0, 1],
    'inputBiasVector': [0, 0, 0, 0]
  },
  'CIColorMonochrome': {
    'inputColor': Color.fromRGBO(153, 114, 76, 1.0),
    'inputIntensity': 1
  },
  'CIColorPolynomial': {
    'inputRedCoefficients': [0, 1, 0, 0],
    'inputGreenCoefficients': [0, 1, 0, 0],
    'inputBlueCoefficients': [0, 1, 0, 0],
    'inputAlphaCoefficients': [0, 1, 0, 0]
  },
  'CIColorPosterize': {'inputLevels': 6},
  'CIColorThreshold': {'inputThreshold': 0.5},
  'CIColorThresholdOtsu': {},
  'CIColumnAverage': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CIComicEffect': {},
  'CIConstantColorGenerator': {'inputColor': Color.fromRGBO(255, 0, 0, 1.0)},
  'CIConvertLabToRGB': {'inputNormalize': 0},
  'CIConvertRGBtoLab': {'inputNormalize': 0},
  'CIConvolution3X3': {
    'inputWeights': [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'inputBias': 0
  },
  'CIConvolution5X5': {
    'inputWeights': [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ],
    'inputBias': 0
  },
  'CIConvolution7X7': {
    'inputWeights': [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ],
    'inputBias': 0
  },
  'CIConvolution9Horizontal': {
    'inputWeights': [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'inputBias': 0
  },
  'CIConvolution9Vertical': {
    'inputWeights': [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'inputBias': 0
  },
  'CIConvolutionRGB3X3': {
    'inputWeights': [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'inputBias': 0
  },
  'CIConvolutionRGB5X5': {
    'inputWeights': [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ],
    'inputBias': 0
  },
  'CIConvolutionRGB7X7': {
    'inputWeights': [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ],
    'inputBias': 0
  },
  'CIConvolutionRGB9Horizontal': {
    'inputWeights': [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'inputBias': 0
  },
  'CIConvolutionRGB9Vertical': {
    'inputWeights': [0, 0, 0, 0, 1, 0, 0, 0, 0],
    'inputBias': 0
  },
  'CICopyMachineTransition': {
    'inputExtent': [0, 0, 300, 300],
    'inputColor': Color.fromRGBO(153, 255, 204, 1.0),
    'inputTime': 0,
    'inputAngle': 0,
    'inputWidth': 200,
    'inputOpacity': 1.3
  },
  'CICoreMLModelFilter': {'inputHeadIndex': 0, 'inputSoftmaxNormalization': 0},
  'CICrop': {
    'inputRectangle': [-8.98847e+307, -8.98847e+307, 1.79769e+308, 1.79769e+308]
  },
  'CICrystallize': {
    'inputRadius': 20,
    'inputCenter': [150, 150]
  },
  'CIDarkenBlendMode': {},
  'CIDepthBlurEffect': {
    'inputAperture': 0,
    'inputLeftEyePositions': [-1, -1],
    'inputRightEyePositions': [-1, -1],
    'inputChinPositions': [-1, -1],
    'inputNosePositions': [-1, -1],
    'inputLumaNoiseScale': 0,
    'inputScaleFactor': 1
  },
  'CIDepthOfField': {
    'inputPoint0': [0, 300],
    'inputPoint1': [300, 300],
    'inputSaturation': 1.5,
    'inputUnsharpMaskRadius': 2.5,
    'inputUnsharpMaskIntensity': 0.5,
    'inputRadius': 6
  },
  'CIDepthToDisparity': {},
  'CIDifferenceBlendMode': {},
  'CIDiscBlur': {'inputRadius': 8},
  'CIDisintegrateWithMaskTransition': {
    'inputTime': 0,
    'inputShadowRadius': 8,
    'inputShadowDensity': 0.65,
    'inputShadowOffset': [0, -10]
  },
  'CIDisparityToDepth': {},
  'CIDisplacementDistortion': {'inputScale': 50},
  'CIDissolveTransition': {'inputTime': 0},
  'CIDither': {'inputIntensity': 0.1},
  'CIDivideBlendMode': {},
  'CIDocumentEnhancer': {'inputAmount': 1},
  'CIDotScreen': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 6,
    'inputSharpness': 0.7
  },
  'CIDroste': {
    'inputInsetPoint0': [200, 200],
    'inputInsetPoint1': [400, 400],
    'inputStrands': 1,
    'inputPeriodicity': 1,
    'inputRotation': 0,
    'inputZoom': 1
  },
  'CIEdgePreserveUpsampleFilter': {
    'inputSpatialSigma': 3,
    'inputLumaSigma': 0.15
  },
  'CIEdges': {'inputIntensity': 1},
  'CIEdgeWork': {'inputRadius': 3},
  'CIEightfoldReflectedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CIExclusionBlendMode': {},
  'CIExposureAdjust': {'inputEV': 0},
  'CIFalseColor': {
    'inputColor0': Color.fromRGBO(76, 0, 0, 1.0),
    'inputColor1': Color.fromRGBO(255, 229, 204, 1.0)
  },
  'CIFlashTransition': {
    'inputCenter': [150, 150],
    'inputExtent': [0, 0, 300, 300],
    'inputColor': Color.fromRGBO(255, 204, 153, 1.0),
    'inputTime': 0,
    'inputMaxStriationRadius': 2.58,
    'inputStriationStrength': 0.5,
    'inputStriationContrast': 1.375,
    'inputFadeThreshold': 0.85
  },
  'CIFourfoldReflectedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100,
    'inputAcuteAngle': 1.570796326794897
  },
  'CIFourfoldRotatedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CIFourfoldTranslatedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100,
    'inputAcuteAngle': 1.570796326794897
  },
  'CIGaborGradients': {},
  'CIGammaAdjust': {'inputPower': 1},
  'CIGaussianBlur': {'inputRadius': 10},
  'CIGaussianGradient': {
    'inputCenter': [150, 150],
    'inputColor0': Color.fromRGBO(255, 255, 255, 1.0),
    'inputColor1': Color.fromRGBO(0, 0, 0, 0.0),
    'inputRadius': 300
  },
  'CIGlassDistortion': {
    'inputCenter': [150, 150],
    'inputScale': 200
  },
  'CIGlassLozenge': {
    'inputPoint0': [150, 150],
    'inputPoint1': [350, 150],
    'inputRadius': 100,
    'inputRefraction': 1.7
  },
  'CIGlideReflectedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CIGloom': {'inputRadius': 10, 'inputIntensity': 0.5},
  'CIGuidedFilter': {'inputRadius': 1, 'inputEpsilon': 0.0001},
  'CIHardLightBlendMode': {},
  'CIHatchedScreen': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 6,
    'inputSharpness': 0.7
  },
  'CIHeightFieldFromMask': {'inputRadius': 10},
  'CIHexagonalPixellate': {
    'inputCenter': [150, 150],
    'inputScale': 8
  },
  'CIHighlightShadowAdjust': {
    'inputRadius': 0,
    'inputShadowAmount': 0,
    'inputHighlightAmount': 1
  },
  'CIHistogramDisplayFilter': {
    'inputHeight': 100,
    'inputHighLimit': 1,
    'inputLowLimit': 0
  },
  'CIHoleDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 150
  },
  'CIHueAdjust': {'inputAngle': 0},
  'CIHueBlendMode': {},
  'CIHueSaturationValueGradient': {
    'inputValue': 1,
    'inputRadius': 300,
    'inputSoftness': 1,
    'inputDither': 1,
    'inputColorSpace': 'sRGB'
  },
  'CIKaleidoscope': {
    'inputCount': 6,
    'inputCenter': [150, 150],
    'inputAngle': 0
  },
  'CIKeystoneCorrectionCombined': {'inputFocalLength': 28},
  'CIKeystoneCorrectionHorizontal': {'inputFocalLength': 28},
  'CIKeystoneCorrectionVertical': {'inputFocalLength': 28},
  'CIKMeans': {
    'inputExtent': [0, 0, 640, 80],
    'inputCount': 8,
    'inputPasses': 5,
    'inputPerceptual': 0
  },
  'CILabDeltaE': {},
  'CILanczosScaleTransform': {'inputScale': 1, 'inputAspectRatio': 1},
  'CILenticularHaloGenerator': {
    'inputCenter': [150, 150],
    'inputColor': Color.fromRGBO(255, 229, 204, 1.0),
    'inputHaloRadius': 70,
    'inputHaloWidth': 87,
    'inputHaloOverlap': 0.77,
    'inputStriationStrength': 0.5,
    'inputStriationContrast': 1,
    'inputTime': 0
  },
  'CILightenBlendMode': {},
  'CILightTunnel': {
    'inputCenter': [150, 150],
    'inputRotation': 0,
    'inputRadius': 100
  },
  'CILinearBurnBlendMode': {},
  'CILinearDodgeBlendMode': {},
  'CILinearGradient': {
    'inputPoint0': [0, 0],
    'inputPoint1': [200, 200],
    'inputColor0': Color.fromRGBO(255, 255, 255, 1.0),
    'inputColor1': Color.fromRGBO(0, 0, 0, 1.0)
  },
  'CILinearLightBlendMode': {},
  'CILinearToSRGBToneCurve': {},
  'CILineOverlay': {
    'inputNRNoiseLevel': 0.07000000000000001,
    'inputNRSharpness': 0.71,
    'inputEdgeIntensity': 1,
    'inputThreshold': 0.1,
    'inputContrast': 50
  },
  'CILineScreen': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 6,
    'inputSharpness': 0.7
  },
  'CILuminosityBlendMode': {},
  'CIMaskedVariableBlur': {'inputRadius': 5},
  'CIMaskToAlpha': {},
  'CIMaximumComponent': {},
  'CIMaximumCompositing': {},
  'CIMedianFilter': {},
  'CIMeshGenerator': {
    'inputWidth': 1.5,
    'inputColor': Color.fromRGBO(255, 255, 255, 1.0)
  },
  'CIMinimumComponent': {},
  'CIMinimumCompositing': {},
  'CIMix': {'inputAmount': 1},
  'CIModTransition': {
    'inputCenter': [150, 150],
    'inputTime': 0,
    'inputAngle': 2,
    'inputRadius': 150,
    'inputCompression': 300
  },
  'CIMorphologyGradient': {'inputRadius': 5},
  'CIMorphologyMaximum': {'inputRadius': 0},
  'CIMorphologyMinimum': {'inputRadius': 0},
  'CIMorphologyRectangleMaximum': {'inputWidth': 5, 'inputHeight': 5},
  'CIMorphologyRectangleMinimum': {'inputWidth': 5, 'inputHeight': 5},
  'CIMotionBlur': {'inputRadius': 20, 'inputAngle': 0},
  'CIMultiplyBlendMode': {},
  'CIMultiplyCompositing': {},
  'CINinePartStretched': {
    'inputBreakpoint0': [50, 50],
    'inputBreakpoint1': [150, 150],
    'inputGrowAmount': [100, 100]
  },
  'CINinePartTiled': {
    'inputBreakpoint0': [50, 50],
    'inputBreakpoint1': [150, 150],
    'inputGrowAmount': [100, 100],
    'inputFlipYTiles': 1
  },
  'CINoiseReduction': {'inputNoiseLevel': 0.02, 'inputSharpness': 0.4},
  'CIOpTile': {
    'inputCenter': [150, 150],
    'inputScale': 2.8,
    'inputAngle': 0,
    'inputWidth': 65
  },
  'CIOverlayBlendMode': {},
  'CIPageCurlTransition': {
    'inputExtent': [0, 0, 300, 300],
    'inputTime': 0,
    'inputAngle': 0,
    'inputRadius': 100
  },
  'CIPageCurlWithShadowTransition': {
    'inputExtent': [0, 0, 0, 0],
    'inputTime': 0,
    'inputAngle': 0,
    'inputRadius': 100,
    'inputShadowSize': 0.5,
    'inputShadowAmount': 0.7,
    'inputShadowExtent': [0, 0, 0, 0]
  },
  'CIPaletteCentroid': {'inputPerceptual': 0},
  'CIPalettize': {'inputPerceptual': 0},
  'CIParallelogramTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputAcuteAngle': 1.570796326794897,
    'inputWidth': 100
  },
  'CIPDF417BarcodeGenerator': {},
  'CIPersonSegmentation': {},
  'CIPerspectiveCorrection': {
    'inputTopLeft': [118, 484],
    'inputTopRight': [646, 507],
    'inputBottomRight': [548, 140],
    'inputBottomLeft': [155, 153],
    'inputCrop': 1
  },
  'CIPerspectiveRotate': {
    'inputFocalLength': 28,
    'inputPitch': 0,
    'inputYaw': 0,
    'inputRoll': 0
  },
  'CIPerspectiveTile': {
    'inputTopLeft': [118, 484],
    'inputTopRight': [646, 507],
    'inputBottomRight': [548, 140],
    'inputBottomLeft': [155, 153]
  },
  'CIPerspectiveTransform': {
    'inputTopLeft': [118, 484],
    'inputTopRight': [646, 507],
    'inputBottomRight': [548, 140],
    'inputBottomLeft': [155, 153]
  },
  'CIPerspectiveTransformWithExtent': {
    'inputExtent': [0, 0, 300, 300],
    'inputTopLeft': [118, 484],
    'inputTopRight': [646, 507],
    'inputBottomRight': [548, 140],
    'inputBottomLeft': [155, 153]
  },
  'CIPhotoEffectChrome': {},
  'CIPhotoEffectFade': {},
  'CIPhotoEffectInstant': {},
  'CIPhotoEffectMono': {},
  'CIPhotoEffectNoir': {},
  'CIPhotoEffectProcess': {},
  'CIPhotoEffectTonal': {},
  'CIPhotoEffectTransfer': {},
  'CIPinchDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 300,
    'inputScale': 0.5
  },
  'CIPinLightBlendMode': {},
  'CIPixellate': {
    'inputCenter': [150, 150],
    'inputScale': 8
  },
  'CIPointillize': {
    'inputRadius': 20,
    'inputCenter': [150, 150]
  },
  'CIQRCodeGenerator': {'inputCorrectionLevel': 'M'},
  'CIRadialGradient': {
    'inputCenter': [150, 150],
    'inputRadius0': 5,
    'inputRadius1': 100,
    'inputColor0': Color.fromRGBO(255, 255, 255, 1.0),
    'inputColor1': Color.fromRGBO(0, 0, 0, 1.0)
  },
  'CIRandomGenerator': {},
  'CIRippleTransition': {
    'inputCenter': [150, 150],
    'inputExtent': [0, 0, 300, 300],
    'inputTime': 0,
    'inputWidth': 100,
    'inputScale': 50
  },
  'CIRoundedRectangleGenerator': {
    'inputExtent': [0, 0, 100, 100],
    'inputRadius': 10,
    'inputColor': Color.fromRGBO(255, 255, 255, 1.0)
  },
  'CIRowAverage': {
    'inputExtent': [0, 0, 640, 80]
  },
  'CISaliencyMapFilter': {},
  'CISampleNearest': {},
  'CISaturationBlendMode': {},
  'CIScreenBlendMode': {},
  'CISepiaTone': {'inputIntensity': 1},
  'CIShadedMaterial': {'inputScale': 10},
  'CISharpenLuminance': {'inputSharpness': 0.4, 'inputRadius': 1.69},
  'CISixfoldReflectedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CISixfoldRotatedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CISmoothLinearGradient': {
    'inputPoint0': [0, 0],
    'inputPoint1': [200, 200],
    'inputColor0': Color.fromRGBO(255, 255, 255, 1.0),
    'inputColor1': Color.fromRGBO(0, 0, 0, 1.0)
  },
  'CISoftLightBlendMode': {},
  'CISourceAtopCompositing': {},
  'CISourceInCompositing': {},
  'CISourceOutCompositing': {},
  'CISourceOverCompositing': {},
  'CISpotColor': {
    'inputCenterColor1': Color.fromRGBO(19, 15, 18, 1.0),
    'inputReplacementColor1': Color.fromRGBO(111, 49, 50, 1.0),
    'inputCloseness1': 0.22,
    'inputContrast1': 0.98,
    'inputCenterColor2': Color.fromRGBO(134, 78, 88, 1.0),
    'inputReplacementColor2': Color.fromRGBO(232, 143, 129, 1.0),
    'inputCloseness2': 0.15,
    'inputContrast2': 0.98,
    'inputCenterColor3': Color.fromRGBO(235, 115, 84, 1.0),
    'inputReplacementColor3': Color.fromRGBO(231, 191, 154, 1.0),
    'inputCloseness3': 0.5,
    'inputContrast3': 0.99
  },
  'CISpotLight': {
    'inputLightPosition': [400, 600, 150],
    'inputLightPointsAt': [200, 200, 0],
    'inputBrightness': 3,
    'inputConcentration': 0.1,
    'inputColor': Color.fromRGBO(255, 255, 255, 1.0)
  },
  'CISRGBToneCurveToLinear': {},
  'CIStarShineGenerator': {
    'inputCenter': [150, 150],
    'inputColor': Color.fromRGBO(255, 204, 153, 1.0),
    'inputRadius': 50,
    'inputCrossScale': 15,
    'inputCrossAngle': 0.6,
    'inputCrossOpacity': -2,
    'inputCrossWidth': 2.5,
    'inputEpsilon': -2
  },
  'CIStraightenFilter': {'inputAngle': 0},
  'CIStretchCrop': {
    'inputSize': [1280, 720],
    'inputCropAmount': 0.25,
    'inputCenterStretchAmount': 0.25
  },
  'CIStripesGenerator': {
    'inputCenter': [150, 150],
    'inputColor0': Color.fromRGBO(255, 255, 255, 1.0),
    'inputColor1': Color.fromRGBO(0, 0, 0, 1.0),
    'inputWidth': 80,
    'inputSharpness': 1
  },
  'CISubtractBlendMode': {},
  'CISunbeamsGenerator': {
    'inputCenter': [150, 150],
    'inputColor': Color.fromRGBO(255, 127, 0, 1.0),
    'inputSunRadius': 40,
    'inputMaxStriationRadius': 2.58,
    'inputStriationStrength': 0.5,
    'inputStriationContrast': 1.375,
    'inputTime': 0
  },
  'CISwipeTransition': {
    'inputExtent': [0, 0, 300, 300],
    'inputColor': Color.fromRGBO(255, 255, 255, 1.0),
    'inputTime': 0,
    'inputAngle': 0,
    'inputWidth': 300,
    'inputOpacity': 0
  },
  'CITemperatureAndTint': {
    'inputNeutral': [6500, 0],
    'inputTargetNeutral': [6500, 0]
  },
  'CITextImageGenerator': {
    'inputFontName': 'HelveticaNeue',
    'inputFontSize': 12,
    'inputScaleFactor': 1,
    'inputPadding': 0
  },
  'CIThermal': {},
  'CIToneCurve': {
    'inputPoint0': [0, 0],
    'inputPoint1': [0.25, 0.25],
    'inputPoint2': [0.5, 0.5],
    'inputPoint3': [0.75, 0.75],
    'inputPoint4': [1, 1]
  },
  'CITorusLensDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 160,
    'inputWidth': 80,
    'inputRefraction': 1.7
  },
  'CITriangleKaleidoscope': {
    'inputPoint': [150, 150],
    'inputSize': 700,
    'inputRotation': 5.924285296593801,
    'inputDecay': 0.85
  },
  'CITriangleTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CITwelvefoldReflectedTile': {
    'inputCenter': [150, 150],
    'inputAngle': 0,
    'inputWidth': 100
  },
  'CITwirlDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 300,
    'inputAngle': 3.141592653589793
  },
  'CIUnsharpMask': {'inputRadius': 2.5, 'inputIntensity': 0.5},
  'CIVibrance': {'inputAmount': 0},
  'CIVignette': {'inputIntensity': 0, 'inputRadius': 1},
  'CIVignetteEffect': {
    'inputCenter': [150, 150],
    'inputRadius': 150,
    'inputIntensity': 1,
    'inputFalloff': 0.5
  },
  'CIVividLightBlendMode': {},
  'CIVortexDistortion': {
    'inputCenter': [150, 150],
    'inputRadius': 300,
    'inputAngle': 56.54866776461628
  },
  'CIWhitePointAdjust': {'inputColor': Color.fromRGBO(255, 255, 255, 1.0)},
  'CIXRay': {},
  'CIZoomBlur': {
    'inputCenter': [150, 150],
    'inputAmount': 20
  }
};
