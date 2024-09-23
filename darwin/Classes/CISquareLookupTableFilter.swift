//
//  CISquareLookupTableFilter.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 12.12.2022.
//

import Foundation

class CISquareLookupTableFilterRegister: CIFilterConstructor {
    static func register() {
        CIFilter.registerName(
            "CISquareLookupTable", constructor: CISquareLookupTableFilterRegister(),
            classAttributes: [
                kCIAttributeFilterCategories: [
                    kCICategoryVideo,
                    kCICategoryStillImage,
                ],
            ])
    }
    
    func filter(withName name: String) -> CIFilter? {
        switch name {
        case "CISquareLookupTable":
            return CISquareLookupTableFilter()
        default:
            return nil
        }
    }
}


open class CISquareLookupTableFilter: CIFilter {
    @objc dynamic var inputImage: CIImage?
    @objc dynamic var inputIntensity: NSNumber?
    @objc dynamic var inputImage2: CIImage?
    
    private let lutColorKernel = CIKernel(source:
         """
    kernel vec4 lutColor(sampler image, sampler lutImage, float inputIntensity)
    {
        vec2 textureCoordinate = samplerCoord(image);
        vec4 textureColor = sample(image, textureCoordinate);
        
        textureColor = clamp(textureColor, 0.0, 1.0);
    
        mediump float blueColor = textureColor.b * 63.0;
    
        mediump vec2 quad1;
        quad1.y = floor(floor(blueColor) / 8.0);
        quad1.x = floor(blueColor) - (quad1.y * 8.0);
    
        mediump vec2 quad2;
        quad2.y = floor(ceil(blueColor) / 8.0);
        quad2.x = ceil(blueColor) - (quad2.y * 8.0);
    
        mediump vec2 texPos1;
        texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
        texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);
    
        mediump vec2 texPos2;
        texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
        texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);
    
        mediump vec4 newColor1 = sample(lutImage, texPos1);
        mediump vec4 newColor2 = sample(lutImage, texPos2);
        vec4 newColor = mix(newColor1, newColor2, fract(blueColor));
        
        vec4 resultColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), inputIntensity);
        return resultColor;
    }
    """
    )
    
    open var colorKernel: CIKernel? {
        get {
            lutColorKernel
        }
    }
    
    open override var outputImage: CIImage? {
        guard let image = inputImage else {
            return nil
        }
        guard let lutImage = inputImage2 else {
            return image
        }
        guard let lutColorKernel = colorKernel else {
            return image
        }
        let intensity = inputIntensity ?? 1.0
        let extent = image.extent
        let arguments = [image, lutImage, intensity] as [Any]
        
        return lutColorKernel.apply(extent: extent,
                                       roiCallback:
                                        {
            (index, rect) in
            return rect
        },
                                       arguments: arguments)
    }
    
    open override var inputKeys: [String] {
        return [kCIInputImageKey, "inputIntensity", "inputImage2"]
    }
    
    open override var attributes: [String : Any] {
        
        return [
            kCIAttributeFilterDisplayName: "Square Lookup Table",
            kCIAttributeFilterName: "CISquareLookupTable",
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
            #keyPath(inputImage2): [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "CIImage",
                kCIAttributeDisplayName: "LUT Image",
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
            kCIOutputImageKey: [
                kCIAttributeClass: "CIImage",
                kCIAttributeDisplayName: "Output Image",
                kCIAttributeType: kCIAttributeTypeImage
            ]
        ]
    }
}
