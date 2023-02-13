//
//  GoldenDemoUITests.swift
//  GoldenDemoUITests
//
//  Created by Nikolay Dymura on 10.02.2023.
//

import XCTest

final class GoldenDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

class NSNumberCIColorCIVectorUITests : XCTestCase {
    let filters = [
        "Area Average" : "CIAreaAverage",
                   "Area Histogram" : "CIAreaHistogram",
                   "Area Logarithmic Histogram" : "CIAreaLogarithmicHistogram",
                   "Area Maximum" : "CIAreaMaximum",
                   "Area Maximum Alpha" : "CIAreaMaximumAlpha",
                   "Area Minimum" : "CIAreaMinimum",
                   "Area Minimum Alpha" : "CIAreaMinimumAlpha",
                   "Area Min and Max" : "CIAreaMinMax",
                   "Area Min and Max Red" : "CIAreaMinMaxRed",
                   "Bump Distortion" : "CIBumpDistortion",
                   "Bump Distortion Linear" : "CIBumpDistortionLinear",
                   "Checkerboard" : "CICheckerboardGenerator",
                   "Circle Splash Distortion" : "CICircleSplashDistortion",
                   "Circular Screen" : "CICircularScreen",
                   "Circular Wrap Distortion" : "CICircularWrap",
                   "Clamp" : "CIClamp",
                   "CMYK Halftone" : "CICMYKHalftone",
                   "Color Clamp" : "CIColorClamp",
                   "Color Cross Polynomial" : "CIColorCrossPolynomial",
                   "Color Matrix" : "CIColorMatrix",
                   "Color Polynomial" : "CIColorPolynomial",
                   "Column Average" : "CIColumnAverage",
                   "3 by 3 Convolution" : "CIConvolution3X3",
                   "5 by 5 Convolution" : "CIConvolution5X5",
                   "7 by 7 Convolution" : "CIConvolution7X7",
                   "Horizontal 9 Convolution" : "CIConvolution9Horizontal",
                   "Vertical 9 Convolution" : "CIConvolution9Vertical",
                   //"3 by 3 RGB Convolution" : "CIConvolutionRGB3X3",
                   //"5 by 5 RGB Convolution" : "CIConvolutionRGB5X5",
                   //"7 by 7 RGB Convolution" : "CIConvolutionRGB7X7",
                   "Horizontal 9 RGB Convolution" : "CIConvolutionRGB9Horizontal",
                   "Vertical 9 RGB Convolution" : "CIConvolutionRGB9Vertical",
                   "Crop" : "CICrop",
                   "Crystallize" : "CICrystallize",
                   "Depth of Field" : "CIDepthOfField",
                   "Dot Screen" : "CIDotScreen",
                   "Droste" : "CIDroste",
                   "Eightfold Reflected Tile" : "CIEightfoldReflectedTile",
                   "Fourfold Reflected Tile" : "CIFourfoldReflectedTile",
                   "Fourfold Rotated Tile" : "CIFourfoldRotatedTile",
                   "Fourfold Translated Tile" : "CIFourfoldTranslatedTile",
                   "Gaussian Gradient" : "CIGaussianGradient",
                   "Glass Lozenge" : "CIGlassLozenge",
                   "Glide Reflected Tile" : "CIGlideReflectedTile",
                   "Hatched Screen" : "CIHatchedScreen",
                   "Hexagonal Pixelate" : "CIHexagonalPixellate",
                   "Hole Distortion" : "CIHoleDistortion",
                   "Kaleidoscope" : "CIKaleidoscope",
                   "Combined Keystone Correction" : "CIKeystoneCorrectionCombined",
                   "Horizontal Keystone Correction" : "CIKeystoneCorrectionHorizontal",
                   "Vertical Keystone Correction" : "CIKeystoneCorrectionVertical",
                   "Lenticular Halo" : "CILenticularHaloGenerator",
                   "Light Tunnel Distortion" : "CILightTunnel",
                   "Linear Gradient" : "CILinearGradient",
                   "Line Screen" : "CILineScreen",
                   "Nine Part Stretched" : "CINinePartStretched",
                   "Nine Part Tiled" : "CINinePartTiled",
                   "Op Tile" : "CIOpTile",
                   "Parallelogram Tile" : "CIParallelogramTile",
                   "Perspective Correction" : "CIPerspectiveCorrection",
                   "Perspective Tile" : "CIPerspectiveTile",
                   "Perspective Transform" : "CIPerspectiveTransform",
                   "Perspective Transform with Extent" : "CIPerspectiveTransformWithExtent",
                   "Pinch Distortion" : "CIPinchDistortion",
                   "Pixelate" : "CIPixellate",
                   "Pointillize" : "CIPointillize",
                   "Radial Gradient" : "CIRadialGradient",
                   "Rounded Rectangle Generator" : "CIRoundedRectangleGenerator",
                   "Row Average" : "CIRowAverage",
                   "Sixfold Reflected Tile" : "CISixfoldReflectedTile",
                   "Sixfold Rotated Tile" : "CISixfoldRotatedTile",
                   "Smooth Linear Gradient" : "CISmoothLinearGradient",
                   "Spot Light" : "CISpotLight",
                   "Star Shine" : "CIStarShineGenerator",
                   "Stretch Crop" : "CIStretchCrop",
                   "Stripes" : "CIStripesGenerator",
                   "Sunbeams" : "CISunbeamsGenerator",
                   "Temperature and Tint" : "CITemperatureAndTint",
                   "Tone Curve" : "CIToneCurve",
                   "Torus Lens Distortion" : "CITorusLensDistortion",
                   "Triangle Kaleidoscope" : "CITriangleKaleidoscope",
                   "Triangle Tile" : "CITriangleTile",
                   "Twelvefold Reflected Tile" : "CITwelvefoldReflectedTile",
                   "Twirl Distortion" : "CITwirlDistortion",
                   "Vignette Effect" : "CIVignetteEffect",
                   "Vortex Distortion" : "CIVortexDistortion",
                   "Zoom Blur" : "CIZoomBlur",
    ]
    
    func testFilters() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        for filter in filters.keys.sorted() {
            app.tables.firstMatch.cells.staticTexts[filter].tap()
            
            guard let displayName = filters[filter] else {
                XCTFail("No filter")
                return
            }
            
            app.staticTexts[displayName].waitForExistence(timeout: 2)
            
            takeScreenshot(displayName: displayName, file: "1.jpeg")
            
            app.navigationBars.buttons.element(boundBy: 0).tap()
            
            app.staticTexts["Filters"].waitForExistence(timeout: 3)
        }

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func takeScreenshot(displayName: String, file: String) {
        // Take the screenshot
        let fullScreenshot = XCUIScreen.main.screenshot()
        guard let data = fullScreenshot.image.jpegData(compressionQuality: 1.0) else {
            XCTFail("Faield to compess screenshot")
            return
        }
        
        
        let folder = URL(fileURLWithPath: "/Users/nd/IdeaProjects/home/flutter_gpu_filters/image_filters_example/gpu_flutter_dependencies/flutter_core_image_filters/example/integration_test/goldens/screens/\(displayName)", isDirectory: true)
        if !FileManager.default.fileExists(atPath: folder.path) {
            try? FileManager.default.createDirectory(atPath: folder.path, withIntermediateDirectories: true, attributes: nil)
        }
        let path = URL(fileURLWithPath: "/Users/nd/IdeaProjects/home/flutter_gpu_filters/image_filters_example/gpu_flutter_dependencies/flutter_core_image_filters/example/integration_test/goldens/screens/\(displayName)/\(file)")
        do {
            try data.write(to: path)
        } catch {
            print(error)
        }
        
    }
}
