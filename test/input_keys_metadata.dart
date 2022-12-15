const Map<String, List<String>> inputKeys = {
  'CIAccordionFoldTransition': [
    'inputImage',
    'inputTargetImage',
    'inputBottomHeight',
    'inputNumberOfFolds',
    'inputFoldShadowAmount',
    'inputTime'
  ],
  'CIAdditionCompositing': ['inputImage', 'inputBackgroundImage'],
  'CIAffineClamp': ['inputImage', 'inputTransform'],
  'CIAffineTile': ['inputImage', 'inputTransform'],
  'CIAffineTransform': ['inputImage', 'inputTransform'],
  'CIAreaAverage': ['inputImage', 'inputExtent'],
  'CIAreaHistogram': ['inputImage', 'inputExtent', 'inputScale', 'inputCount'],
  'CIAreaLogarithmicHistogram': [
    'inputImage',
    'inputExtent',
    'inputScale',
    'inputCount',
    'inputMinimumStop',
    'inputMaximumStop'
  ],
  'CIAreaMaximum': ['inputImage', 'inputExtent'],
  'CIAreaMaximumAlpha': ['inputImage', 'inputExtent'],
  'CIAreaMinimum': ['inputImage', 'inputExtent'],
  'CIAreaMinimumAlpha': ['inputImage', 'inputExtent'],
  'CIAreaMinMax': ['inputImage', 'inputExtent'],
  'CIAreaMinMaxRed': ['inputImage', 'inputExtent'],
  'CIAttributedTextImageGenerator': [
    'inputText',
    'inputScaleFactor',
    'inputPadding'
  ],
  'CIAztecCodeGenerator': [
    'inputMessage',
    'inputCorrectionLevel',
    'inputLayers',
    'inputCompactStyle'
  ],
  'CIBarcodeGenerator': ['inputBarcodeDescriptor'],
  'CIBarsSwipeTransition': [
    'inputImage',
    'inputTargetImage',
    'inputAngle',
    'inputWidth',
    'inputBarOffset',
    'inputTime'
  ],
  'CIBicubicScaleTransform': [
    'inputImage',
    'inputScale',
    'inputAspectRatio',
    'inputB',
    'inputC'
  ],
  'CIBlendWithAlphaMask': [
    'inputImage',
    'inputBackgroundImage',
    'inputMaskImage'
  ],
  'CIBlendWithBlueMask': [
    'inputImage',
    'inputBackgroundImage',
    'inputMaskImage'
  ],
  'CIBlendWithMask': ['inputImage', 'inputBackgroundImage', 'inputMaskImage'],
  'CIBlendWithRedMask': [
    'inputImage',
    'inputBackgroundImage',
    'inputMaskImage'
  ],
  'CIBloom': ['inputImage', 'inputRadius', 'inputIntensity'],
  'CIBokehBlur': [
    'inputImage',
    'inputRadius',
    'inputRingAmount',
    'inputRingSize',
    'inputSoftness'
  ],
  'CIBoxBlur': ['inputImage', 'inputRadius'],
  'CIBumpDistortion': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputScale'
  ],
  'CIBumpDistortionLinear': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputAngle',
    'inputScale'
  ],
  'CICameraCalibrationLensCorrection': [
    'inputImage',
    'inputAVCameraCalibrationData',
    'inputUseInverseLookUpTable'
  ],
  'CICheckerboardGenerator': [
    'inputCenter',
    'inputColor0',
    'inputColor1',
    'inputWidth',
    'inputSharpness'
  ],
  'CICircleSplashDistortion': ['inputImage', 'inputCenter', 'inputRadius'],
  'CICircularScreen': [
    'inputImage',
    'inputCenter',
    'inputWidth',
    'inputSharpness'
  ],
  'CICircularWrap': ['inputImage', 'inputCenter', 'inputRadius', 'inputAngle'],
  'CIClamp': ['inputImage', 'inputExtent'],
  'CICMYKHalftone': [
    'inputImage',
    'inputCenter',
    'inputWidth',
    'inputAngle',
    'inputSharpness',
    'inputGCR',
    'inputUCR'
  ],
  'CICode128BarcodeGenerator': [
    'inputMessage',
    'inputQuietSpace',
    'inputBarcodeHeight'
  ],
  'CIColorAbsoluteDifference': ['inputImage', 'inputImage2'],
  'CIColorBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIColorBurnBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIColorClamp': ['inputImage', 'inputMinComponents', 'inputMaxComponents'],
  'CIColorControls': [
    'inputImage',
    'inputSaturation',
    'inputBrightness',
    'inputContrast'
  ],
  'CIColorCrossPolynomial': [
    'inputImage',
    'inputRedCoefficients',
    'inputGreenCoefficients',
    'inputBlueCoefficients'
  ],
  'CIColorCube': [
    'inputImage',
    'inputCubeDimension',
    'inputCubeData',
    'inputExtrapolate'
  ],
  'CIColorCubesMixedWithMask': [
    'inputImage',
    'inputMaskImage',
    'inputCubeDimension',
    'inputCube0Data',
    'inputCube1Data',
    'inputColorSpace',
    'inputExtrapolate'
  ],
  'CIColorCubeWithColorSpace': [
    'inputImage',
    'inputCubeDimension',
    'inputCubeData',
    'inputExtrapolate',
    'inputColorSpace'
  ],
  'CIColorCurves': [
    'inputImage',
    'inputCurvesData',
    'inputCurvesDomain',
    'inputColorSpace'
  ],
  'CIColorDodgeBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIColorInvert': ['inputImage'],
  'CIColorMap': ['inputImage', 'inputGradientImage'],
  'CIColorMatrix': [
    'inputImage',
    'inputRVector',
    'inputGVector',
    'inputBVector',
    'inputAVector',
    'inputBiasVector'
  ],
  'CIColorMonochrome': ['inputImage', 'inputColor', 'inputIntensity'],
  'CIColorPolynomial': [
    'inputImage',
    'inputRedCoefficients',
    'inputGreenCoefficients',
    'inputBlueCoefficients',
    'inputAlphaCoefficients'
  ],
  'CIColorPosterize': ['inputImage', 'inputLevels'],
  'CIColorThreshold': ['inputImage', 'inputThreshold'],
  'CIColorThresholdOtsu': ['inputImage'],
  'CIColumnAverage': ['inputImage', 'inputExtent'],
  'CIComicEffect': ['inputImage'],
  'CIConstantColorGenerator': ['inputColor'],
  'CIConvertLabToRGB': ['inputImage', 'inputNormalize'],
  'CIConvertRGBtoLab': ['inputImage', 'inputNormalize'],
  'CIConvolution3X3': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolution5X5': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolution7X7': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolution9Horizontal': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolution9Vertical': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolutionRGB3X3': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolutionRGB5X5': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolutionRGB7X7': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolutionRGB9Horizontal': ['inputImage', 'inputWeights', 'inputBias'],
  'CIConvolutionRGB9Vertical': ['inputImage', 'inputWeights', 'inputBias'],
  'CICopyMachineTransition': [
    'inputImage',
    'inputTargetImage',
    'inputExtent',
    'inputColor',
    'inputTime',
    'inputAngle',
    'inputWidth',
    'inputOpacity'
  ],
  'CICoreMLModelFilter': [
    'inputImage',
    'inputModel',
    'inputHeadIndex',
    'inputSoftmaxNormalization'
  ],
  'CICrop': ['inputImage', 'inputRectangle'],
  'CICrystallize': ['inputImage', 'inputRadius', 'inputCenter'],
  'CIDarkenBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIDepthBlurEffect': [
    'inputImage',
    'inputDisparityImage',
    'inputMatteImage',
    'inputHairImage',
    'inputGlassesImage',
    'inputGainMap',
    'inputAperture',
    'inputLeftEyePositions',
    'inputRightEyePositions',
    'inputChinPositions',
    'inputNosePositions',
    'inputFocusRect',
    'inputLumaNoiseScale',
    'inputScaleFactor',
    'inputCalibrationData',
    'inputAuxDataMetadata',
    'inputShape'
  ],
  'CIDepthOfField': [
    'inputImage',
    'inputPoint0',
    'inputPoint1',
    'inputSaturation',
    'inputUnsharpMaskRadius',
    'inputUnsharpMaskIntensity',
    'inputRadius'
  ],
  'CIDepthToDisparity': ['inputImage'],
  'CIDifferenceBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIDiscBlur': ['inputImage', 'inputRadius'],
  'CIDisintegrateWithMaskTransition': [
    'inputImage',
    'inputTargetImage',
    'inputMaskImage',
    'inputTime',
    'inputShadowRadius',
    'inputShadowDensity',
    'inputShadowOffset'
  ],
  'CIDisparityToDepth': ['inputImage'],
  'CIDisplacementDistortion': [
    'inputImage',
    'inputDisplacementImage',
    'inputScale'
  ],
  'CIDissolveTransition': ['inputImage', 'inputTargetImage', 'inputTime'],
  'CIDither': ['inputImage', 'inputIntensity'],
  'CIDivideBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIDocumentEnhancer': ['inputImage', 'inputAmount'],
  'CIDotScreen': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth',
    'inputSharpness'
  ],
  'CIDroste': [
    'inputImage',
    'inputInsetPoint0',
    'inputInsetPoint1',
    'inputStrands',
    'inputPeriodicity',
    'inputRotation',
    'inputZoom'
  ],
  'CIEdgePreserveUpsampleFilter': [
    'inputImage',
    'inputSmallImage',
    'inputSpatialSigma',
    'inputLumaSigma'
  ],
  'CIEdges': ['inputImage', 'inputIntensity'],
  'CIEdgeWork': ['inputImage', 'inputRadius'],
  'CIEightfoldReflectedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth'
  ],
  'CIExclusionBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIExposureAdjust': ['inputImage', 'inputEV'],
  'CIFalseColor': ['inputImage', 'inputColor0', 'inputColor1'],
  'CIFlashTransition': [
    'inputImage',
    'inputTargetImage',
    'inputCenter',
    'inputExtent',
    'inputColor',
    'inputTime',
    'inputMaxStriationRadius',
    'inputStriationStrength',
    'inputStriationContrast',
    'inputFadeThreshold'
  ],
  'CIFourfoldReflectedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth',
    'inputAcuteAngle'
  ],
  'CIFourfoldRotatedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth'
  ],
  'CIFourfoldTranslatedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth',
    'inputAcuteAngle'
  ],
  'CIGaborGradients': ['inputImage'],
  'CIGammaAdjust': ['inputImage', 'inputPower'],
  'CIGaussianBlur': ['inputImage', 'inputRadius'],
  'CIGaussianGradient': [
    'inputCenter',
    'inputColor0',
    'inputColor1',
    'inputRadius'
  ],
  'CIGlassDistortion': [
    'inputImage',
    'inputTexture',
    'inputCenter',
    'inputScale'
  ],
  'CIGlassLozenge': [
    'inputImage',
    'inputPoint0',
    'inputPoint1',
    'inputRadius',
    'inputRefraction'
  ],
  'CIGlideReflectedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth'
  ],
  'CIGloom': ['inputImage', 'inputRadius', 'inputIntensity'],
  'CIGuidedFilter': [
    'inputImage',
    'inputGuideImage',
    'inputRadius',
    'inputEpsilon'
  ],
  'CIHardLightBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIHatchedScreen': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth',
    'inputSharpness'
  ],
  'CIHeightFieldFromMask': ['inputImage', 'inputRadius'],
  'CIHexagonalPixellate': ['inputImage', 'inputCenter', 'inputScale'],
  'CIHighlightShadowAdjust': [
    'inputImage',
    'inputRadius',
    'inputShadowAmount',
    'inputHighlightAmount'
  ],
  'CIHistogramDisplayFilter': [
    'inputImage',
    'inputHeight',
    'inputHighLimit',
    'inputLowLimit'
  ],
  'CIHoleDistortion': ['inputImage', 'inputCenter', 'inputRadius'],
  'CIHueAdjust': ['inputImage', 'inputAngle'],
  'CIHueBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIHueSaturationValueGradient': [
    'inputValue',
    'inputRadius',
    'inputSoftness',
    'inputDither',
    'inputColorSpace'
  ],
  'CIKaleidoscope': ['inputImage', 'inputCount', 'inputCenter', 'inputAngle'],
  'CIKeystoneCorrectionCombined': [
    'inputImage',
    'inputFocalLength',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft'
  ],
  'CIKeystoneCorrectionHorizontal': [
    'inputImage',
    'inputFocalLength',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft'
  ],
  'CIKeystoneCorrectionVertical': [
    'inputImage',
    'inputFocalLength',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft'
  ],
  'CIKMeans': [
    'inputImage',
    'inputExtent',
    'inputMeans',
    'inputCount',
    'inputPasses',
    'inputPerceptual'
  ],
  'CILabDeltaE': ['inputImage', 'inputImage2'],
  'CILanczosScaleTransform': ['inputImage', 'inputScale', 'inputAspectRatio'],
  'CILenticularHaloGenerator': [
    'inputCenter',
    'inputColor',
    'inputHaloRadius',
    'inputHaloWidth',
    'inputHaloOverlap',
    'inputStriationStrength',
    'inputStriationContrast',
    'inputTime'
  ],
  'CILightenBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CILightTunnel': [
    'inputImage',
    'inputCenter',
    'inputRotation',
    'inputRadius'
  ],
  'CILinearBurnBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CILinearDodgeBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CILinearGradient': [
    'inputPoint0',
    'inputPoint1',
    'inputColor0',
    'inputColor1'
  ],
  'CILinearLightBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CILinearToSRGBToneCurve': ['inputImage'],
  'CILineOverlay': [
    'inputImage',
    'inputNRNoiseLevel',
    'inputNRSharpness',
    'inputEdgeIntensity',
    'inputThreshold',
    'inputContrast'
  ],
  'CILineScreen': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth',
    'inputSharpness'
  ],
  'CILuminosityBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIMaskedVariableBlur': ['inputImage', 'inputMask', 'inputRadius'],
  'CIMaskToAlpha': ['inputImage'],
  'CIMaximumComponent': ['inputImage'],
  'CIMaximumCompositing': ['inputImage', 'inputBackgroundImage'],
  'CIMedianFilter': ['inputImage'],
  'CIMeshGenerator': ['inputWidth', 'inputColor', 'inputMesh'],
  'CIMinimumComponent': ['inputImage'],
  'CIMinimumCompositing': ['inputImage', 'inputBackgroundImage'],
  'CIMix': ['inputImage', 'inputBackgroundImage', 'inputAmount'],
  'CIModTransition': [
    'inputImage',
    'inputTargetImage',
    'inputCenter',
    'inputTime',
    'inputAngle',
    'inputRadius',
    'inputCompression'
  ],
  'CIMorphologyGradient': ['inputImage', 'inputRadius'],
  'CIMorphologyMaximum': ['inputImage', 'inputRadius'],
  'CIMorphologyMinimum': ['inputImage', 'inputRadius'],
  'CIMorphologyRectangleMaximum': ['inputImage', 'inputWidth', 'inputHeight'],
  'CIMorphologyRectangleMinimum': ['inputImage', 'inputWidth', 'inputHeight'],
  'CIMotionBlur': ['inputImage', 'inputRadius', 'inputAngle'],
  'CIMultiplyBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIMultiplyCompositing': ['inputImage', 'inputBackgroundImage'],
  'CINinePartStretched': [
    'inputImage',
    'inputBreakpoint0',
    'inputBreakpoint1',
    'inputGrowAmount'
  ],
  'CINinePartTiled': [
    'inputImage',
    'inputBreakpoint0',
    'inputBreakpoint1',
    'inputGrowAmount',
    'inputFlipYTiles'
  ],
  'CINoiseReduction': ['inputImage', 'inputNoiseLevel', 'inputSharpness'],
  'CIOpTile': [
    'inputImage',
    'inputCenter',
    'inputScale',
    'inputAngle',
    'inputWidth'
  ],
  'CIOverlayBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIPageCurlTransition': [
    'inputImage',
    'inputTargetImage',
    'inputBacksideImage',
    'inputShadingImage',
    'inputExtent',
    'inputTime',
    'inputAngle',
    'inputRadius'
  ],
  'CIPageCurlWithShadowTransition': [
    'inputImage',
    'inputTargetImage',
    'inputBacksideImage',
    'inputExtent',
    'inputTime',
    'inputAngle',
    'inputRadius',
    'inputShadowSize',
    'inputShadowAmount',
    'inputShadowExtent'
  ],
  'CIPaletteCentroid': ['inputImage', 'inputPaletteImage', 'inputPerceptual'],
  'CIPalettize': ['inputImage', 'inputPaletteImage', 'inputPerceptual'],
  'CIParallelogramTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputAcuteAngle',
    'inputWidth'
  ],
  'CIPDF417BarcodeGenerator': [
    'inputMessage',
    'inputMinWidth',
    'inputMaxWidth',
    'inputMinHeight',
    'inputMaxHeight',
    'inputDataColumns',
    'inputRows',
    'inputPreferredAspectRatio',
    'inputCompactionMode',
    'inputCompactStyle',
    'inputCorrectionLevel',
    'inputAlwaysSpecifyCompaction'
  ],
  'CIPersonSegmentation': ['inputImage', 'inputQualityLevel'],
  'CIPerspectiveCorrection': [
    'inputImage',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft',
    'inputCrop'
  ],
  'CIPerspectiveRotate': [
    'inputImage',
    'inputFocalLength',
    'inputPitch',
    'inputYaw',
    'inputRoll'
  ],
  'CIPerspectiveTile': [
    'inputImage',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft'
  ],
  'CIPerspectiveTransform': [
    'inputImage',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft'
  ],
  'CIPerspectiveTransformWithExtent': [
    'inputImage',
    'inputExtent',
    'inputTopLeft',
    'inputTopRight',
    'inputBottomRight',
    'inputBottomLeft'
  ],
  'CIPhotoEffectChrome': ['inputImage'],
  'CIPhotoEffectFade': ['inputImage'],
  'CIPhotoEffectInstant': ['inputImage'],
  'CIPhotoEffectMono': ['inputImage'],
  'CIPhotoEffectNoir': ['inputImage'],
  'CIPhotoEffectProcess': ['inputImage'],
  'CIPhotoEffectTonal': ['inputImage'],
  'CIPhotoEffectTransfer': ['inputImage'],
  'CIPinchDistortion': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputScale'
  ],
  'CIPinLightBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIPixellate': ['inputImage', 'inputCenter', 'inputScale'],
  'CIPointillize': ['inputImage', 'inputRadius', 'inputCenter'],
  'CIQRCodeGenerator': ['inputMessage', 'inputCorrectionLevel'],
  'CIRadialGradient': [
    'inputCenter',
    'inputRadius0',
    'inputRadius1',
    'inputColor0',
    'inputColor1'
  ],
  'CIRandomGenerator': [],
  'CIRippleTransition': [
    'inputImage',
    'inputTargetImage',
    'inputShadingImage',
    'inputCenter',
    'inputExtent',
    'inputTime',
    'inputWidth',
    'inputScale'
  ],
  'CIRoundedRectangleGenerator': ['inputExtent', 'inputRadius', 'inputColor'],
  'CIRowAverage': ['inputImage', 'inputExtent'],
  'CISaliencyMapFilter': ['inputImage'],
  'CISampleNearest': ['inputImage'],
  'CISaturationBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIScreenBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CISepiaTone': ['inputImage', 'inputIntensity'],
  'CIShadedMaterial': ['inputImage', 'inputShadingImage', 'inputScale'],
  'CISharpenLuminance': ['inputImage', 'inputSharpness', 'inputRadius'],
  'CISixfoldReflectedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth'
  ],
  'CISixfoldRotatedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth'
  ],
  'CISmoothLinearGradient': [
    'inputPoint0',
    'inputPoint1',
    'inputColor0',
    'inputColor1'
  ],
  'CISoftLightBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CISourceAtopCompositing': ['inputImage', 'inputBackgroundImage'],
  'CISourceInCompositing': ['inputImage', 'inputBackgroundImage'],
  'CISourceOutCompositing': ['inputImage', 'inputBackgroundImage'],
  'CISourceOverCompositing': ['inputImage', 'inputBackgroundImage'],
  'CISpotColor': [
    'inputImage',
    'inputCenterColor1',
    'inputReplacementColor1',
    'inputCloseness1',
    'inputContrast1',
    'inputCenterColor2',
    'inputReplacementColor2',
    'inputCloseness2',
    'inputContrast2',
    'inputCenterColor3',
    'inputReplacementColor3',
    'inputCloseness3',
    'inputContrast3'
  ],
  'CISpotLight': [
    'inputImage',
    'inputLightPosition',
    'inputLightPointsAt',
    'inputBrightness',
    'inputConcentration',
    'inputColor'
  ],
  'CISRGBToneCurveToLinear': ['inputImage'],
  'CIStarShineGenerator': [
    'inputCenter',
    'inputColor',
    'inputRadius',
    'inputCrossScale',
    'inputCrossAngle',
    'inputCrossOpacity',
    'inputCrossWidth',
    'inputEpsilon'
  ],
  'CIStraightenFilter': ['inputImage', 'inputAngle'],
  'CIStretchCrop': [
    'inputImage',
    'inputSize',
    'inputCropAmount',
    'inputCenterStretchAmount'
  ],
  'CIStripesGenerator': [
    'inputCenter',
    'inputColor0',
    'inputColor1',
    'inputWidth',
    'inputSharpness'
  ],
  'CISubtractBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CISunbeamsGenerator': [
    'inputCenter',
    'inputColor',
    'inputSunRadius',
    'inputMaxStriationRadius',
    'inputStriationStrength',
    'inputStriationContrast',
    'inputTime'
  ],
  'CISwipeTransition': [
    'inputImage',
    'inputTargetImage',
    'inputExtent',
    'inputColor',
    'inputTime',
    'inputAngle',
    'inputWidth',
    'inputOpacity'
  ],
  'CITemperatureAndTint': ['inputImage', 'inputNeutral', 'inputTargetNeutral'],
  'CITextImageGenerator': [
    'inputText',
    'inputFontName',
    'inputFontSize',
    'inputScaleFactor',
    'inputPadding'
  ],
  'CIThermal': ['inputImage'],
  'CIToneCurve': [
    'inputImage',
    'inputPoint0',
    'inputPoint1',
    'inputPoint2',
    'inputPoint3',
    'inputPoint4'
  ],
  'CITorusLensDistortion': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputWidth',
    'inputRefraction'
  ],
  'CITriangleKaleidoscope': [
    'inputImage',
    'inputPoint',
    'inputSize',
    'inputRotation',
    'inputDecay'
  ],
  'CITriangleTile': ['inputImage', 'inputCenter', 'inputAngle', 'inputWidth'],
  'CITwelvefoldReflectedTile': [
    'inputImage',
    'inputCenter',
    'inputAngle',
    'inputWidth'
  ],
  'CITwirlDistortion': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputAngle'
  ],
  'CIUnsharpMask': ['inputImage', 'inputRadius', 'inputIntensity'],
  'CIVibrance': ['inputImage', 'inputAmount'],
  'CIVignette': ['inputImage', 'inputIntensity', 'inputRadius'],
  'CIVignetteEffect': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputIntensity',
    'inputFalloff'
  ],
  'CIVividLightBlendMode': ['inputImage', 'inputBackgroundImage'],
  'CIVortexDistortion': [
    'inputImage',
    'inputCenter',
    'inputRadius',
    'inputAngle'
  ],
  'CIWhitePointAdjust': ['inputImage', 'inputColor'],
  'CIXRay': ['inputImage'],
  'CIZoomBlur': ['inputImage', 'inputCenter', 'inputAmount']
};

const Map<String, List<String>> inputKeysDisplayNames = {
  'CIAccordionFoldTransition': [
    'Image',
    'Target Image',
    'Bottom Height',
    'Number of Folds',
    'Fold Shadow Amount',
    'Time'
  ],
  'CIAdditionCompositing': ['Image', 'Background Image'],
  'CIAffineClamp': ['Image', 'Transform'],
  'CIAffineTile': ['Image', 'Transform'],
  'CIAffineTransform': ['Image', 'Transform'],
  'CIAreaAverage': ['Image', 'Extent'],
  'CIAreaHistogram': ['Image', 'Extent', 'Scale', 'Count'],
  'CIAreaLogarithmicHistogram': [
    'Image',
    'Extent',
    'Scale',
    'Count',
    'Minimum Stop',
    'Maximum Stop'
  ],
  'CIAreaMaximum': ['Image', 'Extent'],
  'CIAreaMaximumAlpha': ['Image', 'Extent'],
  'CIAreaMinimum': ['Image', 'Extent'],
  'CIAreaMinimumAlpha': ['Image', 'Extent'],
  'CIAreaMinMax': ['Image', 'Extent'],
  'CIAreaMinMaxRed': ['Image', 'Extent'],
  'CIAttributedTextImageGenerator': ['Text', 'Scale Factor', 'Padding'],
  'CIAztecCodeGenerator': [
    'Message',
    'Correction Level',
    'Layers',
    'Compact Style'
  ],
  'CIBarcodeGenerator': ['Barcode Descriptor'],
  'CIBarsSwipeTransition': [
    'Image',
    'Target Image',
    'Angle',
    'Width',
    'Bar Offset',
    'Time'
  ],
  'CIBicubicScaleTransform': ['Image', 'Scale', 'Aspect Ratio', 'B', 'C'],
  'CIBlendWithAlphaMask': ['Image', 'Background Image', 'Mask Image'],
  'CIBlendWithBlueMask': ['Image', 'Background Image', 'Mask Image'],
  'CIBlendWithMask': ['Image', 'Background Image', 'Mask Image'],
  'CIBlendWithRedMask': ['Image', 'Background Image', 'Mask Image'],
  'CIBloom': ['Image', 'Radius', 'Intensity'],
  'CIBokehBlur': ['Image', 'Radius', 'Ring Amount', 'Ring Size', 'Softness'],
  'CIBoxBlur': ['Image', 'Radius'],
  'CIBumpDistortion': ['Image', 'Center', 'Radius', 'Scale'],
  'CIBumpDistortionLinear': ['Image', 'Center', 'Radius', 'Angle', 'Scale'],
  'CICameraCalibrationLensCorrection': [
    'Image',
    'AVCameraCalibrationData',
    'Use Inverse Look Up Table'
  ],
  'CICheckerboardGenerator': [
    'Center',
    'Color 1',
    'Color 2',
    'Width',
    'Sharpness'
  ],
  'CICircleSplashDistortion': ['Image', 'Center', 'Radius'],
  'CICircularScreen': ['Image', 'Center', 'Width', 'Sharpness'],
  'CICircularWrap': ['Image', 'Center', 'Radius', 'Angle'],
  'CIClamp': ['Image', 'Extent'],
  'CICMYKHalftone': [
    'Image',
    'Center',
    'Width',
    'Angle',
    'Sharpness',
    'Gray Component Replacement',
    'Under Color Removal'
  ],
  'CICode128BarcodeGenerator': ['Message', 'Quiet Space', 'Barcode Height'],
  'CIColorAbsoluteDifference': ['Image', 'Image2'],
  'CIColorBlendMode': ['Image', 'Background Image'],
  'CIColorBurnBlendMode': ['Image', 'Background Image'],
  'CIColorClamp': ['Image', 'Min Components', 'Max Components'],
  'CIColorControls': ['Image', 'Saturation', 'Brightness', 'Contrast'],
  'CIColorCrossPolynomial': [
    'Image',
    'Red Coefficients',
    'Green Coefficients',
    'Blue Coefficients'
  ],
  'CIColorCube': ['Image', 'Cube Dimension', 'Cube Data', 'Extrapolate'],
  'CIColorCubesMixedWithMask': [
    'Image',
    'Mask Image',
    'Cube Dimension',
    'Cube 0 Data',
    'Cube 1 Data',
    'Color Space',
    'Extrapolate'
  ],
  'CIColorCubeWithColorSpace': [
    'Image',
    'Cube Dimension',
    'Cube Data',
    'Extrapolate',
    'Color Space'
  ],
  'CIColorCurves': ['Image', 'Curves Data', 'Curves Domain', 'Color Space'],
  'CIColorDodgeBlendMode': ['Image', 'Background Image'],
  'CIColorInvert': ['Image'],
  'CIColorMap': ['Image', 'Gradient Image'],
  'CIColorMatrix': [
    'Image',
    'Red Vector',
    'Green Vector',
    'Blue Vector',
    'Alpha Vector',
    'Bias Vector'
  ],
  'CIColorMonochrome': ['Image', 'Color', 'Intensity'],
  'CIColorPolynomial': [
    'Image',
    'Red Coefficients',
    'Green Coefficients',
    'Blue Coefficients',
    'Alpha Coefficients'
  ],
  'CIColorPosterize': ['Image', 'Levels'],
  'CIColorThreshold': ['Image', 'Threshold'],
  'CIColorThresholdOtsu': ['Image'],
  'CIColumnAverage': ['Image', 'Extent'],
  'CIComicEffect': ['Image'],
  'CIConstantColorGenerator': ['Color'],
  'CIConvertLabToRGB': ['Image', 'Normalize'],
  'CIConvertRGBtoLab': ['Image', 'Normalize'],
  'CIConvolution3X3': ['Image', 'Weights', 'Bias'],
  'CIConvolution5X5': ['Image', 'Weights', 'Bias'],
  'CIConvolution7X7': ['Image', 'Weights', 'Bias'],
  'CIConvolution9Horizontal': ['Image', 'Weights', 'Bias'],
  'CIConvolution9Vertical': ['Image', 'Weights', 'Bias'],
  'CIConvolutionRGB3X3': ['Image', 'Weights', 'Bias'],
  'CIConvolutionRGB5X5': ['Image', 'Weights', 'Bias'],
  'CIConvolutionRGB7X7': ['Image', 'Weights', 'Bias'],
  'CIConvolutionRGB9Horizontal': ['Image', 'Weights', 'Bias'],
  'CIConvolutionRGB9Vertical': ['Image', 'Weights', 'Bias'],
  'CICopyMachineTransition': [
    'Image',
    'Target Image',
    'Extent',
    'Color',
    'Time',
    'Angle',
    'Width',
    'Opacity'
  ],
  'CICoreMLModelFilter': [
    'Image',
    'Model',
    'Head Index',
    'Softmax Normalization'
  ],
  'CICrop': ['Image', 'Rectangle'],
  'CICrystallize': ['Image', 'Radius', 'Center'],
  'CIDarkenBlendMode': ['Image', 'Background Image'],
  'CIDepthBlurEffect': [
    'Image',
    'Disparity Image',
    'Matte Image',
    'Hair Image',
    'Glasses Image',
    'Gain Map',
    'Aperture',
    'Left Eye Positions',
    'Right Eye Positions',
    'Chin Positions',
    'Nose Positions',
    'Focus Rectangle',
    'Luma Noise Scale',
    'Scale Factor',
    'Calibration Data',
    'Aux Data Metadata',
    'Shape'
  ],
  'CIDepthOfField': [
    'Image',
    'Point 0',
    'Point 1',
    'Saturation',
    'Unsharp Mask Radius',
    'Unsharp Mask Intensity',
    'Radius'
  ],
  'CIDepthToDisparity': ['Image'],
  'CIDifferenceBlendMode': ['Image', 'Background Image'],
  'CIDiscBlur': ['Image', 'Radius'],
  'CIDisintegrateWithMaskTransition': [
    'Image',
    'Target Image',
    'Mask Image',
    'Time',
    'Shadow Radius',
    'Shadow Density',
    'Shadow Offset'
  ],
  'CIDisparityToDepth': ['Image'],
  'CIDisplacementDistortion': ['Image', 'Displacement Image', 'Scale'],
  'CIDissolveTransition': ['Image', 'Target Image', 'Time'],
  'CIDither': ['Image', 'Intensity'],
  'CIDivideBlendMode': ['Image', 'Background Image'],
  'CIDocumentEnhancer': ['Image', 'Amount'],
  'CIDotScreen': ['Image', 'Center', 'Angle', 'Width', 'Sharpness'],
  'CIDroste': [
    'Image',
    'Inset Point 0',
    'Inset Point 1',
    'Strands',
    'Periodicity',
    'Rotation',
    'Zoom'
  ],
  'CIEdgePreserveUpsampleFilter': [
    'Image',
    'Small Image',
    'Spatial Sigma',
    'Luma Sigma'
  ],
  'CIEdges': ['Image', 'Intensity'],
  'CIEdgeWork': ['Image', 'Radius'],
  'CIEightfoldReflectedTile': ['Image', 'Center', 'Angle', 'Width'],
  'CIExclusionBlendMode': ['Image', 'Background Image'],
  'CIExposureAdjust': ['Image', 'EV'],
  'CIFalseColor': ['Image', 'Color 1', 'Color 2'],
  'CIFlashTransition': [
    'Image',
    'Target Image',
    'Center',
    'Extent',
    'Color',
    'Time',
    'Maximum Striation Radius',
    'Striation Strength',
    'Striation Contrast',
    'Fade Threshold'
  ],
  'CIFourfoldReflectedTile': [
    'Image',
    'Center',
    'Angle',
    'Width',
    'Acute Angle'
  ],
  'CIFourfoldRotatedTile': ['Image', 'Center', 'Angle', 'Width'],
  'CIFourfoldTranslatedTile': [
    'Image',
    'Center',
    'Angle',
    'Width',
    'Acute Angle'
  ],
  'CIGaborGradients': ['Image'],
  'CIGammaAdjust': ['Image', 'Power'],
  'CIGaussianBlur': ['Image', 'Radius'],
  'CIGaussianGradient': ['Center', 'Color 1', 'Color 2', 'Radius'],
  'CIGlassDistortion': ['Image', 'Texture', 'Center', 'Scale'],
  'CIGlassLozenge': ['Image', 'Point 0', 'Point 1', 'Radius', 'Refraction'],
  'CIGlideReflectedTile': ['Image', 'Center', 'Angle', 'Width'],
  'CIGloom': ['Image', 'Radius', 'Intensity'],
  'CIGuidedFilter': [
    'Image',
    'A larger image to use as a guide.',
    'Radius',
    'Epsilon'
  ],
  'CIHardLightBlendMode': ['Image', 'Background Image'],
  'CIHatchedScreen': ['Image', 'Center', 'Angle', 'Width', 'Sharpness'],
  'CIHeightFieldFromMask': ['Image', 'Radius'],
  'CIHexagonalPixellate': ['Image', 'Center', 'Scale'],
  'CIHighlightShadowAdjust': [
    'Image',
    'Radius',
    'Shadow Amount',
    'Highlight Amount'
  ],
  'CIHistogramDisplayFilter': ['Image', 'Height', 'High Limit', 'Low Limit'],
  'CIHoleDistortion': ['Image', 'Center', 'Radius'],
  'CIHueAdjust': ['Image', 'Angle'],
  'CIHueBlendMode': ['Image', 'Background Image'],
  'CIHueSaturationValueGradient': [
    'Value',
    'Radius',
    'Softness',
    'Dither',
    'Color Space'
  ],
  'CIKaleidoscope': ['Image', 'Count', 'Center', 'Angle'],
  'CIKeystoneCorrectionCombined': [
    'Image',
    'Focal Length',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left'
  ],
  'CIKeystoneCorrectionHorizontal': [
    'Image',
    'Focal Length',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left'
  ],
  'CIKeystoneCorrectionVertical': [
    'Image',
    'Focal Length',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left'
  ],
  'CIKMeans': ['Image', 'Extent', 'Means', 'Count', 'Passes', 'Perceptual'],
  'CILabDeltaE': ['Image', 'Image2'],
  'CILanczosScaleTransform': ['Image', 'Scale', 'Aspect Ratio'],
  'CILenticularHaloGenerator': [
    'Center',
    'Color',
    'Halo Radius',
    'Halo Width',
    'Halo Overlap',
    'Striation Strength',
    'Striation Contrast',
    'Time'
  ],
  'CILightenBlendMode': ['Image', 'Background Image'],
  'CILightTunnel': ['Image', 'Center', 'Rotation', 'Radius'],
  'CILinearBurnBlendMode': ['Image', 'Background Image'],
  'CILinearDodgeBlendMode': ['Image', 'Background Image'],
  'CILinearGradient': ['Point 0', 'Point 1', 'Color 1', 'Color 2'],
  'CILinearLightBlendMode': ['Image', 'Background Image'],
  'CILinearToSRGBToneCurve': ['Image'],
  'CILineOverlay': [
    'Image',
    'NR Noise Level',
    'NR Sharpness',
    'Edge Intensity',
    'Threshold',
    'Contrast'
  ],
  'CILineScreen': ['Image', 'Center', 'Angle', 'Width', 'Sharpness'],
  'CILuminosityBlendMode': ['Image', 'Background Image'],
  'CIMaskedVariableBlur': ['Image', 'Mask', 'Radius'],
  'CIMaskToAlpha': ['Image'],
  'CIMaximumComponent': ['Image'],
  'CIMaximumCompositing': ['Image', 'Background Image'],
  'CIMedianFilter': ['Image'],
  'CIMeshGenerator': ['Width', 'Color', 'Mesh'],
  'CIMinimumComponent': ['Image'],
  'CIMinimumCompositing': ['Image', 'Background Image'],
  'CIMix': ['Image', 'Background Image', 'Amount'],
  'CIModTransition': [
    'Image',
    'Target Image',
    'Center',
    'Time',
    'Angle',
    'Radius',
    'Compression'
  ],
  'CIMorphologyGradient': ['Image', 'Radius'],
  'CIMorphologyMaximum': ['Image', 'Radius'],
  'CIMorphologyMinimum': ['Image', 'Radius'],
  'CIMorphologyRectangleMaximum': ['Image', 'Width', 'Height'],
  'CIMorphologyRectangleMinimum': ['Image', 'Width', 'Height'],
  'CIMotionBlur': ['Image', 'Radius', 'Angle'],
  'CIMultiplyBlendMode': ['Image', 'Background Image'],
  'CIMultiplyCompositing': ['Image', 'Background Image'],
  'CINinePartStretched': ['Image', 'Breakpoint0', 'Breakpoint1', 'Grow Amount'],
  'CINinePartTiled': [
    'Image',
    'Breakpoint0',
    'Breakpoint1',
    'Grow Amount',
    'Flip Y Tiles'
  ],
  'CINoiseReduction': ['Image', 'Noise Level', 'Sharpness'],
  'CIOpTile': ['Image', 'Center', 'Scale', 'Angle', 'Width'],
  'CIOverlayBlendMode': ['Image', 'Background Image'],
  'CIPageCurlTransition': [
    'Image',
    'Target Image',
    'Backside Image',
    'Shading Image',
    'Extent',
    'Time',
    'Angle',
    'Radius'
  ],
  'CIPageCurlWithShadowTransition': [
    'Image',
    'Target Image',
    'Backside Image',
    'Extent',
    'Time',
    'Angle',
    'Radius',
    'Shadow Size',
    'Shadow Amount',
    'Shadow Extent'
  ],
  'CIPaletteCentroid': ['Image', 'Palette Image', 'Perceptual'],
  'CIPalettize': ['Image', 'Palette Image', 'Perceptual'],
  'CIParallelogramTile': ['Image', 'Center', 'Angle', 'Acute Angle', 'Width'],
  'CIPDF417BarcodeGenerator': [
    'Message',
    'Min Width',
    'Max Width',
    'Min Height',
    'Max Height',
    'Data Columns',
    'Rows',
    'Preferred Aspect Ratio',
    'Compaction Mode',
    'Compact Style',
    'Correction Level',
    'Always Specify Compaction'
  ],
  'CIPersonSegmentation': ['Image', 'Quality Level'],
  'CIPerspectiveCorrection': [
    'Image',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left',
    'Crop'
  ],
  'CIPerspectiveRotate': ['Image', 'Focal Length', 'Pitch', 'Yaw', 'Roll'],
  'CIPerspectiveTile': [
    'Image',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left'
  ],
  'CIPerspectiveTransform': [
    'Image',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left'
  ],
  'CIPerspectiveTransformWithExtent': [
    'Image',
    'Extent',
    'Top Left',
    'Top Right',
    'Bottom Right',
    'Bottom Left'
  ],
  'CIPhotoEffectChrome': ['Image'],
  'CIPhotoEffectFade': ['Image'],
  'CIPhotoEffectInstant': ['Image'],
  'CIPhotoEffectMono': ['Image'],
  'CIPhotoEffectNoir': ['Image'],
  'CIPhotoEffectProcess': ['Image'],
  'CIPhotoEffectTonal': ['Image'],
  'CIPhotoEffectTransfer': ['Image'],
  'CIPinchDistortion': ['Image', 'Center', 'Radius', 'Scale'],
  'CIPinLightBlendMode': ['Image', 'Background Image'],
  'CIPixellate': ['Image', 'Center', 'Scale'],
  'CIPointillize': ['Image', 'Radius', 'Center'],
  'CIQRCodeGenerator': ['Message', 'Correction Level'],
  'CIRadialGradient': ['Center', 'Radius 1', 'Radius 2', 'Color 1', 'Color 2'],
  'CIRandomGenerator': [],
  'CIRippleTransition': [
    'Image',
    'Target Image',
    'Shading Image',
    'Center',
    'Extent',
    'Time',
    'Width',
    'Scale'
  ],
  'CIRoundedRectangleGenerator': ['Extent', 'Radius', 'Color'],
  'CIRowAverage': ['Image', 'Extent'],
  'CISaliencyMapFilter': ['Image'],
  'CISampleNearest': ['Image'],
  'CISaturationBlendMode': ['Image', 'Background Image'],
  'CIScreenBlendMode': ['Image', 'Background Image'],
  'CISepiaTone': ['Image', 'Intensity'],
  'CIShadedMaterial': ['Image', 'Shading Image', 'Scale'],
  'CISharpenLuminance': ['Image', 'Sharpness', 'Radius'],
  'CISixfoldReflectedTile': ['Image', 'Center', 'Angle', 'Width'],
  'CISixfoldRotatedTile': ['Image', 'Center', 'Angle', 'Width'],
  'CISmoothLinearGradient': ['Point 0', 'Point 1', 'Color 1', 'Color 2'],
  'CISoftLightBlendMode': ['Image', 'Background Image'],
  'CISourceAtopCompositing': ['Image', 'Background Image'],
  'CISourceInCompositing': ['Image', 'Background Image'],
  'CISourceOutCompositing': ['Image', 'Background Image'],
  'CISourceOverCompositing': ['Image', 'Background Image'],
  'CISpotColor': [
    'Image',
    'Center Color 1',
    'Replacement Color 1',
    'Closeness 1',
    'Contrast 1',
    'Center Color 2',
    'Replacement Color 2',
    'Closeness 2',
    'Contrast 2',
    'Center Color 3',
    'Replacement Color 3',
    'Closeness 3',
    'Contrast 3'
  ],
  'CISpotLight': [
    'Image',
    'Light Position',
    'Light Points At',
    'Brightness',
    'Concentration',
    'Color'
  ],
  'CISRGBToneCurveToLinear': ['Image'],
  'CIStarShineGenerator': [
    'Center',
    'Color',
    'Radius',
    'Cross Scale',
    'Cross Angle',
    'Cross Opacity',
    'Cross Width',
    'Epsilon'
  ],
  'CIStraightenFilter': ['Image', 'Angle'],
  'CIStretchCrop': ['Image', 'Size', 'Crop Amount', 'Center Stretch Amount'],
  'CIStripesGenerator': ['Center', 'Color 1', 'Color 2', 'Width', 'Sharpness'],
  'CISubtractBlendMode': ['Image', 'Background Image'],
  'CISunbeamsGenerator': [
    'Center',
    'Color',
    'Sun Radius',
    'Maximum Striation Radius',
    'Striation Strength',
    'Striation Contrast',
    'Time'
  ],
  'CISwipeTransition': [
    'Image',
    'Target Image',
    'Extent',
    'Color',
    'Time',
    'Angle',
    'Width',
    'Opacity'
  ],
  'CITemperatureAndTint': ['Image', 'Neutral', 'Target Neutral'],
  'CITextImageGenerator': [
    'Text',
    'Font Name',
    'Font Size',
    'Scale Factor',
    'Padding'
  ],
  'CIThermal': ['Image'],
  'CIToneCurve': [
    'Image',
    'Point 0',
    'Point 1',
    'Point 2',
    'Point 3',
    'Point 4'
  ],
  'CITorusLensDistortion': ['Image', 'Center', 'Radius', 'Width', 'Refraction'],
  'CITriangleKaleidoscope': ['Image', 'Point', 'Size', 'Rotation', 'Decay'],
  'CITriangleTile': ['Image', 'Center', 'Angle', 'Width'],
  'CITwelvefoldReflectedTile': ['Image', 'Center', 'Angle', 'Width'],
  'CITwirlDistortion': ['Image', 'Center', 'Radius', 'Angle'],
  'CIUnsharpMask': ['Image', 'Radius', 'Intensity'],
  'CIVibrance': ['Image', 'Amount'],
  'CIVignette': ['Image', 'Intensity', 'Radius'],
  'CIVignetteEffect': ['Image', 'Center', 'Radius', 'Intensity', 'Falloff'],
  'CIVividLightBlendMode': ['Image', 'Background Image'],
  'CIVortexDistortion': ['Image', 'Center', 'Radius', 'Angle'],
  'CIWhitePointAdjust': ['Image', 'Color'],
  'CIXRay': ['Image'],
  'CIZoomBlur': ['Image', 'Center', 'Amount'],
};
