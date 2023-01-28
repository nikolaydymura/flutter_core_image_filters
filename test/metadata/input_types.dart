/*
        let items = CIFilter.filterNames(inCategory: nil).map { name in
            let filter = CIFilter(name: name)!
            let defaults = filter.inputKeys.map { key in
                let input = filter.attributes[key] as! [String: Any]
                let type = input["CIAttributeType"]
                return "'\(key)': '\(type ?? "")'"
            }.flatMap { $0 }.joined(separator: ",")

            return "'\(name)': {\(defaults)}"
        }
        print(items.joined(separator: ",\n"))
 */

const Map<String, Map<String, String>> kInputTypes = {
  'CIAccordionFoldTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputBottomHeight': 'CIAttributeTypeDistance',
    'inputNumberOfFolds': 'CIAttributeTypeScalar',
    'inputFoldShadowAmount': 'CIAttributeTypeScalar',
    'inputTime': 'CIAttributeTypeTime'
  },
  'CIAdditionCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIAffineClamp': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTransform': 'CIAttributeTypeTransform'
  },
  'CIAffineTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTransform': 'CIAttributeTypeTransform'
  },
  'CIAffineTransform': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTransform': 'CIAttributeTypeTransform'
  },
  'CIAreaAverage': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAreaHistogram': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputScale': 'CIAttributeTypeScalar',
    'inputCount': 'CIAttributeTypeScalar'
  },
  'CIAreaLogarithmicHistogram': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputScale': 'CIAttributeTypeScalar',
    'inputCount': 'CIAttributeTypeScalar',
    'inputMinimumStop': 'CIAttributeTypeScalar',
    'inputMaximumStop': 'CIAttributeTypeScalar'
  },
  'CIAreaMaximum': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAreaMaximumAlpha': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAreaMinimum': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAreaMinimumAlpha': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAreaMinMax': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAreaMinMaxRed': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIAttributedTextImageGenerator': {
    'inputText': '',
    'inputScaleFactor': 'CIAttributeTypeScalar',
    'inputPadding': 'CIAttributeTypeInteger'
  },
  'CIAztecCodeGenerator': {
    'inputMessage': '',
    'inputCorrectionLevel': 'CIAttributeTypeInteger',
    'inputLayers': 'CIAttributeTypeInteger',
    'inputCompactStyle': 'CIAttributeTypeBoolean'
  },
  'CIBarcodeGenerator': {'inputBarcodeDescriptor': ''},
  'CIBarsSwipeTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputBarOffset': 'CIAttributeTypeScalar',
    'inputTime': 'CIAttributeTypeTime'
  },
  'CIBicubicScaleTransform': {
    'inputImage': 'CIAttributeTypeImage',
    'inputScale': 'CIAttributeTypeScalar',
    'inputAspectRatio': 'CIAttributeTypeScalar',
    'inputB': 'CIAttributeTypeScalar',
    'inputC': 'CIAttributeTypeScalar'
  },
  'CIBlendWithAlphaMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage',
    'inputMaskImage': 'CIAttributeTypeImage'
  },
  'CIBlendWithBlueMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage',
    'inputMaskImage': 'CIAttributeTypeImage'
  },
  'CIBlendWithMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage',
    'inputMaskImage': 'CIAttributeTypeImage'
  },
  'CIBlendWithRedMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage',
    'inputMaskImage': 'CIAttributeTypeImage'
  },
  'CIBloom': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIBokehBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputRingAmount': 'CIAttributeTypeScalar',
    'inputRingSize': 'CIAttributeTypeScalar',
    'inputSoftness': 'CIAttributeTypeScalar'
  },
  'CIBoxBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIBumpDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputScale': 'CIAttributeTypeScalar'
  },
  'CIBumpDistortionLinear': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputScale': 'CIAttributeTypeScalar'
  },
  'CICameraCalibrationLensCorrection': {
    'inputImage': 'CIAttributeTypeImage',
    'inputAVCameraCalibrationData': '',
    'inputUseInverseLookUpTable': 'CIAttributeTypeBoolean'
  },
  'CICheckerboardGenerator': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CICircleSplashDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CICircularScreen': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CICircularWrap': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIClamp': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CICMYKHalftone': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputSharpness': 'CIAttributeTypeDistance',
    'inputGCR': 'CIAttributeTypeScalar',
    'inputUCR': 'CIAttributeTypeScalar'
  },
  'CICode128BarcodeGenerator': {
    'inputMessage': '',
    'inputQuietSpace': 'CIAttributeTypeInteger',
    'inputBarcodeHeight': 'CIAttributeTypeInteger'
  },
  'CIColorAbsoluteDifference': {
    'inputImage': 'CIAttributeTypeImage',
    'inputImage2': 'CIAttributeTypeImage'
  },
  'CIColorBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIColorBurnBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIColorClamp': {
    'inputImage': 'CIAttributeTypeImage',
    'inputMinComponents': '',
    'inputMaxComponents': ''
  },
  'CIColorControls': {
    'inputImage': 'CIAttributeTypeImage',
    'inputSaturation': 'CIAttributeTypeScalar',
    'inputBrightness': 'CIAttributeTypeScalar',
    'inputContrast': 'CIAttributeTypeScalar'
  },
  'CIColorCrossPolynomial': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRedCoefficients': '',
    'inputGreenCoefficients': '',
    'inputBlueCoefficients': ''
  },
  'CIColorCube': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCubeDimension': 'CIAttributeTypeCount',
    'inputCubeData': '',
    'inputExtrapolate': 'CIAttributeTypeBoolean'
  },
  'CIColorCubesMixedWithMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputMaskImage': 'CIAttributeTypeImage',
    'inputCubeDimension': 'CIAttributeTypeCount',
    'inputCube0Data': '',
    'inputCube1Data': '',
    'inputColorSpace': '',
    'inputExtrapolate': 'CIAttributeTypeBoolean'
  },
  'CIColorCubeWithColorSpace': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCubeDimension': 'CIAttributeTypeCount',
    'inputCubeData': '',
    'inputExtrapolate': '',
    'inputColorSpace': ''
  },
  'CIColorCurves': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCurvesData': '',
    'inputCurvesDomain': '',
    'inputColorSpace': ''
  },
  'CIColorDodgeBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIColorInvert': {'inputImage': 'CIAttributeTypeImage'},
  'CIColorMap': {
    'inputImage': 'CIAttributeTypeImage',
    'inputGradientImage': 'CIAttributeTypeGradient'
  },
  'CIColorMatrix': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRVector': '',
    'inputGVector': '',
    'inputBVector': '',
    'inputAVector': '',
    'inputBiasVector': ''
  },
  'CIColorMonochrome': {
    'inputImage': 'CIAttributeTypeImage',
    'inputColor': 'CIAttributeTypeOpaqueColor',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIColorPolynomial': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRedCoefficients': '',
    'inputGreenCoefficients': '',
    'inputBlueCoefficients': '',
    'inputAlphaCoefficients': ''
  },
  'CIColorPosterize': {
    'inputImage': 'CIAttributeTypeImage',
    'inputLevels': 'CIAttributeTypeScalar'
  },
  'CIColorThreshold': {
    'inputImage': 'CIAttributeTypeImage',
    'inputThreshold': 'CIAttributeTypeScalar'
  },
  'CIColorThresholdOtsu': {'inputImage': 'CIAttributeTypeImage'},
  'CIColumnAverage': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CIComicEffect': {'inputImage': 'CIAttributeTypeImage'},
  'CIConstantColorGenerator': {'inputColor': 'CIAttributeTypeColor'},
  'CIConvertLabToRGB': {
    'inputImage': 'CIAttributeTypeImage',
    'inputNormalize': 'CIAttributeTypeBoolean'
  },
  'CIConvertRGBtoLab': {
    'inputImage': 'CIAttributeTypeImage',
    'inputNormalize': 'CIAttributeTypeBoolean'
  },
  'CIConvolution3X3': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolution5X5': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolution7X7': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolution9Horizontal': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolution9Vertical': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolutionRGB3X3': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolutionRGB5X5': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolutionRGB7X7': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolutionRGB9Horizontal': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CIConvolutionRGB9Vertical': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWeights': '',
    'inputBias': 'CIAttributeTypeScalar'
  },
  'CICopyMachineTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputColor': 'CIAttributeTypeOpaqueColor',
    'inputTime': 'CIAttributeTypeTime',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputOpacity': 'CIAttributeTypeScalar'
  },
  'CICoreMLModelFilter': {
    'inputImage': 'CIAttributeTypeImage',
    'inputModel': '',
    'inputHeadIndex': 'CIAttributeTypeInteger',
    'inputSoftmaxNormalization': 'CIAttributeTypeBoolean'
  },
  'CICrop': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRectangle': 'CIAttributeTypeRectangle'
  },
  'CICrystallize': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputCenter': 'CIAttributeTypePosition'
  },
  'CIDarkenBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIDepthBlurEffect': {
    'inputImage': 'CIAttributeTypeImage',
    'inputDisparityImage': 'CIAttributeTypeImage',
    'inputMatteImage': 'CIAttributeTypeImage',
    'inputHairImage': 'CIAttributeTypeImage',
    'inputGlassesImage': 'CIAttributeTypeImage',
    'inputGainMap': 'CIAttributeTypeImage',
    'inputAperture': 'CIAttributeTypeScalar',
    'inputLeftEyePositions': 'CIAttributeTypePosition',
    'inputRightEyePositions': 'CIAttributeTypePosition',
    'inputChinPositions': 'CIAttributeTypePosition',
    'inputNosePositions': 'CIAttributeTypePosition',
    'inputFocusRect': 'CIAttributeTypeRectangle',
    'inputLumaNoiseScale': 'CIAttributeTypeScalar',
    'inputScaleFactor': 'CIAttributeTypeScalar',
    'inputCalibrationData': '',
    'inputAuxDataMetadata': '',
    'inputShape': ''
  },
  'CIDepthOfField': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPoint0': 'CIAttributeTypePosition',
    'inputPoint1': 'CIAttributeTypePosition',
    'inputSaturation': 'CIAttributeTypeScalar',
    'inputUnsharpMaskRadius': 'CIAttributeTypeScalar',
    'inputUnsharpMaskIntensity': 'CIAttributeTypeScalar',
    'inputRadius': 'CIAttributeTypeScalar'
  },
  'CIDepthToDisparity': {'inputImage': 'CIAttributeTypeImage'},
  'CIDifferenceBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIDiscBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIDisintegrateWithMaskTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputMaskImage': 'CIAttributeTypeImage',
    'inputTime': 'CIAttributeTypeTime',
    'inputShadowRadius': 'CIAttributeTypeDistance',
    'inputShadowDensity': 'CIAttributeTypeScalar',
    'inputShadowOffset': 'CIAttributeTypeOffset'
  },
  'CIDisparityToDepth': {'inputImage': 'CIAttributeTypeImage'},
  'CIDisplacementDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputDisplacementImage': 'CIAttributeTypeImage',
    'inputScale': 'CIAttributeTypeDistance'
  },
  'CIDissolveTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputTime': 'CIAttributeTypeTime'
  },
  'CIDither': {
    'inputImage': 'CIAttributeTypeImage',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIDivideBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIDocumentEnhancer': {
    'inputImage': 'CIAttributeTypeImage',
    'inputAmount': 'CIAttributeTypeScalar'
  },
  'CIDotScreen': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CIDroste': {
    'inputImage': 'CIAttributeTypeImage',
    'inputInsetPoint0': 'CIAttributeTypePosition',
    'inputInsetPoint1': 'CIAttributeTypePosition',
    'inputStrands': 'CIAttributeTypeScalar',
    'inputPeriodicity': 'CIAttributeTypeScalar',
    'inputRotation': 'CIAttributeTypeAngle',
    'inputZoom': 'CIAttributeTypeScalar'
  },
  'CIEdgePreserveUpsampleFilter': {
    'inputImage': 'CIAttributeTypeImage',
    'inputSmallImage': 'CIAttributeTypeImage',
    'inputSpatialSigma': 'CIAttributeTypeScalar',
    'inputLumaSigma': 'CIAttributeTypeScalar'
  },
  'CIEdges': {
    'inputImage': 'CIAttributeTypeImage',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIEdgeWork': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIEightfoldReflectedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CIExclusionBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIExposureAdjust': {
    'inputImage': 'CIAttributeTypeImage',
    'inputEV': 'CIAttributeTypeScalar'
  },
  'CIFalseColor': {
    'inputImage': 'CIAttributeTypeImage',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor'
  },
  'CIFlashTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputColor': 'CIAttributeTypeColor',
    'inputTime': 'CIAttributeTypeTime',
    'inputMaxStriationRadius': 'CIAttributeTypeScalar',
    'inputStriationStrength': 'CIAttributeTypeScalar',
    'inputStriationContrast': 'CIAttributeTypeScalar',
    'inputFadeThreshold': 'CIAttributeTypeScalar'
  },
  'CIFourfoldReflectedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputAcuteAngle': 'CIAttributeTypeAngle'
  },
  'CIFourfoldRotatedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CIFourfoldTranslatedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputAcuteAngle': 'CIAttributeTypeAngle'
  },
  'CIGaborGradients': {'inputImage': 'CIAttributeTypeImage'},
  'CIGammaAdjust': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPower': 'CIAttributeTypeScalar'
  },
  'CIGaussianBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeScalar'
  },
  'CIGaussianGradient': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIGlassDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTexture': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputScale': 'CIAttributeTypeDistance'
  },
  'CIGlassLozenge': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPoint0': 'CIAttributeTypePosition',
    'inputPoint1': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputRefraction': 'CIAttributeTypeScalar'
  },
  'CIGlideReflectedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CIGloom': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIGuidedFilter': {
    'inputImage': 'CIAttributeTypeImage',
    'inputGuideImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeScalar',
    'inputEpsilon': 'CIAttributeTypeScalar'
  },
  'CIHardLightBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIHatchedScreen': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CIHeightFieldFromMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIHexagonalPixellate': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputScale': 'CIAttributeTypeDistance'
  },
  'CIHighlightShadowAdjust': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeScalar',
    'inputShadowAmount': 'CIAttributeTypeScalar',
    'inputHighlightAmount': 'CIAttributeTypeScalar'
  },
  'CIHistogramDisplayFilter': {
    'inputImage': 'CIAttributeTypeImage',
    'inputHeight': 'CIAttributeTypeScalar',
    'inputHighLimit': 'CIAttributeTypeScalar',
    'inputLowLimit': 'CIAttributeTypeScalar'
  },
  'CIHoleDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIHueAdjust': {
    'inputImage': 'CIAttributeTypeImage',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIHueBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIHueSaturationValueGradient': {
    'inputValue': 'CIAttributeTypeScalar',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputSoftness': 'CIAttributeTypeScalar',
    'inputDither': 'CIAttributeTypeScalar',
    'inputColorSpace': ''
  },
  'CIKaleidoscope': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCount': 'CIAttributeTypeScalar',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIKeystoneCorrectionCombined': {
    'inputImage': 'CIAttributeTypeImage',
    'inputFocalLength': 'CIAttributeTypeScalar',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition'
  },
  'CIKeystoneCorrectionHorizontal': {
    'inputImage': 'CIAttributeTypeImage',
    'inputFocalLength': 'CIAttributeTypeScalar',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition'
  },
  'CIKeystoneCorrectionVertical': {
    'inputImage': 'CIAttributeTypeImage',
    'inputFocalLength': 'CIAttributeTypeScalar',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition'
  },
  'CIKMeans': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputMeans': 'CIAttributeTypeImage',
    'inputCount': 'CIAttributeTypeCount',
    'inputPasses': 'CIAttributeTypeCount',
    'inputPerceptual': 'CIAttributeTypeBoolean'
  },
  'CILabDeltaE': {
    'inputImage': 'CIAttributeTypeImage',
    'inputImage2': 'CIAttributeTypeImage'
  },
  'CILanczosScaleTransform': {
    'inputImage': 'CIAttributeTypeImage',
    'inputScale': 'CIAttributeTypeScalar',
    'inputAspectRatio': 'CIAttributeTypeScalar'
  },
  'CILenticularHaloGenerator': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputColor': 'CIAttributeTypeColor',
    'inputHaloRadius': 'CIAttributeTypeDistance',
    'inputHaloWidth': 'CIAttributeTypeDistance',
    'inputHaloOverlap': 'CIAttributeTypeScalar',
    'inputStriationStrength': 'CIAttributeTypeScalar',
    'inputStriationContrast': 'CIAttributeTypeScalar',
    'inputTime': 'CIAttributeTypeScalar'
  },
  'CILightenBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CILightTunnel': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRotation': 'CIAttributeTypeAngle',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CILinearBurnBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CILinearDodgeBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CILinearGradient': {
    'inputPoint0': 'CIAttributeTypePosition',
    'inputPoint1': 'CIAttributeTypePosition',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor'
  },
  'CILinearLightBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CILinearToSRGBToneCurve': {'inputImage': 'CIAttributeTypeImage'},
  'CILineOverlay': {
    'inputImage': 'CIAttributeTypeImage',
    'inputNRNoiseLevel': 'CIAttributeTypeScalar',
    'inputNRSharpness': 'CIAttributeTypeScalar',
    'inputEdgeIntensity': 'CIAttributeTypeScalar',
    'inputThreshold': 'CIAttributeTypeScalar',
    'inputContrast': 'CIAttributeTypeScalar'
  },
  'CILineScreen': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CILuminosityBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIMaskedVariableBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputMask': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeScalar'
  },
  'CIMaskToAlpha': {'inputImage': 'CIAttributeTypeImage'},
  'CIMaximumComponent': {'inputImage': 'CIAttributeTypeImage'},
  'CIMaximumCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIMedianFilter': {'inputImage': 'CIAttributeTypeImage'},
  'CIMeshGenerator': {
    'inputWidth': 'CIAttributeTypeDistance',
    'inputColor': 'CIAttributeTypeColor',
    'inputMesh': ''
  },
  'CIMinimumComponent': {'inputImage': 'CIAttributeTypeImage'},
  'CIMinimumCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIMix': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage',
    'inputAmount': 'CIAttributeTypeScalar'
  },
  'CIModTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputTime': 'CIAttributeTypeTime',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputCompression': 'CIAttributeTypeDistance'
  },
  'CIMorphologyGradient': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIMorphologyMaximum': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIMorphologyMinimum': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIMorphologyRectangleMaximum': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWidth': 'CIAttributeTypeInteger',
    'inputHeight': 'CIAttributeTypeInteger'
  },
  'CIMorphologyRectangleMinimum': {
    'inputImage': 'CIAttributeTypeImage',
    'inputWidth': 'CIAttributeTypeInteger',
    'inputHeight': 'CIAttributeTypeInteger'
  },
  'CIMotionBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIMultiplyBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIMultiplyCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CINinePartStretched': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBreakpoint0': 'CIAttributeTypePosition',
    'inputBreakpoint1': 'CIAttributeTypePosition',
    'inputGrowAmount': 'CIAttributeTypeOffset'
  },
  'CINinePartTiled': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBreakpoint0': 'CIAttributeTypePosition',
    'inputBreakpoint1': 'CIAttributeTypePosition',
    'inputGrowAmount': 'CIAttributeTypeOffset',
    'inputFlipYTiles': 'CIAttributeTypeBoolean'
  },
  'CINoiseReduction': {
    'inputImage': 'CIAttributeTypeImage',
    'inputNoiseLevel': 'CIAttributeTypeScalar',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CIOpTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputScale': 'CIAttributeTypeScalar',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CIOverlayBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIPageCurlTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputBacksideImage': 'CIAttributeTypeImage',
    'inputShadingImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputTime': 'CIAttributeTypeTime',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputRadius': 'CIAttributeTypeDistance'
  },
  'CIPageCurlWithShadowTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputBacksideImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputTime': 'CIAttributeTypeTime',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputShadowSize': 'CIAttributeTypeDistance',
    'inputShadowAmount': 'CIAttributeTypeDistance',
    'inputShadowExtent': 'CIAttributeTypeRectangle'
  },
  'CIPaletteCentroid': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPaletteImage': 'CIAttributeTypeImage',
    'inputPerceptual': 'CIAttributeTypeBoolean'
  },
  'CIPalettize': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPaletteImage': 'CIAttributeTypeImage',
    'inputPerceptual': 'CIAttributeTypeBoolean'
  },
  'CIParallelogramTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputAcuteAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CIPDF417BarcodeGenerator': {
    'inputMessage': '',
    'inputMinWidth': 'CIAttributeTypeInteger',
    'inputMaxWidth': 'CIAttributeTypeInteger',
    'inputMinHeight': 'CIAttributeTypeInteger',
    'inputMaxHeight': 'CIAttributeTypeInteger',
    'inputDataColumns': 'CIAttributeTypeInteger',
    'inputRows': 'CIAttributeTypeInteger',
    'inputPreferredAspectRatio': '',
    'inputCompactionMode': 'CIAttributeTypeInteger',
    'inputCompactStyle': 'CIAttributeTypeBoolean',
    'inputCorrectionLevel': 'CIAttributeTypeInteger',
    'inputAlwaysSpecifyCompaction': 'CIAttributeTypeBoolean'
  },
  'CIPersonSegmentation': {
    'inputImage': 'CIAttributeTypeImage',
    'inputQualityLevel': ''
  },
  'CIPerspectiveCorrection': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition',
    'inputCrop': 'CIAttributeTypeBoolean'
  },
  'CIPerspectiveRotate': {
    'inputImage': 'CIAttributeTypeImage',
    'inputFocalLength': 'CIAttributeTypeScalar',
    'inputPitch': 'CIAttributeTypeAngle',
    'inputYaw': 'CIAttributeTypeAngle',
    'inputRoll': 'CIAttributeTypeAngle'
  },
  'CIPerspectiveTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition'
  },
  'CIPerspectiveTransform': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition'
  },
  'CIPerspectiveTransformWithExtent': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputTopLeft': 'CIAttributeTypePosition',
    'inputTopRight': 'CIAttributeTypePosition',
    'inputBottomRight': 'CIAttributeTypePosition',
    'inputBottomLeft': 'CIAttributeTypePosition'
  },
  'CIPhotoEffectChrome': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectFade': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectInstant': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectMono': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectNoir': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectProcess': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectTonal': {'inputImage': 'CIAttributeTypeImage'},
  'CIPhotoEffectTransfer': {'inputImage': 'CIAttributeTypeImage'},
  'CIPinchDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputScale': 'CIAttributeTypeScalar'
  },
  'CIPinLightBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIPixellate': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputScale': 'CIAttributeTypeDistance'
  },
  'CIPointillize': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputCenter': 'CIAttributeTypePosition'
  },
  'CIQRCodeGenerator': {'inputMessage': '', 'inputCorrectionLevel': ''},
  'CIRadialGradient': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius0': 'CIAttributeTypeDistance',
    'inputRadius1': 'CIAttributeTypeDistance',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor'
  },
  'CIRandomGenerator': {},
  'CIRippleTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputShadingImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputTime': 'CIAttributeTypeTime',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputScale': 'CIAttributeTypeScalar'
  },
  'CIRoundedRectangleGenerator': {
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputColor': 'CIAttributeTypeColor'
  },
  'CIRowAverage': {
    'inputImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle'
  },
  'CISaliencyMapFilter': {'inputImage': 'CIAttributeTypeImage'},
  'CISampleNearest': {'inputImage': 'CIAttributeTypeImage'},
  'CISaturationBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIScreenBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISepiaTone': {
    'inputImage': 'CIAttributeTypeImage',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIShadedMaterial': {
    'inputImage': 'CIAttributeTypeImage',
    'inputShadingImage': 'CIAttributeTypeImage',
    'inputScale': 'CIAttributeTypeDistance'
  },
  'CISharpenLuminance': {
    'inputImage': 'CIAttributeTypeImage',
    'inputSharpness': 'CIAttributeTypeScalar',
    'inputRadius': 'CIAttributeTypeScalar'
  },
  'CISixfoldReflectedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CISixfoldRotatedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CISmoothLinearGradient': {
    'inputPoint0': 'CIAttributeTypePosition',
    'inputPoint1': 'CIAttributeTypePosition',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor'
  },
  'CISoftLightBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISourceAtopCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISourceInCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISourceOutCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISourceOverCompositing': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISpotColor': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenterColor1': 'CIAttributeTypeColor',
    'inputReplacementColor1': 'CIAttributeTypeColor',
    'inputCloseness1': 'CIAttributeTypeScalar',
    'inputContrast1': 'CIAttributeTypeScalar',
    'inputCenterColor2': 'CIAttributeTypeColor',
    'inputReplacementColor2': 'CIAttributeTypeColor',
    'inputCloseness2': 'CIAttributeTypeScalar',
    'inputContrast2': 'CIAttributeTypeScalar',
    'inputCenterColor3': 'CIAttributeTypeColor',
    'inputReplacementColor3': 'CIAttributeTypeColor',
    'inputCloseness3': 'CIAttributeTypeScalar',
    'inputContrast3': 'CIAttributeTypeScalar'
  },
  'CISpotLight': {
    'inputImage': 'CIAttributeTypeImage',
    'inputLightPosition': 'CIAttributeTypePosition3',
    'inputLightPointsAt': 'CIAttributeTypePosition3',
    'inputBrightness': 'CIAttributeTypeDistance',
    'inputConcentration': 'CIAttributeTypeScalar',
    'inputColor': 'CIAttributeTypeOpaqueColor'
  },
  'CISRGBToneCurveToLinear': {'inputImage': 'CIAttributeTypeImage'},
  'CIStarShineGenerator': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputColor': 'CIAttributeTypeColor',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputCrossScale': 'CIAttributeTypeScalar',
    'inputCrossAngle': 'CIAttributeTypeAngle',
    'inputCrossOpacity': 'CIAttributeTypeScalar',
    'inputCrossWidth': 'CIAttributeTypeDistance',
    'inputEpsilon': 'CIAttributeTypeScalar'
  },
  'CIStraightenFilter': {
    'inputImage': 'CIAttributeTypeImage',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIStretchCrop': {
    'inputImage': 'CIAttributeTypeImage',
    'inputSize': 'CIAttributeTypePosition',
    'inputCropAmount': 'CIAttributeTypeScalar',
    'inputCenterStretchAmount': 'CIAttributeTypeScalar'
  },
  'CIStripesGenerator': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputColor0': 'CIAttributeTypeColor',
    'inputColor1': 'CIAttributeTypeColor',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputSharpness': 'CIAttributeTypeScalar'
  },
  'CISubtractBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CISunbeamsGenerator': {
    'inputCenter': 'CIAttributeTypePosition',
    'inputColor': 'CIAttributeTypeColor',
    'inputSunRadius': 'CIAttributeTypeDistance',
    'inputMaxStriationRadius': 'CIAttributeTypeScalar',
    'inputStriationStrength': 'CIAttributeTypeScalar',
    'inputStriationContrast': 'CIAttributeTypeScalar',
    'inputTime': 'CIAttributeTypeScalar'
  },
  'CISwipeTransition': {
    'inputImage': 'CIAttributeTypeImage',
    'inputTargetImage': 'CIAttributeTypeImage',
    'inputExtent': 'CIAttributeTypeRectangle',
    'inputColor': 'CIAttributeTypeOpaqueColor',
    'inputTime': 'CIAttributeTypeTime',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputOpacity': 'CIAttributeTypeScalar'
  },
  'CITemperatureAndTint': {
    'inputImage': 'CIAttributeTypeImage',
    'inputNeutral': 'CIAttributeTypeOffset',
    'inputTargetNeutral': 'CIAttributeTypeOffset'
  },
  'CITextImageGenerator': {
    'inputText': '',
    'inputFontName': '',
    'inputFontSize': 'CIAttributeTypeScalar',
    'inputScaleFactor': 'CIAttributeTypeScalar',
    'inputPadding': 'CIAttributeTypeInteger'
  },
  'CIThermal': {'inputImage': 'CIAttributeTypeImage'},
  'CIToneCurve': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPoint0': 'CIAttributeTypeOffset',
    'inputPoint1': 'CIAttributeTypeOffset',
    'inputPoint2': 'CIAttributeTypeOffset',
    'inputPoint3': 'CIAttributeTypeOffset',
    'inputPoint4': 'CIAttributeTypeOffset'
  },
  'CITorusLensDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputWidth': 'CIAttributeTypeDistance',
    'inputRefraction': 'CIAttributeTypeScalar'
  },
  'CITriangleKaleidoscope': {
    'inputImage': 'CIAttributeTypeImage',
    'inputPoint': 'CIAttributeTypePosition',
    'inputSize': 'CIAttributeTypeScalar',
    'inputRotation': 'CIAttributeTypeAngle',
    'inputDecay': 'CIAttributeTypeScalar'
  },
  'CITriangleTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CITwelvefoldReflectedTile': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAngle': 'CIAttributeTypeAngle',
    'inputWidth': 'CIAttributeTypeDistance'
  },
  'CITwirlDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIUnsharpMask': {
    'inputImage': 'CIAttributeTypeImage',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputIntensity': 'CIAttributeTypeScalar'
  },
  'CIVibrance': {
    'inputImage': 'CIAttributeTypeImage',
    'inputAmount': 'CIAttributeTypeScalar'
  },
  'CIVignette': {
    'inputImage': 'CIAttributeTypeImage',
    'inputIntensity': 'CIAttributeTypeScalar',
    'inputRadius': 'CIAttributeTypeScalar'
  },
  'CIVignetteEffect': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputIntensity': 'CIAttributeTypeScalar',
    'inputFalloff': 'CIAttributeTypeScalar'
  },
  'CIVividLightBlendMode': {
    'inputImage': 'CIAttributeTypeImage',
    'inputBackgroundImage': 'CIAttributeTypeImage'
  },
  'CIVortexDistortion': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputRadius': 'CIAttributeTypeDistance',
    'inputAngle': 'CIAttributeTypeAngle'
  },
  'CIWhitePointAdjust': {
    'inputImage': 'CIAttributeTypeImage',
    'inputColor': 'CIAttributeTypeColor'
  },
  'CIXRay': {'inputImage': 'CIAttributeTypeImage'},
  'CIZoomBlur': {
    'inputImage': 'CIAttributeTypeImage',
    'inputCenter': 'CIAttributeTypePosition',
    'inputAmount': 'CIAttributeTypeDistance'
  }
};
