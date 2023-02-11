//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import Foundation
import CoreImage


let filters = [
    FilterItem(displayName: "Area Average",
               filterName: "CIAreaAverage",
               values: [
                "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 1800, height: 1075))
               ]
              ),
    
    FilterItem(displayName: "3 by 3 Convolution",
               filterName: "CIConvolution3X3",
               values: [
                "inputBias": 0.5,
                "inputWeights" : CIVector(values: [1, 0, 0, 0, 1, 0, 0, 0, 0], count: 9)
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
