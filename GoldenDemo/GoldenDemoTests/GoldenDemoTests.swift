//
//  GoldenDemoTests.swift
//  GoldenDemoTests
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import XCTest
@testable import GoldenDemo

final class GoldenDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

final class NSNumberCIColorCIVectorTests: CIFilterTests {
    let filters =  ["CIAreaAverage","CIAreaHistogram","CIAreaLogarithmicHistogram","CIAreaMaximum","CIAreaMaximumAlpha","CIAreaMinimum","CIAreaMinimumAlpha","CIAreaMinMax","CIAreaMinMaxRed","CIBumpDistortion","CIBumpDistortionLinear","CICheckerboardGenerator","CICircleSplashDistortion","CICircularScreen","CICircularWrap","CIClamp","CICMYKHalftone","CIColorClamp","CIColorCrossPolynomial","CIColorMatrix","CIColorPolynomial","CIColumnAverage","CIConvolution3X3","CIConvolution5X5","CIConvolution7X7","CIConvolution9Horizontal","CIConvolution9Vertical","CIConvolutionRGB3X3","CIConvolutionRGB5X5","CIConvolutionRGB7X7","CIConvolutionRGB9Horizontal","CIConvolutionRGB9Vertical","CICrop","CICrystallize","CIDepthOfField","CIDotScreen","CIDroste","CIEightfoldReflectedTile","CIFourfoldReflectedTile","CIFourfoldRotatedTile","CIFourfoldTranslatedTile","CIGaussianGradient","CIGlassLozenge","CIGlideReflectedTile","CIHatchedScreen","CIHexagonalPixellate","CIHoleDistortion","CIKaleidoscope","CIKeystoneCorrectionCombined","CIKeystoneCorrectionHorizontal","CIKeystoneCorrectionVertical","CILenticularHaloGenerator","CILightTunnel","CILinearGradient","CILineScreen","CINinePartStretched","CINinePartTiled","CIOpTile","CIParallelogramTile","CIPerspectiveCorrection","CIPerspectiveTile","CIPerspectiveTransform","CIPerspectiveTransformWithExtent","CIPinchDistortion","CIPixellate","CIPointillize","CIRadialGradient","CIRoundedRectangleGenerator","CIRowAverage","CISixfoldReflectedTile","CISixfoldRotatedTile","CISmoothLinearGradient","CISpotLight","CIStarShineGenerator","CIStretchCrop","CIStripesGenerator","CISunbeamsGenerator","CITemperatureAndTint","CIToneCurve","CITorusLensDistortion","CITriangleKaleidoscope","CITriangleTile","CITwelvefoldReflectedTile","CITwirlDistortion","CIVignetteEffect","CIVortexDistortion","CIZoomBlur"]
    
    
    func testDefaults() throws {
        guard let uiImage = UIImage(named: "demo.jpeg") else {
            return XCTFail("Image not founded")
        }
        guard let inputImage = CIImage(image: uiImage) else {
            return XCTFail("Image not loaded")
        }
        for name in filters {
            guard let filter = CIFilter(name: name) else {
                return XCTFail("\(name): no filter")
            }
            if filter.inputKeys.contains(kCIInputImageKey) {
                
                filter.setValue(inputImage, forKey: kCIInputImageKey)
                
                guard var image = filter.outputImage else {
                    return XCTFail("\(name): image failed")
                }
                if image.extent.isInfinite {
                    image = image.cropped(to: inputImage.extent)
                }
                saveDefaultContext(outputImage: image, displayName: name, file: "default.jpeg")
                saveOpenGLContext(outputImage: image, displayName: name, file: "default.jpeg")
                saveMLTContext(outputImage: image, displayName: name, file: "default.jpeg")
            } else {
                guard var image = filter.outputImage else {
                    return XCTFail("\(name): image failed")
                }
                if image.extent.isInfinite {
                    image = image.cropped(to: CGRect(x: 0, y: 0, width: 300, height: 300))
                }
                saveDefaultContext(outputImage: image, displayName: name, file: "default.jpeg")
                saveOpenGLContext(outputImage: image, displayName: name, file: "default.jpeg")
                saveMLTContext(outputImage: image, displayName: name, file: "default.jpeg")
            }
        }
    }
}

class CIFilterTests: XCTestCase {
    let systemContext = CIContext()
    
    let eglContext: CIContext = {
        return CIContext(eaglContext: EAGLContext(api: .openGLES2)!, options: [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace : NSNull()
        ])
    }()
    
    let mContext: CIContext = {
        return CIContext(mtlDevice: MTLCreateSystemDefaultDevice()!, options: [
            CIContextOption.priorityRequestLow : true,
            CIContextOption.workingColorSpace : NSNull()
        ])
    }()
    
    let colorSpace: CGColorSpace? = {
        CGColorSpace(name: CGColorSpace.sRGB)
    }()
    
    func saveDefaultContext(outputImage: CIImage, displayName: String, file: String) {
        let context = systemContext
        let colorSpace = (context.workingColorSpace ?? colorSpace)!
        
        saveImage(context: context, image: outputImage, displayName: displayName, file: "system-\(file)")

    }
    
    func saveOpenGLContext(outputImage: CIImage, displayName: String, file: String) {
        let context = eglContext
        let colorSpace = (context.workingColorSpace ?? colorSpace)!
        
        saveImage(context: context, image: outputImage, displayName: displayName, file: "egl-\(file)")
    }

    func saveMLTContext(outputImage: CIImage, displayName: String, file: String) {
        let context = mContext
        let colorSpace = (context.workingColorSpace ?? colorSpace)!
        
        saveImage(context: context, image: outputImage, displayName: displayName, file: "mlt-\(file)")
    }
    
    private func saveImage(context: CIContext, image: CIImage, displayName: String, file: String) {
        
        let colorSpace = (context.workingColorSpace ?? colorSpace)!
        
        let folder = URL(fileURLWithPath: "/Users/nd/IdeaProjects/home/flutter_gpu_filters/image_filters_example/gpu_flutter_dependencies/flutter_core_image_filters/example/integration_test/goldens/filters/\(displayName)", isDirectory: true)
        if !FileManager.default.fileExists(atPath: folder.path) {
            try? FileManager.default.createDirectory(atPath: folder.path, withIntermediateDirectories: true, attributes: nil)
        }
        let path = URL(fileURLWithPath: "/Users/nd/IdeaProjects/home/flutter_gpu_filters/image_filters_example/gpu_flutter_dependencies/flutter_core_image_filters/example/integration_test/goldens/filters/\(displayName)/\(file)")
        do {
            try context.writeJPEGRepresentation(of: image, to: path, colorSpace: image.colorSpace ?? colorSpace)
        } catch {
            print(error)
        }
    }
}
