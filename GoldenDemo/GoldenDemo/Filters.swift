//
//  Filters.swift
//  GoldenDemo
//
//  Created by Nikolay Dymura on 10.02.2023.
//
import Foundation
import CoreImage
import UIKit


let failedFilters = [
    FilterItem(filterName: "CIVividLightBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIVividLightBlendMode"),
    
    FilterItem(filterName: "CISwipeTransition",
               values: ["inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputAngle" : 2,
                        "inputColor" : CIColor(red: 140.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 150, height: 150)),
                        "inputOpacity" : 0.5,
                        "inputTime" : 0.5,
                        "inputWidth" : 400]),
    
    FilterItem(filterName: "CISwipeTransition"),
    
    FilterItem(filterName: "CISubtractBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISubtractBlendMode"),
    
    FilterItem(filterName: "CISourceOverCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISourceOverCompositing"),
    
    FilterItem(filterName: "CISourceOutCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISourceOutCompositing"),
    
    FilterItem(filterName: "CISourceInCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISourceInCompositing"),
    
    FilterItem(filterName: "CISourceAtopCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISourceAtopCompositing"),
    
    FilterItem(filterName: "CISoftLightBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISoftLightBlendMode"),
    
    FilterItem(filterName: "CIShadedMaterial",
               values: ["inputShadingImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputScale" : 100]),
    
    FilterItem(filterName: "CIShadedMaterial"),
    
    FilterItem(filterName: "CIScreenBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIScreenBlendMode"),
    
    FilterItem(filterName: "CISaturationBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CISaturationBlendMode"),
    
    FilterItem(filterName: "CIRippleTransition",
               values: ["inputShadingImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputTargetImage" : CIImage.fromAsset("inputImage2.jpg"),
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 150, height: 150)),
                        "inputTime" : 0.5,
                        "inputScale" : -10,
                        "inputWidth" : 150,
                        "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75))]),
    
    FilterItem(filterName: "CIRippleTransition"),
    
    FilterItem(filterName: "CIPinLightBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIPinLightBlendMode"),
    
    FilterItem(filterName: "CIPalettize",
               values: ["inputPaletteImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputPerceptual" : false]),
    
    FilterItem(filterName: "CIPalettize"),
    
    FilterItem(filterName: "CIPaletteCentroid",
               values: ["inputPaletteImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputPerceptual" : false]),
    
    FilterItem(filterName: "CIPaletteCentroid"),
    
    FilterItem(filterName: "CIPageCurlWithShadowTransition",
               values: ["inputShadowExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 150, height: 150)),
                        "inputShadowAmount" : 0.5,
                        "inputShadowSize" : 0.2,
                        "inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputBacksideImage" : CIImage.fromAsset("inputImage2.jpg"),
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 150, height: 150)),
                        "inputTime" : 0.5,
                        "inputRadius" : 200,
                        "inputAngle" : 2]),
    
    FilterItem(filterName: "CIPageCurlWithShadowTransition"),
    
    FilterItem(filterName: "CIPageCurlTransition",
               values: ["inputShadingImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputTargetImage" : CIImage.fromAsset("inputImage2.jpg"),
                        "inputBacksideImage" : CIImage.fromAsset("inputImage2.jpg"),
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 150, height: 150)),
                        "inputTime" : 0.5,
                        "inputRadius" : 200,
                        "inputAngle" : 2]),
    
    FilterItem(filterName: "CIPageCurlTransition"),
    
    FilterItem(filterName: "CIOverlayBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIOverlayBlendMode"),
    
    FilterItem(filterName: "CIMultiplyCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIMultiplyCompositing"),
    
    FilterItem(filterName: "CIMultiplyBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIMultiplyBlendMode"),
    
    FilterItem(filterName: "CIModTransition",
               values: ["inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputAngle" : 3.14,
                        "inputCompression" : 400,
                        "inputTime" : 0.5,
                        "inputRadius" : 100,
                        "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75))]),
    
    FilterItem(filterName: "CIModTransition"),
    
    FilterItem(filterName: "CIMix",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputAmount" : 0.5]),
    
    FilterItem(filterName: "CIMix"),
    
    FilterItem(filterName: "CIMinimumCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIMinimumCompositing"),
    
    FilterItem(filterName: "CIMaximumCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIMaximumCompositing"),
    
    FilterItem(filterName: "CIMaskedVariableBlur",
               values: ["inputMask" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputRadius" : 8]),
    
    FilterItem(filterName: "CIMaskedVariableBlur"),
    
    FilterItem(filterName: "CILuminosityBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CILuminosityBlendMode"),
    
    FilterItem(filterName: "CILinearLightBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CILinearLightBlendMode"),
    
    FilterItem(filterName: "CILinearDodgeBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CILinearDodgeBlendMode"),
    
    FilterItem(filterName: "CILinearBurnBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CILinearBurnBlendMode"),
    
    FilterItem(filterName: "CILightenBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CILightenBlendMode"),
    
    FilterItem(filterName: "CILabDeltaE",
               values: ["inputImage2" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CILabDeltaE"),
    
    FilterItem(filterName: "CIKMeans",
               values: ["inputMeans" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 320, height: 40)),
                        "inputPerceptual" : false,
                        "inputCount" : 64,
                        "inputPasses" : 10]),
    
    FilterItem(filterName: "CIKMeans"),
    
    FilterItem(filterName: "CIHueBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIHueBlendMode"),
    
    FilterItem(filterName: "CIHardLightBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIHardLightBlendMode"),
    
    FilterItem(filterName: "CIGuidedFilter",
               values: ["inputEpsilon" : 0.001,
                        "inputRadius" : 5,
                        "inputGuideImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIGuidedFilter"),
    
    FilterItem(filterName: "CIGlassDistortion",
               values: ["inputScale" : 100,
                        "inputCenter" : CIVector(cgPoint: CGPoint(x: 75, y: 75)),
                        "inputTexture" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIGlassDistortion"),
    
    FilterItem(filterName: "CIFlashTransition",
               values: ["inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputColor" : CIColor(red: 134.0 / 255.0, green: 204.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0),
                        "inputTime" : 1,
                        "inputCenter" : CIVector(cgPoint: CGPoint(x: 200, y: 200)),
                        "inputMaxStriationRadius" : 5,
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 300, height: 300)),
                        "inputStriationStrength" : 1.5,
                        "inputFadeThreshold" : 0.5,
                        "inputStriationContrast" : 2.5]),
    
    FilterItem(filterName: "CIFlashTransition"),
    
    FilterItem(filterName: "CIExclusionBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIExclusionBlendMode"),
    
    FilterItem(filterName: "CIEdgePreserveUpsampleFilter",
               values: ["inputLumaSigma" : 0.5,
                        "inputSpatialSigma" : 2,
                        "inputSmallImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIEdgePreserveUpsampleFilter"),
    
    FilterItem(filterName: "CIDivideBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIDivideBlendMode"),
    
    FilterItem(filterName: "CIDissolveTransition",
               values: ["inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputTime" : 1]),
    
    FilterItem(filterName: "CIDissolveTransition"),
    
    FilterItem(filterName: "CIDisplacementDistortion",
               values: ["inputDisplacementImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIDisplacementDistortion"),
    
    FilterItem(filterName: "CIDisintegrateWithMaskTransition",
               values: ["inputTime" : 1.0,
                        "inputShadowOffset" : CIVector(cgPoint: CGPoint(x: 10, y: -5)),
                        "inputShadowDensity" : 0.5,
                       "inputShadowRadius" : 24,
                        "inputMaskImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputTargetImage" : CIImage.fromAsset("inputImage2.jpg")]),
    
    FilterItem(filterName: "CIDisintegrateWithMaskTransition"),
    
    FilterItem(filterName: "CIDifferenceBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIDifferenceBlendMode"),
    
    FilterItem(filterName: "CIDarkenBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIDarkenBlendMode"),
    
    FilterItem(filterName: "CICopyMachineTransition",
               values: ["inputTime" : 1.0,
                        "inputAngle" : 3.14,
                        "inputOpacity" : 1.5,
                       "inputWidth" : 250,
                        "inputExtent" : CIVector(cgRect: CGRect(x: 0, y: 0, width: 150, height: 150)),
                        "inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputColor" : CIColor(red: 153.0 / 255.0, green: 115.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)]),
    
    FilterItem(filterName: "CICopyMachineTransition"),
    
    FilterItem(filterName: "CIColorMap",
               values: ["inputGradientImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIColorMap"),
    
    FilterItem(filterName: "CIColorDodgeBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("demo.jpeg")]),
    
    FilterItem(filterName: "CIColorDodgeBlendMode"),
    
    FilterItem(filterName: "CIColorBurnBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIColorBurnBlendMode"),
    
    FilterItem(filterName: "CIColorBlendMode",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIColorBlendMode"),
    
    FilterItem(filterName: "CIColorAbsoluteDifference",
               values: ["inputImage2" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIColorAbsoluteDifference"),
    
    FilterItem(filterName: "CIBlendWithRedMask",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputMaskImage" : CIImage.fromAsset("inputImage2.jpg")]),
    
    FilterItem(filterName: "CIBlendWithRedMask"),
    
    FilterItem(filterName: "CIBlendWithMask",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputMaskImage" : CIImage.fromAsset("inputImage2.jpg")]),
    
    FilterItem(filterName: "CIBlendWithMask"),
    
    FilterItem(filterName: "CIBlendWithBlueMask",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputMaskImage" : CIImage.fromAsset("inputImage2.jpg")]),
    
    FilterItem(filterName: "CIBlendWithBlueMask"),
    
    FilterItem(filterName: "CIBlendWithAlphaMask",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg"),
                        "inputMaskImage" : CIImage.fromAsset("inputImage2.jpg")]),
    
    FilterItem(filterName: "CIBlendWithAlphaMask"),
    
    FilterItem(filterName: "CIBarsSwipeTransition",
               values: ["inputTime" : 0.5,
                       "inputAngle" : 2,
                       "inputWidth" : 150,
                        "inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                       "inputBarOffset" : 50]),
    
    FilterItem(filterName: "CIBarsSwipeTransition"),
    
    FilterItem(filterName: "CIAdditionCompositing",
               values: ["inputBackgroundImage" : CIImage.fromAsset("inputImage1.jpg")]),
    
    FilterItem(filterName: "CIAdditionCompositing"),
    
    FilterItem(filterName: "CIAccordionFoldTransition",
               values: ["inputTime" : 0.5,
                       "inputNumberOfFolds" : 25,
                       "inputBottomHeight" : 1,
                        "inputTargetImage" : CIImage.fromAsset("inputImage1.jpg"),
                       "inputFoldShadowAmount" : 0.5]),
    
    FilterItem(filterName: "CIAccordionFoldTransition")

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


extension CIImage {
    class func fromAsset(_ named: String) -> CIImage {
        guard let image = UIImage(named: named) else {
            fatalError("\(named) not found in assets")
        }
        guard let ciImage = CIImage(image: image) else {
            fatalError("\(named) not converted")
        }
        return ciImage
    }
}
