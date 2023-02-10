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
                          values: ["inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 340, height: 180))])
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
