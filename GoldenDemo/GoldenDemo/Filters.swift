//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import Foundation
import CoreImage


let failedFilters = [

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
