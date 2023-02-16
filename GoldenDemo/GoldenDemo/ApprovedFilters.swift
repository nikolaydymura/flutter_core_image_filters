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
].sorted()
