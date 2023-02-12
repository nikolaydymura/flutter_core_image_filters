//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import Foundation
import CoreImage


let filters = [
    FilterItem(displayName: "Area Min and Max Red",
               filterName: "CIAreaMinMaxRed",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),
    
    FilterItem(displayName: "Area Min and Max Red",
               filterName: "CIAreaMinMaxRed"
              ),
    
    FilterItem(displayName: "Area Min and Max",
               filterName: "CIAreaMinMax",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),
    
    FilterItem(displayName: "Area Min and Max",
               filterName: "CIAreaMinMax"
              ),
    
    FilterItem(displayName: "Area Minimum Alpha",
               filterName: "CIAreaMinimumAlpha",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),
    
    FilterItem(displayName: "Area Minimum Alpha",
               filterName: "CIAreaMinimumAlpha"
              ),
    
    FilterItem(displayName: "Area Minimum",
               filterName: "CIAreaMinimum",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),
    
    FilterItem(displayName: "Area Minimum",
               filterName: "CIAreaMinimum"
              ),
    
    FilterItem(displayName: "Area Maximum Alpha",
               filterName: "CIAreaMaximumAlpha",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),
    
    FilterItem(displayName: "Area Maximum Alpha",
               filterName: "CIAreaMaximumAlpha"
              ),
    
    FilterItem(displayName: "Area Maximum",
               filterName: "CIAreaMaximum",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40))
               ]
              ),
    
    FilterItem(displayName: "Area Maximum",
               filterName: "CIAreaMaximum"
              ),
    
    FilterItem(displayName: "Area Logarithmic Histogram",
               filterName: "CIAreaLogarithmicHistogram",
               values: [
                "inputMinimumStop" : -6,
                "inputMaximumStop" : 4,
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 640, height: 80)),
                "inputCount" : 1024,
               ]
              ),
    
    FilterItem(displayName: "Area Logarithmic Histogram",
               filterName: "CIAreaLogarithmicHistogram"
              ),
    
    FilterItem(displayName: "Area Histogram",
               filterName: "CIAreaHistogram",
               values: [
                "inputScale" : 0.5,
                "inputCount" : 1024,
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 640, height: 80)),
               ]
              ),
    
    FilterItem(displayName: "Area Histogram",
               filterName: "CIAreaHistogram"
              ),
    
    FilterItem(displayName: "Area Average",
               filterName: "CIAreaAverage",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 640, height: 80))
               ]
              ),
    
    FilterItem(displayName: "Area Average",
               filterName: "CIAreaAverage"
              ),
    
    FilterItem(displayName: "7 by 7 Convolution",
               filterName: "CIConvolution7X7",
               values: [
                "inputBias": 0,
                "inputWeights" : CIVector(values: [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 49)
               ]
              ),
    
    FilterItem(displayName: "7 by 7 Convolution",
               filterName: "CIConvolution7X7"
              ),
    
    FilterItem(displayName: "5 by 5 Convolution",
               filterName: "CIConvolution5X5",
               values: [
                "inputBias": 1,
                "inputWeights" : CIVector(values: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], count: 25)
               ]
              ),
    
    FilterItem(displayName: "5 by 5 Convolution",
               filterName: "CIConvolution5X5"
              ),
    
    FilterItem(displayName: "3 by 3 Convolution",
               filterName: "CIConvolution3X3",
               values: [
                "inputBias": 0.5,
                "inputWeights" : CIVector(values: [1, 0, 0, 0, 1, 0, 0, 0, 0], count: 9)
               ]
              ),
    
    FilterItem(displayName: "3 by 3 Convolution",
               filterName: "CIConvolution3X3"
              ),
    
    FilterItem(displayName: "Twirl Distortion",
               filterName: "CITwirlDistortion",
               values: [
                "inputAngle": 6.23,
                "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                "inputRadius": 250
               ]
              )
]


class FilterItem {
    let displayName: String
    fileprivate let filterName: String
    fileprivate let values: [String: Any]?
    
    init(displayName: String, filterName: String, values: [String: Any]? = nil) {
        self.displayName = displayName
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
}
