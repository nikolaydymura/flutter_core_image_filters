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
    
    var inputImage: CIImage?

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

    override func setValue(_ value: Any?, forKey key: String) {
        switch key {
        case kCIInputImageKey:
            inputImage = value as? CIImage
        case "inputIntensity":
            mixFilter.setValue(value, forKey: kCIInputAmountKey)
        case "inputCubeDimension":
            cubeFilter.setValue(value, forKey: "inputCubeDimension")
        case "inputCubeData":
            cubeFilter.setValue(value, forKey: "inputCubeData")
        default:
            super.setValue(value, forKey: key)
        }
    }

    override func value(forKey key: String) -> Any? {
        switch key {
        case kCIInputImageKey:
            return inputImage
        case "inputIntensity":
            return mixFilter.value(forKey: kCIInputAmountKey)
        case "inputCubeDimension":
            return cubeFilter.value(forKey: "inputCubeDimension")
        case "inputCubeData":
            return cubeFilter.value(forKey: "inputCubeData")
        default:
            return super.value(forKey: key)
        }
    }

   override var outputImage: CIImage? {
        guard let source = inputImage else {
            return nil
        }
        if source.extent.isInfinite || source.extent.isEmpty {
            return nil
        }
        cubeFilter.setValue(source, forKey: kCIInputImageKey)
        guard let processed = cubeFilter.outputImage else  {
            return nil
        }
        mixFilter.setValue(source, forKey: kCIInputBackgroundImageKey)
        mixFilter.setValue(processed, forKey: kCIInputImageKey)

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
            "inputIntensity": [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "NSNumber",
                kCIAttributeDisplayName: "Intensity",
                kCIAttributeMin: 0,
                kCIAttributeMax: 1,
                kCIAttributeSliderMin: 0,
                kCIAttributeSliderMax: 1,
                kCIAttributeType: kCIAttributeTypeScalar
            ],
            "inputCubeDimension": cubeFilter.attributes["inputCubeDimension"],
            "inputCubeData":
                cubeFilter.attributes["inputCubeData"],
            kCIOutputImageKey: [
                kCIAttributeClass: "CIImage",
                kCIAttributeDisplayName: "Output Image",
                kCIAttributeType: kCIAttributeTypeImage
            ]
        ]
    }
}

