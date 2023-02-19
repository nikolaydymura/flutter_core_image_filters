//
//  ApprovedFilters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 13.02.2023.
//

import Foundation
import CoreImage

let approvedFilters: [FilterItem] = [    FilterItem(filterName: "CIConvolution3X3",
                                                    values: [
                                                        "inputBias": 0.5,
                                                        "inputWeights" : CIVector(values: [1, 0, 0, 0, 1, 0, 0, 0, 0], count: 9)
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolution5X5",
                                                    values: [
                                                        "inputBias": 0.5,
                                                        "inputWeights" : CIVector(values: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 25)
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaAverage",
                                                    values: [
                                                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 1800, height: 1075))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaMinimum",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaMaximum",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 10, height: 10))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaMinimumAlpha",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaMaximumAlpha",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaMinMaxRed",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
                                                    ]
                                                   ),
                                         
                                         FilterItem(filterName: "CIAreaMinMax",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CITwirlDistortion",
                                                    values: [
                                                     "inputAngle": 6.23,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputRadius": 250
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolution7X7",
                                                    values: [
                                                     "inputBias": 0.5,
                                                     "inputWeights" : CIVector(values: [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 49)
                                                    ]
                                                   ),
                                         FilterItem(
                                             filterName: "CIBumpDistortionLinear",
                                             values: [
                                                 "inputCenter" : CIVector(cgPoint: CGPoint(x: 750.0, y: 750.0)),
                                                 "inputRadius" : 550,
                                                 "inputScale": 0.75,
                                                 "inputAngle": 5.14
                                             ]),
                                         FilterItem(
                                             filterName: "CIBumpDistortion",
                                             values: [
                                                 "inputCenter" : CIVector(cgPoint: CGPoint(x: 75.0, y: 75.0)),
                                                 "inputRadius" : 300,
                                                 "inputScale": 0.75,
                                             ]),
                                         FilterItem(
                                             filterName: "CICircularScreen", values: [
                                                 "inputCenter": CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                 "inputSharpness": 0.5,
                                                 "inputWidth": 25,
                                             ]
                                         ),
                                         FilterItem(
                                             filterName: "CICircleSplashDistortion",
                                           values: [
                                             "inputCenter": CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                             "inputRadius": 450
                                           ]
                                         ),
                                         FilterItem(filterName: "CICircularWrap", values: [
                                             "inputCenter" : CIVector(cgPoint: CGPoint(x: 150.0, y: 150.0)),
                                             "inputRadius" : 300,
                                             "inputAngle": 3.14,
                                         ]
                                         ),
                                         FilterItem(filterName: "CIClamp",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 100, y: 100, width: 320, height: 40)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIColorCrossPolynomial", values: [
                                             "inputRedCoefficients" : CIVector(values: [1, 1, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                                             "inputGreenCoefficients" : CIVector(values: [0, 1, 0, 0, 0, 0, 0, 0, 0, 0], count: 10),
                                             "inputBlueCoefficients" : CIVector(values: [1, 0, 1, 0, 0, 0, 0, 0, 0, 0], count: 10)
                                         ]),
                                         FilterItem(filterName: "CIColorMatrix", values: [
                                             "inputGVector" : CIVector(values: [0, 1, 0, 0], count: 4),
                                             "inputBiasVector" : CIVector(values: [0, 0, 0, 0], count: 4),
                                             "inputRVector" : CIVector(values: [1, 1, 0, 0], count: 4),
                                             "inputAVector" : CIVector(values: [0, 0, 0, 1], count: 4),
                                             "inputBVector" : CIVector(values: [1, 0, 1, 0], count: 4)
                                         ]),
                                         FilterItem(filterName: "CIColorPolynomial", values: [
                                             "inputRedCoefficients" : CIVector(values: [1, 1, 0, 0], count: 4),
                                             "inputGreenCoefficients" : CIVector(values: [1, 1, 0, 0], count: 4),
                                             "inputAlphaCoefficients" : CIVector(values: [0, 1, 0, 0], count: 4),
                                             "inputBlueCoefficients" : CIVector(values: [0, 1, 0, 0], count: 4),
                                         ]),
                                         FilterItem(filterName: "CIVortexDistortion", values: [
                                             "inputAngle": 48,
                                             "inputCenter": CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputRadius": 400
                                         ]),
                                         FilterItem(filterName: "CIVignetteEffect", values: [
                                             "inputFalloff": 0.5,
                                             "inputIntensity": 1,
                                             "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputRadius": 1000,
                                         ]),
                                         FilterItem(filterName: "CIPixellate", values: [
                                             "inputCenter" : CIVector(cgPoint: CGPoint(x: 80, y: 80)),
                                             "inputScale" : 50,
                                         ]),
                                         FilterItem(filterName: "CITriangleTile", values: [
                                             "inputCenter": CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputAngle": 3.14,
                                             "inputWidth": 100,
                                         ]),
                                         FilterItem(filterName: "CITriangleKaleidoscope", values: [
                                             "inputDecay": 0.5,
                                             "inputPoint" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputRotation": 3.14,
                                             "inputSize": 500,
                                         ]),
                                         FilterItem(filterName: "CITwelvefoldReflectedTile", values: [
                                             "inputAngle": 3.14,
                                             "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputWidth": 100,
                                         ]),
                                         FilterItem(filterName: "CIAreaHistogram",
                                                    values: [
                                                     "inputScale" : 0.9,
                                                     "inputCount" : 3,
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 500, y: 500, width: 100, height: 100)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIAreaLogarithmicHistogram",
                                                    values: [
                                                     "inputMinimumStop" : -10,
                                                     "inputMaximumStop" : 4,
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 500, y: 500, width: 100, height: 100)),
                                                     "inputCount" : 3,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIBicubicScaleTransform", values: [
                                             "inputB": 0.25,
                                             "inputScale": 0.9,
                                             "inputC": 0.9,
                                             "inputAspectRatio":0.7,
                                         ]),
                                         FilterItem(filterName: "CIColumnAverage",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 500, y: 500, width: 20, height: 40))
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolutionRGB5X5",
                                                    values: [
                                                     "inputBias" : 0.5,
                                                     "inputWeights" : CIVector(values: [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 25),
                                                    ]
                                                   ),

                                         FilterItem(filterName: "CIConvolutionRGB3X3",
                                                    values: [
                                                     "inputBias" : 0.5,
                                                     "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIDroste",
                                                    values: [
                                                     "inputInsetPoint0" : CIVector(cgPoint: CGPoint(x: 150, y: 300)),
                                                     "inputStrands" : 2,
                                                     "inputInsetPoint1" : CIVector(cgPoint: CGPoint(x: 100, y: 150)),
                                                     "inputPeriodicity" : 2,
                                                     "inputZoom" : 2,
                                                     "inputRotation" : 0,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIEightfoldReflectedTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                     "inputWidth" : 100,
                                                     "inputAngle" : 3.14,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIFourfoldReflectedTile",
                                                    values: [
                                                     "inputAcuteAngle" : 2,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                                                     "inputWidth" : 150,
                                                     "inputAngle" : 1,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIFourfoldRotatedTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 100, y: 200)),
                                                     "inputWidth" : 150,
                                                     "inputAngle" : 1,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIFourfoldTranslatedTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 100, y: 200)),
                                                     "inputWidth" : 160,
                                                     "inputAcuteAngle" : 2,
                                                     "inputAngle" : 1,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIGlassLozenge",
                                                    values: [
                                                     "inputRefraction" : 3,
                                                     "inputRadius" : 500,
                                                     "inputPoint0" : CIVector(cgPoint: CGPoint(x: 100, y: 200)),
                                                     "inputPoint1" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIGlideReflectedTile",
                                                    values: [
                                                     "inputWidth" : 150,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
                                                     "inputAngle" : 1,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIHoleDistortion",
                                                    values: [
                                                     "inputRadius" : 500,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIKaleidoscope",
                                                    values: [
                                                     "inputAngle" : 1,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
                                                     "inputCount" : 32,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolutionRGB7X7",
                                                    values: [
                                                     "inputBias": 0.5,
                                                     "inputWeights" : CIVector(values: [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 49)
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolutionRGB9Horizontal",
                                                    values: [
                                                     "inputBias" : 0.5,
                                                     "inputWeights" : CIVector(values: [1, 1, 0, 0, 1, 0, 0, 0, 0], count: 9),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolution9Horizontal",
                                                    values: [
                                                     "inputBias" : 0.3,
                                                     "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIConvolutionRGB9Vertical",
                                                    values: [
                                                     "inputBias" : 0,
                                                     "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
                                                    ]
                                                   ),

                                         FilterItem(filterName: "CIConvolution9Vertical",
                                                    values: [
                                                     "inputBias" : 0,
                                                     "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CISpotColor", values: [
                                             "inputCenterColor2": CIColor.fromRGBO(70, 100, 120, 1),
                                             "inputCloseness2": 0.30,
                                             "inputContrast1": 0.5,
                                             "inputReplacementColor2": CIColor.fromRGBO(150, 88, 150, 1),
                                             "inputCenterColor1": CIColor.fromRGBO(50, 40, 50, 1),
                                             "inputContrast3": 0.5,
                                             "inputCloseness1": 0.21,
                                             "inputContrast2": 0.5,
                                             "inputReplacementColor1": CIColor.fromRGBO(100, 90, 70, 1),
                                             "inputCenterColor3": CIColor.fromRGBO(200, 150, 70, 1),
                                             "inputCloseness3": 0.3,
                                             "inputReplacementColor3": CIColor.fromRGBO(170, 100, 67, 1)
                                         ]),
                                         FilterItem(filterName: "CIEdgeWork", values: [
                                             "inputRadius" : 15
                                         ]),
                                         FilterItem(filterName: "CIMaskToAlpha"),
                                         FilterItem(filterName: "CIColorClamp", values: [
                                             "inputMaxComponents" : CIVector(values: [0.5, 0.5, 0.5, 0.5], count: 4),
                                             "inputMinComponents" : CIVector(values: [0, 0, 0, 0], count: 4)
                                         ]),
                                         FilterItem(filterName: "CIGaussianGradient",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                     "inputRadius" : 300,
                                                     "inputColor1" : CIColor.fromRGBO(0, 0, 0, 0),
                                                     "inputColor0" : CIColor.fromRGBO(160, 255, 255, 1),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CILightTunnel",
                                                    values: [
                                                     "inputRadius" : 300,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputRotation" : 1.57,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CILineScreen",
                                                    values: [
                                                     "inputSharpness" : 0.5,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputAngle" : 1,
                                                     "inputWidth" : 24,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CILinearGradient",
                                                    values: [
                                                     "inputColor0" : CIColor.fromRGBO(100, 140, 140, 1),
                                                     "inputPoint1" : CIVector(cgPoint: CGPoint(x: 100, y: 100)),
                                                     "inputPoint0" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                                                     "inputColor1" : CIColor.fromRGBO(200, 1, 1, 1),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CINinePartTiled",
                                                    values: [
                                                     "inputBreakpoint1" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                                                     "inputBreakpoint0" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                                                     "inputFlipYTiles" : false,
                                                     "inputGrowAmount" : CIVector(cgPoint: CGPoint(x: 130, y: 130)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIOpTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                     "inputWidth" : 500,
                                                     "inputAngle" : 2,
                                                     "inputScale" : 5.6,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIParallelogramTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputWidth" : 100,
                                                     "inputAcuteAngle" : 1,
                                                     "inputAngle" : 1,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIPerspectiveCorrection",
                                                    values: [
                                                     "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputTopRight" : CIVector(cgPoint: CGPoint(x: 400, y: 300)),
                                                     "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 60, y: 300)),
                                                     "inputCrop" : false,
                                                     "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 300, y: 70)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIPerspectiveTile",
                                                    values: [
                                                     "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                                                     "inputTopRight" : CIVector(cgPoint: CGPoint(x: 320, y: 250)),
                                                     "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 60, y: 300)),
                                                     "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 270, y: 70)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIPinchDistortion",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputScale" : 1,
                                                     "inputRadius" : 500,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIRadialGradient",
                                                    values: [
                                                     "inputRadius1" : 100,
                                                     "inputColor0" : CIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputRadius0" : 5,
                                                     "inputColor1" : CIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIRoundedRectangleGenerator",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 5, y: 5, width: 50, height: 50)),
                                                     "inputColor" : CIColor(red: 200.0 / 255.0, green: 170.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0),
                                                     "inputRadius" : 50,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CISixfoldReflectedTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputAngle" : 1.5,
                                                     "inputWidth" : 120
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CISixfoldRotatedTile",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputAngle" : 0.5,
                                                     "inputWidth" : 50
                                                    ]
                                                   ),
                                         
                                         FilterItem(filterName: "CISmoothLinearGradient",
                                                    values: [
                                                     "inputPoint1" : CIVector(cgPoint: CGPoint(x: 100, y: 100)),
                                                     "inputColor1" : CIColor(red: 160.0 / 255.0, green: 140.0 / 255.0, blue: 160.0 / 255.0, alpha: 1.0),
                                                     "inputColor0" : CIColor(red: 80.0 / 255.0, green: 160.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0),
                                                     "inputPoint0" : CIVector(cgPoint: CGPoint(x: 50, y: 50)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIStarShineGenerator",
                                                    values: [
                                                     "inputEpsilon" : -2,
                                                     "inputCrossAngle" : 0.6,
                                                     "inputRadius" : 50,
                                                     "inputCrossScale" : 15,
                                                     "inputCrossOpacity" : -2,
                                                     "inputColor" : CIColor(red: 255.0 / 255.0, green: 204.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0),
                                                     "inputCrossWidth" : 2.5,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIStripesGenerator",
                                                    values: [
                                                     "inputWidth" : 400,
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputSharpness" : 0,
                                                     "inputColor0" : CIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
                                                     "inputColor1" : CIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIKeystoneCorrectionHorizontal",
                                                    values: [
                                                     "inputTopRight" : CIVector(cgPoint: CGPoint(x: 10, y: 2)),
                                                     "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 2, y: 10)),
                                                     "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 10, y: 5)),
                                                     "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 5, y: 10)),
                                                     "inputFocalLength" : 14,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIStretchCrop",
                                                    values: [
                                                     "inputCenterStretchAmount" : 0,
                                                     "inputCropAmount" : 1,
                                                     "inputSize" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIRowAverage",
                                                    values: [
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 30, y: 30, width: 10, height: 10)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CINinePartStretched",
                                                    values: [
                                                     "inputBreakpoint1" : CIVector(cgPoint: CGPoint(x: 100, y: 100)),
                                                     "inputBreakpoint0" : CIVector(cgPoint: CGPoint(x: 40, y: 40)),
                                                     "inputGrowAmount" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CILenticularHaloGenerator",
                                                    values: [
                                                     "inputHaloRadius" : 100,
                                                     "inputColor" : CIColor.fromRGBO(209, 204, 255, 1),
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputStriationContrast" : 3,
                                                     "inputHaloOverlap" : 0.55,
                                                     "inputTime" : 1,
                                                     "inputStriationStrength" : 1.5,
                                                     "inputHaloWidth" : 150,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIPerspectiveTransform",
                                                    values: [
                                                     "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                                                     "inputTopRight" : CIVector(cgPoint: CGPoint(x: 320, y: 250)),
                                                     "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 60, y: 300)),
                                                     "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 270, y: 70)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIPerspectiveTransformWithExtent",
                                                    values: [
                                                     "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                                                     "inputTopRight" : CIVector(cgPoint: CGPoint(x: 320, y: 250)),
                                                     "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 60, y: 300)),
                                                     "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 270, y: 70)),
                                                     "inputExtent" : CIVector(cgRect: CGRect(x: 25, y: 25, width: 300, height: 300)),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CISunbeamsGenerator",
                                                    values: [
                                                     "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputStriationContrast" : 2.75,
                                                     "inputTime" : 1,
                                                     "inputStriationStrength" : 1.5,
                                                     "inputMaxStriationRadius" : 5.6,
                                                     "inputSunRadius" : 100,
                                                     "inputColor" : CIColor(red: 160.0 / 255.0, green: 255.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0),
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIKeystoneCorrectionCombined",
                                                    values: [
                                                     "inputTopRight" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputTopLeft": CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                     "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                                     "inputBottomLeft": CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                                     "inputFocalLength" : 14,
                                                    ]
                                                   ),
                                         FilterItem(filterName: "CIKeystoneCorrectionVertical", values: [
                                             "inputTopRight" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputTopLeft": CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                             "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                                             "inputBottomLeft": CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                                             "inputFocalLength" : 14,
                                         ]),

].sorted()
