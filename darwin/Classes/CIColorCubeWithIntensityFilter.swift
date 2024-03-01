//
//  CIColorCubeWithIntencity.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 23.02.2024.
//

import Foundation

import Foundation
import CoreImage

class CIColorCubeWithIntensityFilterRegister: CIFilterConstructor {
    static func register() {
        CIFilter.registerName(
            "CIColorCubeWithIntensityFilter", constructor: CIColorCubeWithIntensityFilterRegister(),
            classAttributes: [
                kCIAttributeFilterCategories: [
                    kCICategoryVideo,
                    kCICategoryStillImage,
                ],
            ])
    }
    
    func filter(withName name: String) -> CIFilter? {
        switch name {
        case "CIColorCubeWithIntensityFilter":
            return CIColorCubeWithIntensityFilter()
        default:
            return nil
        }
    }
}

class CIColorCubeWithIntensityFilter: CIFilter {
    private let cubeFilter: CIFilter
    private let mixFilter: CIFilter
    
    @objc dynamic var inputImage: CIImage? {
        set {
            cubeFilter.setValue(newValue, forKey: kCIInputImageKey)
        }
        get {
            cubeFilter.value(forKey: kCIInputImageKey) as? CIImage
        }
    }
    @objc dynamic var inputIntensity: NSNumber? {
        set {
            mixFilter.setValue(newValue, forKey: kCIInputAmountKey)
        }
        get {
            mixFilter.value(forKey: kCIInputAmountKey) as? NSNumber
        }
    }
    
    @objc dynamic var inputCubeDimension: NSNumber? {
        set {
            cubeFilter.setValue(newValue, forKey: "inputCubeDimension")
        }
        get {
            cubeFilter.value(forKey: "inputCubeDimension") as? NSNumber
        }
    }
    
    @objc dynamic var inputCubeData: NSData? {
        set {
            cubeFilter.setValue(newValue, forKey: "inputCubeData")
        }
        get {
            cubeFilter.value(forKey: "inputCubeData") as? NSData
        }
    }
    
    override init() {
        self.cubeFilter = CIFilter(name: "CIColorCubeWithColorSpace")!
        self.mixFilter = CIFilter(name: "CIMix")!
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var inputKeys: [String] {
        return ["inputCubeDimension", "inputCubeData", "inputIntensity", kCIInputImageKey ]
    }
    
    override var outputImage: CIImage? {
        guard let source = inputImage else {
            return nil
        }
        
        mixFilter.setValue(source, forKey: kCIInputBackgroundImageKey)
        mixFilter.setValue(cubeFilter.outputImage, forKey: kCIInputImageKey)
        
        return mixFilter.outputImage
    }
    
    override var attributes: [String : Any] {
        return [
            kCIAttributeFilterDisplayName: "Color Cube with Intensity",
            kCIAttributeFilterName: "CIColorCubeWithIntensityFilter",
            kCIAttributeFilterCategories: [
                kCICategoryVideo,
                kCICategoryStillImage,
            ],
            kCIInputImageKey: [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "CIImage",
                kCIAttributeDisplayName: "Image",
                kCIAttributeType: kCIAttributeTypeImage
            ],
            #keyPath(inputIntensity): [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "NSNumber",
                kCIAttributeDisplayName: "Intensity",
                kCIAttributeMin: 0,
                kCIAttributeMax: 1,
                kCIAttributeSliderMin: 0,
                kCIAttributeSliderMax: 1,
                kCIAttributeType: kCIAttributeTypeScalar
            ],
            #keyPath(inputCubeDimension): cubeFilter.attributes["inputCubeDimension"],
            #keyPath(inputCubeData):
                cubeFilter.attributes["inputCubeData"],
            kCIOutputImageKey: [
                kCIAttributeClass: "CIImage",
                kCIAttributeDisplayName: "Output Image",
                kCIAttributeType: kCIAttributeTypeImage
            ]
        ]
    }
}

