//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import Foundation
import CoreImage


let failedFilters = [
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
    
    FilterItem(filterName: "CIKaleidoscope",
               values: [
                "inputAngle" : 1,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
                "inputCount" : 32,
               ]
              ),
    
    FilterItem(filterName: "CIKaleidoscope"
              ),
    
    FilterItem(filterName: "CIHoleDistortion",
               values: [
                "inputRadius" : 500,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
               ]
              ),
    
    FilterItem(filterName: "CIHoleDistortion"
              ),
    
    FilterItem(filterName: "CIGlideReflectedTile",
               values: [
                "inputWidth" : 150,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
                "inputAngle" : 1,
               ]
              ),
    
    FilterItem(filterName: "CIGlideReflectedTile"
              ),
    
    FilterItem(filterName: "CIGlassLozenge",
               values: [
                "inputRefraction" : 3,
                "inputRadius" : 500,
                "inputPoint0" : CIVector(cgPoint: CGPoint(x: 100, y: 200)),
                "inputPoint1" : CIVector(cgPoint: CGPoint(x: 200, y: 100)),
               ]
              ),
    
    FilterItem(filterName: "CIGlassLozenge"
              ),
    
    FilterItem(filterName: "CIGaussianGradient",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                "inputRadius" : 300,
                "inputColor1" : CIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.0),
                "inputColor0" : CIColor(red: 160.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
               ]
              ),
    
    FilterItem(filterName: "CIGaussianGradient"
              ),
    
    FilterItem(filterName: "CIFourfoldTranslatedTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 100, y: 200)),
                "inputWidth" : 160,
                "inputAcuteAngle" : 2,
                "inputAngle" : 1,
               ]
              ),
    
    FilterItem(filterName: "CIFourfoldTranslatedTile"
              ),
    
    FilterItem(filterName: "CIFourfoldRotatedTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 100, y: 200)),
                "inputWidth" : 150,
                "inputAngle" : 1,
               ]
              ),
    
    FilterItem(filterName: "CIFourfoldRotatedTile"
              ),
    
    FilterItem(filterName: "CIFourfoldReflectedTile",
               values: [
                "inputAcuteAngle" : 2,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                "inputWidth" : 150,
                "inputAngle" : 1,
               ]
              ),
    
    FilterItem(filterName: "CIFourfoldReflectedTile"
              ),
    
    FilterItem(filterName: "CIEightfoldReflectedTile",
               values: [
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 150, y: 150)),
                "inputWidth" : 100,
                "inputAngle" : 0,
               ]
              ),
    
    FilterItem(filterName: "CIEightfoldReflectedTile"
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
    
    FilterItem(filterName: "CIDroste"
              ),
    
    FilterItem(filterName: "CIConvolutionRGB9Vertical",
               values: [
                "inputBias" : 0,
                "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
               ]
              ),
    
    FilterItem(filterName: "CIConvolutionRGB9Vertical"
              ),
    
    FilterItem(filterName: "CIConvolutionRGB9Horizontal",
               values: [
                "inputBias" : 0.5,
                "inputWeights" : CIVector(values: [1, 1, 0, 0, 1, 0, 0, 0, 0], count: 9),
               ]
              ),
    
    FilterItem(filterName: "CIConvolutionRGB9Horizontal"
              ),
    
    FilterItem(filterName: "CIConvolutionRGB7X7",
               values: [
                "inputBias" : 1,
                "inputWeights" : CIVector(values: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1], count: 49),
               ]
              ),
    
    FilterItem(filterName: "CIConvolutionRGB7X7"
              ),
    
    FilterItem(filterName: "CIConvolutionRGB5X5",
               values: [
                "inputBias" : 0.5,
                "inputWeights" : CIVector(values: [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 25),
               ]
              ),
    
    FilterItem(filterName: "CIConvolutionRGB5X5"
              ),
    
    FilterItem(filterName: "CIConvolutionRGB3X3",
               values: [
                "inputBias" : 0.5,
                "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
               ]
              ),
    
    FilterItem(filterName: "CIConvolutionRGB3X3"
              ),
    
    FilterItem(filterName: "CIConvolutionRGB9Vertical",
               values: [
                "inputBias" : 0,
                "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
               ]
              ),
    
    FilterItem(filterName: "CIConvolutionRGB9Vertical"
              ),
    
    FilterItem(filterName: "CIConvolution9Horizontal",
               values: [
                "inputBias" : 1,
                "inputWeights" : CIVector(values: [0, 0, 0, 1, 1, 1, 0, 0, 0], count: 9),
               ]
              ),
    
    FilterItem(filterName: "CIConvolution9Horizontal"
              ),

    FilterItem(filterName: "CIAreaLogarithmicHistogram",
               values: [
                "inputMinimumStop" : -6,
                "inputMaximumStop" : 4,
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 640, height: 80)),
                "inputCount" : 1024,
               ]
              ),
    
    FilterItem(filterName: "CIAreaLogarithmicHistogram"
              ),
    
    FilterItem(filterName: "CIAreaHistogram",
               values: [
                "inputScale" : 0.5,
                "inputCount" : 1024,
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 1800, height: 1075)),
               ]
              ),
    
    FilterItem(filterName: "CIAreaHistogram"
              ),
    FilterItem(filterName: "CICheckerboardGenerator"),
    FilterItem(filterName: "CIColorClamp", values: [
        "inputMaxComponents" : CIVector(values: [0.5, 0.5, 0.5, 0.5], count: 4),
        "inputMinComponents" : CIVector(values: [0, 0, 0, 0], count: 4)
    ]),
    FilterItem(filterName: "CIColumnAverage",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),

].sorted()


class FilterItem: Comparable {
    
    static func < (lhs: FilterItem, rhs: FilterItem) -> Bool {
        lhs.displayName < rhs.displayName
    }
    
    static func == (lhs: FilterItem, rhs: FilterItem) -> Bool {
        lhs.displayName == rhs.displayName
    }
    
    fileprivate let filterName: String
    fileprivate let values: [String: Any]?
    
    init(filterName: String, values: [String: Any]? = nil) {
        self.filterName = filterName
        self.values = values
    }
    
    lazy var filter: CIFilter = {
        let f = CIFilter(name: filterName)
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
