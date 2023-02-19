//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import Foundation
import CoreImage


let failedFilters = [
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

    FilterItem(filterName: "CISunbeamsGenerator"
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

    FilterItem(filterName: "CIStripesGenerator"
              ),
    
    FilterItem(filterName: "CIStretchCrop",
               values: [
                "inputCenterStretchAmount" : 0.5,
                "inputCropAmount" : 0.5,
                "inputSize" : CIVector(cgPoint: CGPoint(x: 690, y: 380)),
               ]
              ),

    FilterItem(filterName: "CIStretchCrop"
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

    FilterItem(filterName: "CIStarShineGenerator"
              ),
    
    FilterItem(filterName: "CISmoothLinearGradient",
               values: [
                "inputPoint1" : CIVector(cgPoint: CGPoint(x: 100, y: 100)),
                "inputColor1" : CIColor(red: 160.0 / 255.0, green: 140.0 / 255.0, blue: 160.0 / 255.0, alpha: 1.0),
                "inputColor0" : CIColor(red: 80.0 / 255.0, green: 160.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0),
                "inputPoint0" : CIVector(cgPoint: CGPoint(x: 50, y: 50)),
               ]
              ),

    FilterItem(filterName: "CISmoothLinearGradient"
              ),
    
    FilterItem(filterName: "CISixfoldRotatedTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputAngle" : 0.5,
                "inputWidth" : 50
               ]
              ),

    FilterItem(filterName: "CISixfoldRotatedTile"
              ),
    
    FilterItem(filterName: "CISixfoldReflectedTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputAngle" : 1.5,
                "inputWidth" : 120
               ]
              ),

    FilterItem(filterName: "CISixfoldReflectedTile"
              ),
    
    FilterItem(filterName: "CIRowAverage",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 30, y: 30, width: 320, height: 40)),
               ]
              ),

    FilterItem(filterName: "CIRowAverage"
              ),
    
    FilterItem(filterName: "CIRoundedRectangleGenerator",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 5, y: 5, width: 50, height: 50)),
                "inputColor" : CIColor(red: 200.0 / 255.0, green: 170.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0),
                "inputRadius" : 50,
               ]
              ),

    FilterItem(filterName: "CIRoundedRectangleGenerator"
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

    FilterItem(filterName: "CIRadialGradient"
              ),
    
    FilterItem(filterName: "CIPinchDistortion",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputScale" : 1,
                "inputRadius" : 500,
               ]
              ),

    FilterItem(filterName: "CIPinchDistortion"
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

    FilterItem(filterName: "CIPerspectiveTransformWithExtent"
              ),
    
    FilterItem(filterName: "CIPerspectiveTransform",
               values: [
                "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                "inputTopRight" : CIVector(cgPoint: CGPoint(x: 320, y: 250)),
                "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 60, y: 300)),
                "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 270, y: 70)),
               ]
              ),

    FilterItem(filterName: "CIPerspectiveTransform"
              ),
    
    FilterItem(filterName: "CIPerspectiveTile",
               values: [
                "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                "inputTopRight" : CIVector(cgPoint: CGPoint(x: 320, y: 250)),
                "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 60, y: 300)),
                "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 270, y: 70)),
               ]
              ),

    FilterItem(filterName: "CIPerspectiveTile"
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

    FilterItem(filterName: "CIPerspectiveCorrection"
              ),
    
    FilterItem(filterName: "CIParallelogramTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputWidth" : 100,
                "inputAcuteAngle" : 1,
                "inputAngle" : 1,
               ]
              ),

    FilterItem(filterName: "CIParallelogramTile"
              ),
    
    FilterItem(filterName: "CIOpTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                "inputWidth" : 500,
                "inputAngle" : 2,
                "inputScale" : 5.6,
               ]
              ),

    FilterItem(filterName: "CIOpTile"
              ),
    
    FilterItem(filterName: "CINinePartTiled",
               values: [
                "inputBreakpoint1" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                "inputBreakpoint0" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
                "inputFlipYTiles" : false,
                "inputGrowAmount" : CIVector(cgPoint: CGPoint(x: 130, y: 130)),
               ]
              ),

    FilterItem(filterName: "CINinePartTiled"
              ),
    
    FilterItem(filterName: "CINinePartStretched",
               values: [
                "inputBreakpoint1" : CIVector(cgPoint: CGPoint(x: 80, y: 80)),
                "inputBreakpoint0" : CIVector(cgPoint: CGPoint(x: 40, y: 40)),
                "inputGrowAmount" : CIVector(cgPoint: CGPoint(x: 70, y: 70)),
               ]
              ),

    FilterItem(filterName: "CINinePartStretched"
              ),
    
    FilterItem(filterName: "CILineScreen",
               values: [
                "inputSharpness" : 0.5,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputAngle" : 1,
                "inputWidth" : 24,
               ]
              ),

    FilterItem(filterName: "CILineScreen"
              ),
    
    FilterItem(filterName: "CILinearGradient",
               values: [
                "inputColor0" : CIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0),
                "inputPoint1" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputPoint0" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputColor1" : CIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
               ]
              ),

    FilterItem(filterName: "CILinearGradient"
              ),
    
    FilterItem(filterName: "CILightTunnel",
               values: [
                "inputRadius" : 300,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputRotation" : 1.57,
               ]
              ),

    FilterItem(filterName: "CILightTunnel"
              ),
    
    FilterItem(filterName: "CILenticularHaloGenerator",
               values: [
                "inputHaloRadius" : 500,
                "inputColor" : CIColor(red: 209.0 / 255.0, green: 204.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputStriationContrast" : 3,
                "inputHaloOverlap" : 0.55,
                "inputTime" : 1,
                "inputStriationStrength" : 1.5,
                "inputHaloWidth" : 150,
               ]
              ),

    FilterItem(filterName: "CILenticularHaloGenerator"
              ),
    
    FilterItem(filterName: "CIKeystoneCorrectionVertical",
               values: [
                "inputTopRight" : CIVector(cgPoint: CGPoint(x: 10, y: 2)),
                "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 2, y: 10)),
                "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 10, y: 5)),
                "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 5, y: 10)),
                "inputFocalLength" : 14,
               ]
              ),

    FilterItem(filterName: "CIKeystoneCorrectionVertical"
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

    FilterItem(filterName: "CIKeystoneCorrectionHorizontal"
              ),
    
    FilterItem(filterName: "CIKeystoneCorrectionCombined",
               values: [
                "inputTopRight" : CIVector(cgPoint: CGPoint(x: 10, y: 2)),
                "inputTopLeft" : CIVector(cgPoint: CGPoint(x: 2, y: 10)),
                "inputBottomLeft" : CIVector(cgPoint: CGPoint(x: 10, y: 5)),
                "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 5, y: 10)),
                "inputFocalLength" : 14,
               ]
              ),

    FilterItem(filterName: "CIKeystoneCorrectionCombined"
              ),


    FilterItem(filterName: "CICheckerboardGenerator"),
    FilterItem(filterName: "CIKeystoneCorrectionVertical", values: [
        "inputTopRight" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
        "inputTopLeft": CIVector(cgPoint: CGPoint(x: 150, y: 150)),
        "inputBottomRight" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
        "inputBottomLeft": CIVector(cgPoint: CGPoint(x: 75, y: 75)),
        "inputFocalLength" : 14,
    ]),
    FilterItem(filterName: "CISunbeamsGenerator", values: [
        "inputStriationContrast": 2.6,
        "inputCenter": CIVector(cgPoint: CGPoint(x: 75, y: 75)),
        "inputTime": 1,
        "inputStriationStrength": 2,
        "inputMaxStriationRadius": 5,
        "inputSunRadius": 400,
        "inputColor": CIColor.fromRGBO(100, 90, 0, 1)
    ]),
    FilterItem(filterName: "CISaliencyMapFilter")

].sorted()

extension CIColor {
    class func fromRGBO(_ red: Int, _ green: Int, _ blue: Int, _ opacity: Double) -> CIColor {
        return CIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 250.0,
                       alpha: opacity)
    }
}

class FilterItem: Comparable {
    
    static func < (lhs: FilterItem, rhs: FilterItem) -> Bool {
        lhs.displayName < rhs.displayName
    }
    
    static func == (lhs: FilterItem, rhs: FilterItem) -> Bool {
        lhs.displayName == rhs.displayName
    }
    
    fileprivate let name: String
    fileprivate let values: [String: Any]?
    
    init(filterName: String, values: [String: Any]? = nil) {
        self.name = filterName
        self.values = values
    }
    
    lazy var filter: CIFilter = {
        let f = CIFilter(name: name)
        values?.forEach{ key, value in
            f?.setValue(value, forKey: key)
        }
        return f!
    }()
    
    lazy var displayName: String = {
        guard let displayName = filter.attributes[kCIAttributeFilterDisplayName] as? String else {
            fatalError("Not posilble")
        }
        
       return values == nil ? "\(displayName) (default)" : displayName
    }()
}
