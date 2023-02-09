//
//  CIContext+extensions.swift
//  Pods
//
//  Created by Nikolay Dymura on 12.12.2022.
//

import Foundation
import Metal

extension CIContext {
    private class var defaultContext : CIContext {
        Context.context.defaultContext
    }
#if os(iOS)
    private class var defaultGLContext : CIContext {
        Context.context.defaultGLContext
    }
#endif
    
    private class var defaultMLTContext : CIContext {
        Context.context.defaultMLTContext
    }
    
    class func selectImageContext(_ key: String) -> CIContext {
        switch key {
#if os(iOS)
        case "openGLES2":
            return CIContext.defaultGLContext
#endif
        case "MLT":
            return CIContext.defaultMLTContext
        default:
            return CIContext.defaultContext
        }
    }
    
    class func selectVideoContext(_ key: String) -> CIContext? {
        switch key {
#if os(iOS)
        case "openGLES2":
            return CIContext.defaultGLContext
#endif
        case "MLT":
            return CIContext.defaultMLTContext
        default:
            return nil
        }
    }
}

fileprivate class Context {
    static let context = Context()
    
    static var options: [CIContextOption : Any] {
#if targetEnvironment(simulator)
        return [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace : NSNull()
        ]
#else
        return [
            CIContextOption.useSoftwareRenderer : false,
            CIContextOption.workingColorSpace : NSNull()
        ]
#endif
    }
    
    lazy var defaultContext = {
        CIContext()
    }()
#if os(iOS)
    lazy var defaultGLContext = {
        CIContext(eaglContext: EAGLContext(api: .openGLES2)!, options: Context.options)
    }()
#endif
    lazy var defaultMLTContext = {
        CIContext(mtlDevice: MTLCreateSystemDefaultDevice()!, options: Context.options)
    }()

    fileprivate init() {
    }
}

extension String {
    func toColorSpace() -> CGColorSpace? {
        switch(self) {
            
        case "genericCMYK":
            return CGColorSpace(name: CGColorSpace.genericCMYK)
            
        case "displayP3":
            return CGColorSpace(name: CGColorSpace.displayP3)
            
        case "genericRGBLinear":
            return CGColorSpace(name: CGColorSpace.genericRGBLinear)
            
        case "adobeRGB1998":
            return CGColorSpace(name: CGColorSpace.adobeRGB1998)
            
        case "sRGB":
            return CGColorSpace(name: CGColorSpace.sRGB)
            
        case "genericGrayGamma2_2":
            return CGColorSpace(name: CGColorSpace.genericGrayGamma2_2)
            
        case "genericXYZ":
            return CGColorSpace(name: CGColorSpace.genericXYZ)
            
        case "genericLab":
            return CGColorSpace(name: CGColorSpace.genericLab)
            
        case "acescgLinear":
            return CGColorSpace(name: CGColorSpace.acescgLinear)
            
        case "itur_709":
            return CGColorSpace(name: CGColorSpace.itur_709)
            
        case "itur_2020":
            return CGColorSpace(name: CGColorSpace.itur_2020)
 
        case "rommrgb":
            return CGColorSpace(name: CGColorSpace.rommrgb)
            
        case "dcip3":
            return CGColorSpace(name: CGColorSpace.dcip3)
            
        case "extendedLinearITUR_2020":
            return CGColorSpace(name: CGColorSpace.extendedLinearITUR_2020)
            
        case "extendedLinearDisplayP3":
            return CGColorSpace(name: CGColorSpace.extendedLinearDisplayP3)
            
        case "displayP3_HLG":
            return CGColorSpace(name: CGColorSpace.displayP3_HLG)
            
        case "extendedSRGB":
            return CGColorSpace(name: CGColorSpace.extendedSRGB)
            
        case "linearSRGB":
            return CGColorSpace(name: CGColorSpace.linearSRGB)
            
        case "extendedLinearSRGB":
            return CGColorSpace(name: CGColorSpace.extendedLinearSRGB)
            
        case "extendedGray":
            return CGColorSpace(name: CGColorSpace.extendedGray)
            
        case "linearGray":
            return CGColorSpace(name: CGColorSpace.linearGray)
            
        case "extendedLinearGray":
            return CGColorSpace(name: CGColorSpace.extendedLinearGray)
        default:
            return nil
        }
    }
}
