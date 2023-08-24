![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

<p align="center">
<a href="https://pub.dev/packages/flutter_core_image_filters"><img src="https://img.shields.io/pub/v/flutter_core_image_filters.svg" alt="Pub"></a>
<a href="https://codecov.io/gh/nikolaydymura/flutter_core_image_filters"><img src="https://codecov.io/gh/nikolaydymura/flutter_core_image_filters/main/master/graph/badge.svg?token=8WE5JDOLGS" alt="codecov"></a>
<a href="https://github.com/nikolaydymura/flutter_core_image_filters/actions"><img src="https://github.com/nikolaydymura/flutter_core_image_filters/actions/workflows/flutter_core_image_filters.yaml/badge.svg" alt="build"></a>
<a href="https://github.com/nikolaydymura/flutter_core_image_filters"><img src="https://img.shields.io/github/stars/nikolaydymura/flutter_core_image_filters.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

A flutter package for iOS and MacOS for applying CoreImage filters to image.

## Usage

### Export processed image

```dart

final inputSource = AssetInputSource('demo.jpeg');
final configuration = CIPhotoEffectChromeConfiguration();
final image = await configuration.export(inputSource);
```

### CIImagePreview example

```dart
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late CIPhotoEffectChromeConfiguration configuration;
  late final CIImagePreviewController controller;
  bool controllerReady = false;

  @override
  void initState() {
    super.initState();
    _prepare().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _prepare() async {
    configuration = CIPhotoEffectChromeConfiguration();
    controller =
    await CIImagePreviewController.fromAsset(_assetPath);
    await configuration.prepare();
    await controller.connect(configuration);
    controllerReady = true;
  }

  @override
  void dispose() {
    controller.dispose();
    configuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controllerReady
        ? CIImagePreview(controller: controller)
        : const Offstage();
  }
}
```

### Divided preview sample

```dart
import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late CIPhotoEffectChromeConfiguration configuration;
  late final CIImagePreviewController sourceController;
  late final CIImagePreviewController destinationController;
  bool controllersReady = false;

  @override
  void initState() {
    super.initState();
    _prepare().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _prepare() async {
    configuration = CIPhotoEffectChromeConfiguration();
    sourceController = await CIImagePreviewController.fromAsset('demo.jpeg');
    destinationController =
    await CIImagePreviewController.fromAsset('demo.jpeg');
    await configuration.prepare();
    await destinationController.connect(configuration);
    controllersReady = true;
  }

  @override
  void dispose() {
    sourceController.dispose();
    destinationController.dispose();
    configuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controllersReady
        ? BeforeAfter(
      thumbRadius: 0.0,
      thumbColor: Colors.transparent,
      beforeImage: CIImagePreview(
        controller: sourceController,
      ),
      afterImage: CIImagePreview(
        controller: destinationController,
      ),
    )
        : const Offstage();
  }
}
```

### Export & save processed image

```dart
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';


final inputSource = AssetInputSource('demo.jpeg');
final configuration = CIPhotoEffectChromeConfiguration();
final image = await configuration.export(inputSource);

final directory = await

getTemporaryDirectory();

final output =
File('${directory.path}/result.jpeg');
final bytes = await
image.toByteData();

final persistedImage = img.Image.fromBytes(
  width: image.width,
  height: image.height,
  bytes: bytes!.buffer,
  numChannels: 4,
);
img.JpegEncoder encoder = img.JpegEncoder();
final data = encoder.encode(persistedImage);
await
output.writeAsBytes(data);
```

## Additional information

### Support status of [CoreImage filters](https://cifilter.io/)

| Status             | Name                              | Display Name                      |
|:-------------------|:----------------------------------|:----------------------------------|
| :white_check_mark: | CIAccordionFoldTransition         | Accordion Fold Transition         |
| :x:                | CIAdditionCompositing             | Addition                          |
| :x:                | CIAffineClamp                     | Affine Clamp                      |
| :x:                | CIAffineTile                      | Affine Tile                       |
| :x:                | CIAffineTransform                 | Affine Transform                  |
| :white_check_mark: | CIAreaAverage                     | Area Average                      |
| :white_check_mark: | CIAreaHistogram                   | Area Histogram                    |
| :white_check_mark: | CIAreaLogarithmicHistogram        | Area Logarithmic Histogram        |
| :white_check_mark: | CIAreaMaximum                     | Area Maximum                      |
| :white_check_mark: | CIAreaMaximumAlpha                | Area Maximum Alpha                |
| :white_check_mark: | CIAreaMinimum                     | Area Minimum                      |
| :white_check_mark: | CIAreaMinimumAlpha                | Area Minimum Alpha                |
| :white_check_mark: | CIAreaMinMax                      | Area Min and Max                  |
| :white_check_mark: | CIAreaMinMaxRed                   | Area Min and Max Red              |
| :x:                | CIAttributedTextImageGenerator    | Attributed Text Image Generator   |
| :x:                | CIAztecCodeGenerator              | Aztec Code Generator              |
| :x:                | CIBarcodeGenerator                | Barcode Generator                 |
| :white_check_mark: | CIBarsSwipeTransition             | Bars Swipe Transition             |
| :white_check_mark: | CIBicubicScaleTransform           | Bicubic Scale Transform           |
| :x:                | CIBlendWithAlphaMask              | Blend With Alpha Mask             |
| :white_check_mark: | CIBlendWithBlueMask               | Blend With Blue Mask              |
| :white_check_mark: | CIBlendWithMask                   | Blend With Mask                   |
| :white_check_mark: | CIBlendWithRedMask                | Blend With Red Mask               |
| :white_check_mark: | CIBloom                           | Bloom                             |
| :white_check_mark: | CIBokehBlur                       | Bokeh Blur                        |
| :white_check_mark: | CIBoxBlur                         | Box Blur                          |
| :white_check_mark: | CIBumpDistortion                  | Bump Distortion                   |
| :white_check_mark: | CIBumpDistortionLinear            | Bump Distortion Linear            |
| :x:                | CICameraCalibrationLensCorrection | Lens Correction for AVC           |
| :interrobang:      | CICheckerboardGenerator           | Checkerboard                      |
| :white_check_mark: | CICircleSplashDistortion          | Circle Splash Distortion          |
| :white_check_mark: | CICircularScreen                  | Circular Screen                   |
| :white_check_mark: | CICircularWrap                    | Circular Wrap Distortion          |
| :white_check_mark: | CIClamp                           | Clamp                             |
| :white_check_mark: | CICMYKHalftone                    | CMYK Halftone                     |
| :x:                | CICode128BarcodeGenerator         | Code 128 Barcode Generator        |
| :white_check_mark: | CIColorAbsoluteDifference         | Color Absolute Difference         |
| :white_check_mark: | CIColorBlendMode                  | Color Blend Mode                  |
| :white_check_mark: | CIColorBurnBlendMode              | Color Burn Blend Mode             |
| :white_check_mark: | CIColorClamp                      | Color Clamp                       |
| :white_check_mark: | CIColorControls                   | Color Controls                    |
| :white_check_mark: | CIColorCrossPolynomial            | Color Cross Polynomial            |
| :x:                | CIColorCube                       | Color Cube                        |
| :x:                | CIColorCubesMixedWithMask         | Color Cubes Mixed With Mask       |
| :x:                | CIColorCubeWithColorSpace         | Color Cube with ColorSpace        |
| :x:                | CIColorCurves                     | Color Curves                      |
| :white_check_mark: | CIColorDodgeBlendMode             | Color Dodge Blend Mode            |
| :white_check_mark: | CIColorInvert                     | Color Invert                      |
| :x:                | CIColorMap                        | Color Map                         |
| :white_check_mark: | CIColorMatrix                     | Color Matrix                      |
| :white_check_mark: | CIColorMonochrome                 | Color Monochrome                  |
| :white_check_mark: | CIColorPolynomial                 | Color Polynomial                  |
| :white_check_mark: | CIColorPosterize                  | Color Posterize                   |
| :white_check_mark: | CIColorThreshold                  | Color Threshold                   |
| :white_check_mark: | CIColorThresholdOtsu              | Color Threshold Otsu              |
| :white_check_mark: | CIColumnAverage                   | Column Average                    |
| :white_check_mark: | CIComicEffect                     | Comic Effect                      |
| :white_check_mark: | CIConstantColorGenerator          | Constant Color                    |
| :interrobang:      | CIConvertLabToRGB                 | Convert Lab to RGB                |
| :white_check_mark: | CIConvertRGBtoLab                 | Convert RGB to Lab                |
| :white_check_mark: | CIConvolution3X3                  | 3 by 3 Convolution                |
| :white_check_mark: | CIConvolution5X5                  | 5 by 5 Convolution                |
| :white_check_mark: | CIConvolution7X7                  | 7 by 7 Convolution                |
| :white_check_mark: | CIConvolution9Horizontal          | Horizontal 9 Convolution          |
| :white_check_mark: | CIConvolution9Vertical            | Vertical 9 Convolution            |
| :white_check_mark: | CIConvolutionRGB3X3               | 3 by 3 RGB Convolution            |
| :white_check_mark: | CIConvolutionRGB5X5               | 5 by 5 RGB Convolution            |
| :white_check_mark: | CIConvolutionRGB7X7               | 7 by 7 RGB Convolution            |
| :white_check_mark: | CIConvolutionRGB9Horizontal       | Horizontal 9 RGB Convolution      |
| :white_check_mark: | CIConvolutionRGB9Vertical         | Vertical 9 RGB Convolution        |
| :x:                | CICopyMachineTransition           | Copy Machine                      |
| :x:                | CICoreMLModelFilter               | CoreML Model Filter               |
| :white_check_mark: | CICrop                            | Crop                              |
| :white_check_mark: | CICrystallize                     | Crystallize                       |
| :x:                | CIDarkenBlendMode                 | Darken Blend Mode                 |
| :x:                | CIDepthBlurEffect                 | Depth Blur Effect                 |
| :white_check_mark: | CIDepthOfField                    | Depth of Field                    |
| :interrobang:      | CIDepthToDisparity                | Depth To Disparity                |
| :x:                | CIDifferenceBlendMode             | Difference Blend Mode             |
| :white_check_mark: | CIDiscBlur                        | Disc Blur                         |
| :x:                | CIDisintegrateWithMaskTransition  | Disintegrate With Mask            |
| :interrobang:      | CIDisparityToDepth                | Disparity To Depth                |
| :x:                | CIDisplacementDistortion          | Displacement Distortion           |
| :x:                | CIDissolveTransition              | Dissolve                          |
| :white_check_mark: | CIDither                          | Dither                            |
| :white_check_mark: | CIDivideBlendMode                 | Divide Blend Mode                 |
| :white_check_mark: | CIDocumentEnhancer                | Document Enhancer                 |
| :white_check_mark: | CIDotScreen                       | Dot Screen                        |
| :white_check_mark: | CIDroste                          | Droste                            |
| :x:                | CIEdgePreserveUpsampleFilter      | Edge Preserve Upsample Filter     |
| :white_check_mark: | CIEdges                           | Edges                             |
| :white_check_mark: | CIEdgeWork                        | Edge Work                         |
| :white_check_mark: | CIEightfoldReflectedTile          | Eightfold Reflected Tile          |
| :x:                | CIExclusionBlendMode              | Exclusion Blend Mode              |
| :white_check_mark: | CIExposureAdjust                  | Exposure Adjust                   |
| :white_check_mark: | CIFalseColor                      | False Color                       |
| :x:                | CIFlashTransition                 | Flash                             |
| :white_check_mark: | CIFourfoldReflectedTile           | Fourfold Reflected Tile           |
| :white_check_mark: | CIFourfoldRotatedTile             | Fourfold Rotated Tile             |
| :x:                | CIFourfoldTranslatedTile          | Fourfold Translated Tile          |
| :white_check_mark: | CIGaborGradients                  | Gabor Gradients                   |
| :white_check_mark: | CIGammaAdjust                     | Gamma Adjust                      |
| :white_check_mark: | CIGaussianBlur                    | Gaussian Blur                     |
| :white_check_mark: | CIGaussianGradient                | Gaussian Gradient                 |
| :x:                | CIGlassDistortion                 | Glass Distortion                  |
| :white_check_mark: | CIGlassLozenge                    | Glass Lozenge                     |
| :white_check_mark: | CIGlideReflectedTile              | Glide Reflected Tile              |
| :white_check_mark: | CIGloom                           | Gloom                             |
| :x:                | CIGuidedFilter                    | Guided Filter                     |
| :x:                | CIHardLightBlendMode              | Hard Light Blend Mode             |
| :white_check_mark: | CIHatchedScreen                   | Hatched Screen                    |
| :white_check_mark: | CIHeightFieldFromMask             | Height Field From Mask            |
| :white_check_mark: | CIHexagonalPixellate              | Hexagonal Pixelate                |
| :white_check_mark: | CIHighlightShadowAdjust           | Highlight and Shadow Adjust       |
| :white_check_mark: | CIHistogramDisplayFilter          | Histogram Display                 |
| :white_check_mark: | CIHoleDistortion                  | Hole Distortion                   |
| :white_check_mark: | CIHueAdjust                       | Hue Adjust                        |
| :white_check_mark: | CIHueBlendMode                    | Hue Blend Mode                    |
| :x:                | CIHueSaturationValueGradient      | Hue/Saturation/Value Gradient     |
| :white_check_mark: | CIKaleidoscope                    | Kaleidoscope                      |
| :white_check_mark: | CIKeystoneCorrectionCombined      | Combined Keystone Correction      |
| :white_check_mark: | CIKeystoneCorrectionHorizontal    | Horizontal Keystone Correction    |
| :white_check_mark: | CIKeystoneCorrectionVertical      | Vertical Keystone Correction      |
| :x:                | CIKMeans                          | KMeans                            |
| :x:                | CILabDeltaE                       | Lab ∆E                            |
| :white_check_mark: | CILanczosScaleTransform           | Lanczos Scale Transform           |
| :white_check_mark: | CILenticularHaloGenerator         | Lenticular Halo                   |
| :x:                | CILightenBlendMode                | Lighten Blend Mode                |
| :white_check_mark: | CILightTunnel                     | Light Tunnel Distortion           |
| :x:                | CILinearBurnBlendMode             | Linear Burn Blend Mode            |
| :x:                | CILinearDodgeBlendMode            | Linear Dodge Blend Mode           |
| :white_check_mark: | CILinearGradient                  | Linear Gradient                   |
| :x:                | CILinearLightBlendMode            | Linear Light Blend Mode           |
| :white_check_mark: | CILinearToSRGBToneCurve           | Linear to sRGB Tone Curve         |
| :white_check_mark: | CILineOverlay                     | Line Overlay                      |
| :white_check_mark: | CILineScreen                      | Line Screen                       |
| :x:                | CILuminosityBlendMode             | Luminosity Blend Mode             |
| :x:                | CIMaskedVariableBlur              | Masked Variable Blur              |
| :white_check_mark: | CIMaskToAlpha                     | Mask to Alpha                     |
| :white_check_mark: | CIMaximumComponent                | Maximum Component                 |
| :x:                | CIMaximumCompositing              | Maximum                           |
| :white_check_mark: | CIMedianFilter                    | Median                            |
| :x:                | CIMeshGenerator                   | Mesh Generator                    |
| :white_check_mark: | CIMinimumComponent                | Minimum Component                 |
| :x:                | CIMinimumCompositing              | Minimum                           |
| :white_check_mark: | CIMix                             | Mix                               |
| :white_check_mark: | CIModTransition                   | Mod                               |
| :white_check_mark: | CIMorphologyGradient              | Morphology Gradient               |
| :white_check_mark: | CIMorphologyMaximum               | Morphology Maximum                |
| :white_check_mark: | CIMorphologyMinimum               | Morphology Minimum                |
| :white_check_mark: | CIMorphologyRectangleMaximum      | Morphology Rectangle Maximum      |
| :white_check_mark: | CIMorphologyRectangleMinimum      | Morphology Rectangle Minimum      |
| :white_check_mark: | CIMotionBlur                      | Motion Blur                       |
| :x:                | CIMultiplyBlendMode               | Multiply Blend Mode               |
| :x:                | CIMultiplyCompositing             | Multiply                          |
| :white_check_mark: | CINinePartStretched               | Nine Part Stretched               |
| :white_check_mark: | CINinePartTiled                   | Nine Part Tiled                   |
| :white_check_mark: | CINoiseReduction                  | Noise Reduction                   |
| :white_check_mark: | CIOpTile                          | Op Tile                           |
| :white_check_mark: | CIOverlayBlendMode                | Overlay Blend Mode                |
| :x:                | CIPageCurlTransition              | Page Curl                         |
| :white_check_mark: | CIPageCurlWithShadowTransition    | Page Curl With Shadow             |
| :x:                | CIPaletteCentroid                 | Palette Centroid                  |
| :x:                | CIPalettize                       | Palettize                         |
| :white_check_mark: | CIParallelogramTile               | Parallelogram Tile                |
| :x:                | CIPDF417BarcodeGenerator          | PDF417 Barcode Generator          |
| :interrobang:      | CIPersonSegmentation              | Person Segmentation               |
| :white_check_mark: | CIPerspectiveCorrection           | Perspective Correction            |
| :white_check_mark: | CIPerspectiveRotate               | Perspective Rotate                |
| :white_check_mark: | CIPerspectiveTile                 | Perspective Tile                  |
| :white_check_mark: | CIPerspectiveTransform            | Perspective Transform             |
| :white_check_mark: | CIPerspectiveTransformWithExtent  | Perspective Transform with Extent |
| :white_check_mark: | CIPhotoEffectChrome               | Photo Effect Chrome               |
| :white_check_mark: | CIPhotoEffectFade                 | Photo Effect Fade                 |
| :white_check_mark: | CIPhotoEffectInstant              | Photo Effect Instant              |
| :white_check_mark: | CIPhotoEffectMono                 | Photo Effect Mono                 |
| :white_check_mark: | CIPhotoEffectNoir                 | Photo Effect Noir                 |
| :white_check_mark: | CIPhotoEffectProcess              | Photo Effect Process              |
| :white_check_mark: | CIPhotoEffectTonal                | Photo Effect Tonal                |
| :white_check_mark: | CIPhotoEffectTransfer             | Photo Effect Transfer             |
| :white_check_mark: | CIPinchDistortion                 | Pinch Distortion                  |
| :x:                | CIPinLightBlendMode               | Pin Light Blend Mode              |
| :white_check_mark: | CIPixellate                       | Pixelate                          |
| :white_check_mark: | CIPointillize                     | Pointillize                       |
| :x:                | CIQRCodeGenerator                 | QR Code Generator                 |
| :white_check_mark: | CIRadialGradient                  | Radial Gradient                   |
| :white_check_mark: | CIRandomGenerator                 | Random Generator                  |
| :x:                | CIRippleTransition                | Ripple                            |
| :white_check_mark: | CIRoundedRectangleGenerator       | Rounded Rectangle Generator       |
| :white_check_mark: | CIRowAverage                      | Row Average                       |
| :interrobang:      | CISaliencyMapFilter               | Saliency Map Filter               |
| :white_check_mark: | CISampleNearest                   | Sample Nearest                    |
| :white_check_mark: | CISaturationBlendMode             | Saturation Blend Mode             |
| :x:                | CIScreenBlendMode                 | Screen Blend Mode                 |
| :white_check_mark: | CISepiaTone                       | Sepia Tone                        |
| :x:                | CIShadedMaterial                  | Shaded Material                   |
| :white_check_mark: | CISharpenLuminance                | Sharpen Luminance                 |
| :white_check_mark: | CISixfoldReflectedTile            | Sixfold Reflected Tile            |
| :white_check_mark: | CISixfoldRotatedTile              | Sixfold Rotated Tile              |
| :white_check_mark: | CISmoothLinearGradient            | Smooth Linear Gradient            |
| :white_check_mark: | CISoftLightBlendMode              | Soft Light Blend Mode             |
| :x:                | CISourceAtopCompositing           | Source Atop                       |
| :x:                | CISourceInCompositing             | Source In                         |
| :x:                | CISourceOutCompositing            | Source Out                        |
| :x:                | CISourceOverCompositing           | Source Over                       |
| :white_check_mark: | CISpotColor                       | Spot Color                        |
| :white_check_mark: | CISpotLight                       | Spot Light                        |
| :white_check_mark: | CISRGBToneCurveToLinear           | sRGB Tone Curve to Linear         |
| :white_check_mark: | CIStarShineGenerator              | Star Shine                        |
| :white_check_mark: | CIStraightenFilter                | Straighten                        |
| :white_check_mark: | CIStretchCrop                     | Stretch Crop                      |
| :white_check_mark: | CIStripesGenerator                | Stripes                           |
| :x:                | CISubtractBlendMode               | Subtract Blend Mode               |
| :white_check_mark: | CISunbeamsGenerator               | Sunbeams                          |
| :white_check_mark: | CISwipeTransition                 | Swipe                             |
| :white_check_mark: | CITemperatureAndTint              | Temperature and Tint              |
| :x:                | CITextImageGenerator              | Text Image Generator              |
| :white_check_mark: | CIThermal                         | Thermal                           |
| :white_check_mark: | CIToneCurve                       | Tone Curve                        |
| :white_check_mark: | CITorusLensDistortion             | Torus Lens Distortion             |
| :white_check_mark: | CITriangleKaleidoscope            | Triangle Kaleidoscope             |
| :white_check_mark: | CITriangleTile                    | Triangle Tile                     |
| :white_check_mark: | CITwelvefoldReflectedTile         | Twelvefold Reflected Tile         |
| :white_check_mark: | CITwirlDistortion                 | Twirl Distortion                  |
| :white_check_mark: | CIUnsharpMask                     | Unsharp Mask                      |
| :white_check_mark: | CIVibrance                        | Vibrance                          |
| :white_check_mark: | CIVignette                        | Vignette                          |
| :white_check_mark: | CIVignetteEffect                  | Vignette Effect                   |
| :white_check_mark: | CIVividLightBlendMode             | Vivid Light Blend Mode            |
| :white_check_mark: | CIVortexDistortion                | Vortex Distortion                 |
| :white_check_mark: | CIWhitePointAdjust                | White Point Adjust                |
| :white_check_mark: | CIXRay                            | X-Ray                             |
| :white_check_mark: | CIZoomBlur                        | Zoom Blur                         |

### Sample results

![Photo Effect Chrome](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Chrome.jpeg)
![Photo Effect Fade](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Fade.jpeg)
![Photo Effect Instant](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Instant.jpeg)
![Photo Effect Mono](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Mono.jpeg)
![Photo Effect Noir](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Noir.jpeg)
![Photo Effect Process](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Process.jpeg)
![Photo Effect Tonal](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Tonal.jpeg)
![Photo Effect Transfer](https://raw.githubusercontent.com/nikolaydymura/flutter_core_image_filters/main/demos/Photo%20Effect%20Transfer.jpeg)

## Examples

- [Big Flutter Filters Demo](https://github.com/nikolaydymura/image_filters_example) - big example
  of how to use filters and.

## Maintainers

- [Nikolay Dymura](https://github.com/nikolaydymura)
- [Egor Terekhov](https://github.com/EgorEko)
- [Nataliia Zabiiaka](https://github.com/nataliiazabiiaka)