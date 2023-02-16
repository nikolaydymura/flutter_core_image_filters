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

    FilterItem(filterName: "CICheckerboardGenerator"),
    FilterItem(filterName: "CIColorClamp", values: [
        "inputMaxComponents" : CIVector(values: [0.5, 0.5, 0.5, 0.5], count: 4),
        "inputMinComponents" : CIVector(values: [0, 0, 0, 0], count: 4)
    ]),
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
        "inputColor": CIColor(red: 130, green: 257, blue: 1, alpha: 1)
    ]),

].sorted()


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
