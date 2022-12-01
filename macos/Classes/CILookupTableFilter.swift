//
//  CILookupTableFilter.swift
//  flutter_core_image_filters
//
//  Created by Nikolay Dymura on 30.11.2022.
//

import Foundation
import CoreImage

class CILookupTableFilterRegister: CIFilterConstructor {
    static func register() {
        CIFilter.registerName(
            "CILookupTable", constructor: CILookupTableFilterRegister(),
            classAttributes: [
                kCIAttributeFilterCategories: [
                    kCICategoryVideo,
                    kCICategoryStillImage,
                ],
            ])
    }
    
    func filter(withName name: String) -> CIFilter? {
        switch name {
        case "CILookupTable":
            return CILookupTableFilter()
        default:
            return nil
        }
    }
}

class CILookupTableFilter: CIFilter {
    @objc dynamic var inputImage: CIImage?
    @objc dynamic var inputIntensity: NSNumber?
    @objc dynamic var inputSize: NSNumber?
    @objc dynamic var inputRows: NSNumber?
    @objc dynamic var inputColumns: NSNumber?
    @objc dynamic var inputImage2: CIImage?
    
    var inputSmoothness = CGFloat(0.5)
    
    var inputColor0 = CIColor(red: 1, green: 0, blue: 1)
    var inputColor1 = CIColor(red: 0, green: 0, blue: 1)
    var inputColor2 = CIColor(red: 0, green: 1, blue: 0)
    var inputColor3 = CIColor(red: 1, green: 0, blue: 1)
    var inputColor4 = CIColor(red: 0, green: 1, blue: 1)
    
    let pseudoColorKernel = CIKernel(source:
         """
         vec2 computeSliceOffset(float slice, float slicesPerRow, vec2 sliceSize) {
              return sliceSize * vec2(mod(slice, slicesPerRow), floor(slice / slicesPerRow));
        }
        vec4 sampleAs3DTexture(sampler image, vec3 textureColor, float size, float numRows, float slicesPerRow) {
          float slice = textureColor.z * (size - 1.0);
          float zOffset = fract(slice);                         // dist between slices

          vec2 sliceSize = vec2(1.0 / slicesPerRow,             // u space of 1 slice
                                1.0 / numRows);                 // v space of 1 slice

          vec2 slice0Offset = computeSliceOffset(floor(slice), slicesPerRow, sliceSize);
          vec2 slice1Offset = computeSliceOffset(ceil(slice), slicesPerRow, sliceSize);

          vec2 slicePixelSize = sliceSize / size;               // space of 1 pixel
          vec2 sliceInnerSize = slicePixelSize * (size - 1.0);  // space of size pixels

          vec2 uv = slicePixelSize * 0.5 + textureColor.xy * sliceInnerSize;
          vec4 slice0Color = sample(image, slice0Offset + uv);
          vec4 slice1Color = sample(image, slice1Offset + uv);
          return mix(slice0Color, slice1Color, zOffset);
        }
        kernel vec4 lutColor(sampler image, sampler lutImage, float inputSize, float inputRows, float inputColumns, float inputIntensity) {
           vec2 textureCoordinate = samplerCoord(image);
           vec4 textureColor = sample(image, textureCoordinate);
           vec4 newColor = sampleAs3DTexture(lutImage, textureColor.rgb, inputSize, inputRows, inputColumns);
           //return mix(textureColor, vec4(newColor.rgb, textureColor.a), inputIntensity);
           return mix(linear_to_srgb(textureColor), linear_to_srgb(vec4(newColor.rgb, textureColor.a)), inputIntensity);
        }
        """
    /*"""
    kernel vec4 lutColor(sampler image, sampler lutImage, float inputSize, float inputRows, float inputColumns, float inputIntensity)
    {
        vec2 textureCoordinate = samplerCoord(image);
        vec4 textureColor = sample(image, textureCoordinate);

        float blueColor = textureColor.b * 63.0;

        vec2 quad1;
        quad1.y = floor(floor(blueColor) / 8.0);
        quad1.x = floor(blueColor) - (quad1.y * 8.0);

        vec2 quad2;
        quad2.y = floor(ceil(blueColor) / 8.0);
        quad2.x = ceil(blueColor) - (quad2.y * 8.0);

        vec2 texPos1;
        texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
        texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);

        vec2 texPos2;
        texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
        texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);

        vec4 newColor1 = sample(lutImage, texPos1);
        vec4 newColor2 = sample(lutImage, texPos2);

        vec4 newColor = mix(newColor1, newColor2, fract(blueColor));
        return mix(textureColor, vec4(newColor.rgb, textureColor.w), inputIntensity);
    }
    """*/
    )
    
    override var outputImage: CIImage? {
        guard let image = inputImage else {
            return nil
        }
        guard let lutImage = inputImage2 else {
            return image
        }
        guard let  pseudoColorKernel = pseudoColorKernel else {
            return image
        }
        let intensity = inputIntensity ?? 1.0
        let extent = image.extent
        let arguments = [image, lutImage, inputSize ?? 8, inputRows ?? 8, inputColumns ?? 8, intensity] as [Any]
        
        return pseudoColorKernel.apply(extent: extent,
                                       roiCallback:
                                        {
            (index, rect) in
            return rect
        },
                                       arguments: arguments)
    }
    
    override var inputKeys: [String] {
        return [kCIInputImageKey, "inputIntensity", "inputSize","inputRows", "inputColumns" , "inputImage2"]
    }
    
    override var attributes: [String : Any] {
        
        return [
            kCIAttributeFilterDisplayName: "Lookup Table",
            kCIAttributeFilterName: "CILookupTable",
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
            #keyPath(inputSize): [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "NSNumber",
                kCIAttributeDisplayName: "Size",
                kCIAttributeDefault: 8,
                kCIAttributeType: kCIAttributeTypeScalar
            ],
            #keyPath(inputRows): [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "NSNumber",
                kCIAttributeDisplayName: "Rows",
                kCIAttributeDefault: 8,
                kCIAttributeType: kCIAttributeTypeScalar
            ],
            #keyPath(inputColumns): [
                kCIAttributeIdentity: 0,
                kCIAttributeClass: "NSNumber",
                kCIAttributeDisplayName: "Columns",
                kCIAttributeDefault: 8,
                kCIAttributeType: kCIAttributeTypeScalar
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
