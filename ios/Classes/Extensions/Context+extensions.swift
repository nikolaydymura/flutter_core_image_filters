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
