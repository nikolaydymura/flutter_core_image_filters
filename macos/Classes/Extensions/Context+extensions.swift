//
//  CIContext+extensions.swift
//  Pods
//
//  Created by Nikolay Dymura on 12.12.2022.
//

import Foundation
import Metal

extension CIContext {
    class var defaultContext : CIContext {
        Context.context.defaultContext
    }
    
    class var defaultGLContext : CIContext {
        Context.context.defaultGLContext
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
    
    lazy var defaultGLContext = {
        #if os(iOS)
        CIContext(eaglContext: EAGLContext(api: .openGLES2)!, options: Context.options)
        #else
        CIContext(mtlDevice: MTLCreateSystemDefaultDevice()!)
        #endif
    }()
    
    fileprivate init() {
    }
}
