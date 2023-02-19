//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import Foundation
import CoreImage


let failedFilters = [
    FilterItem(filterName: "CICheckerboardGenerator"),
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
