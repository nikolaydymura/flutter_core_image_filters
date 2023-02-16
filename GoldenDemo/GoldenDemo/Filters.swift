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
