
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

<p align="center">
<a href="https://pub.dev/packages/flutter_core_image_filters"><img src="https://img.shields.io/pub/v/flutter_core_image_filters.svg" alt="Pub"></a>
<a href="https://codecov.io/gh/nikolaydymura/flutter_core_image_filters"><img src="https://codecov.io/gh/nikolaydymura/flutter_core_image_filters/main/master/graph/badge.svg" alt="codecov"></a>
<a href="https://github.com/nikolaydymura/flutter_core_image_filters/actions"><img src="https://github.com/nikolaydymura/flutter_core_image_filters/actions/workflows/flutter_core_image_filters.yaml/badge.svg" alt="build"></a>
<a href="https://github.com/nikolaydymura/flutter_core_image_filters"><img src="https://img.shields.io/github/stars/nikolaydymura/flutter_core_image_filters.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

A flutter package for iOS and MacOS for applying CoreImage filters to image.

## Usage

### Export processed image

```dart
final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = BrightnessShaderConfiguration();
configuration.brightness = 0.5;
final image = await configuration.export(texture, texture.size);
```

### LookupTable sample
![LUT](https://raw.githubusercontent.com/nikolaydymura/flutter_image_filters/main/demos/lookup_amatorka.png)
```dart
final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = LookupTableShaderConfiguration();
configuration.size = 8;
configuration.rows = 8;
configuration.columns = 8;
await configuration.setLutAsset('lookup_amatorka.png');
final image = await configuration.export(texture, texture.size);
```

### LookupTable HALD sample
![LUT](https://raw.githubusercontent.com/nikolaydymura/flutter_image_filters/main/demos/lookup_hald.png)
```dart
final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = LookupTableShaderConfiguration();
configuration.size = 8;
configuration.rows = 64;
configuration.columns = 8;
await configuration.setLutAsset('lookup_hald.png');
final image = await configuration.export(texture, texture.size);
```

### ImageShaderPreview example
```dart
import 'package:flutter_image_filters/flutter_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late TextureSource texture;
  late BrightnessShaderConfiguration configuration;
  bool textureLoaded = false;

  @override
  void initState() {
    super.initState();
    configuration = BrightnessShaderConfiguration();
    configuration.brightness = 0.5;
    TextureSource.fromAsset('demo.jpeg')
        .then((value) => texture = value)
        .whenComplete(
          () => setState(() {
            textureLoaded = true;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return textureLoaded
        ? ImageShaderPreview(
            texture: texture,
            configuration: configuration,
          )
        : const Offstage();
  }
}
```

### Divided preview sample
```dart
import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late TextureSource texture;
  late BrightnessShaderConfiguration configuration;
  bool textureLoaded = false;

  @override
  void initState() {
    super.initState();
    configuration = BrightnessShaderConfiguration();
    configuration.brightness = 0.5;
    TextureSource.fromAsset('demo.jpeg')
        .then((value) => texture = value)
        .whenComplete(
          () => setState(() {
            textureLoaded = true;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return textureLoaded
        ? BeforeAfter(
            thumbRadius: 0.0,
            thumbColor: Colors.transparent,
            beforeImage: ImageShaderPreview(
              texture: texture,
              configuration: NoneShaderConfiguration(),
            ),
            afterImage: ImageShaderPreview(
              texture: texture,
              configuration: configuration,
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



final texture = await TextureSource.fromAsset('demo.jpeg');
final configuration = BrightnessShaderConfiguration();
configuration.brightness = 0.5;
final image = await configuration.export(texture, texture.size);

final directory = await getTemporaryDirectory();
final output =
File('${directory.path}/result.jpeg');
final bytes = await image.toByteData();
final persistedImage = img.Image.fromBytes(
  image.width,
  image.height,
  bytes!.buffer.asUint8List(),
);
img.JpegEncoder encoder = img.JpegEncoder();
final data = encoder.encodeImage(persistedImage);
await output.writeAsBytes(data);
```

## Additional information

### Support status of [CoreImage filters](https://cifilter.io/)

| Status             | Name                              | Display Name                      |
|:-------------------|:----------------------------------|:----------------------------------|
| :x:                | CIAccordionFoldTransition         | Accordion Fold Transition         |
| :x:                | CIAdditionCompositing             | Addition                          |
| :x:                | CIAffineClamp                     | Affine Clamp                      |
| :x:                | CIAffineTile                      | Affine Tile                       |
| :x:                | CIAffineTransform                 | Affine Transform                  |
| :x:                | CIAreaAverage                     | Area Average                      |
| :x:                | CIAreaHistogram                   | Area Histogram                    |
| :x:                | CIAreaLogarithmicHistogram        | Area Logarithmic Histogram        |
| :x:                | CIAreaMaximum                     | Area Maximum                      |
| :x:                | CIAreaMaximumAlpha                | Area Maximum Alpha                |
| :x:                | CIAreaMinimum                     | Area Minimum                      |
| :x:                | CIAreaMinimumAlpha                | Area Minimum Alpha                |
| :x:                | CIAreaMinMax                      | Area Min and Max                  |
| :x:                | CIAreaMinMaxRed                   | Area Min and Max Red              |
| :x:                | CIAttributedTextImageGenerator    | Attributed Text Image Generator   |
| :x:                | CIAztecCodeGenerator              | Aztec Code Generator              |
| :x:                | CIBarcodeGenerator                | Barcode Generator                 |
| :x:                | CIBarsSwipeTransition             | Bars Swipe Transition             |
| :x:                | CIBicubicScaleTransform           | Bicubic Scale Transform           |
| :x:                | CIBlendWithAlphaMask              | Blend With Alpha Mask             |
| :x:                | CIBlendWithBlueMask               | Blend With Blue Mask              |
| :x:                | CIBlendWithMask                   | Blend With Mask                   |
| :x:                | CIBlendWithRedMask                | Blend With Red Mask               |
| :x:                | CIBloom                           | Bloom                             |
| :x:                | CIBokehBlur                       | Bokeh Blur                        |
| :x:                | CIBoxBlur                         | Box Blur                          |
| :x:                | CIBumpDistortion                  | Bump Distortion                   |
| :x:                | CIBumpDistortionLinear            | Bump Distortion Linear            |
| :x:                | CICameraCalibrationLensCorrection | Lens Correction for AVC           |
| :x:                | CICheckerboardGenerator           | Checkerboard                      |
| :x:                | CICircleSplashDistortion          | Circle Splash Distortion          |
| :x:                | CICircularScreen                  | Circular Screen                   |
| :x:                | CICircularWrap                    | Circular Wrap Distortion          |
| :x:                | CIClamp                           | Clamp                             |
| :x:                | CICMYKHalftone                    | CMYK Halftone                     |
| :x:                | CICode128BarcodeGenerator         | Code 128 Barcode Generator        |
| :x:                | CIColorAbsoluteDifference         | Color Absolute Difference         |
| :x:                | CIColorBlendMode                  | Color Blend Mode                  |
| :x:                | CIColorBurnBlendMode              | Color Burn Blend Mode             |
| :x:                | CIColorClamp                      | Color Clamp                       |
| :x:                | CIColorControls                   | Color Controls                    |
| :x:                | CIColorCrossPolynomial            | Color Cross Polynomial            |
| :x:                | CIColorCube                       | Color Cube                        |
| :x:                | CIColorCubesMixedWithMask         | Color Cubes Mixed With Mask       |
| :x:                | CIColorCubeWithColorSpace         | Color Cube with ColorSpace        |
| :x:                | CIColorCurves                     | Color Curves                      |
| :x:                | CIColorDodgeBlendMode             | Color Dodge Blend Mode            |
| :x:                | CIColorInvert                     | Color Invert                      |
| :x:                | CIColorMap                        | Color Map                         |
| :x:                | CIColorMatrix                     | Color Matrix                      |
| :x:                | CIColorMonochrome                 | Color Monochrome                  |
| :x:                | CIColorPolynomial                 | Color Polynomial                  |
| :x:                | CIColorPosterize                  | Color Posterize                   |
| :x:                | CIColorThreshold                  | Color Threshold                   |
| :x:                | CIColorThresholdOtsu              | Color Threshold Otsu              |
| :x:                | CIColumnAverage                   | Column Average                    |
| :x:                | CIComicEffect                     | Comic Effect                      |
| :x:                | CIConstantColorGenerator          | Constant Color                    |
| :x:                | CIConvertLabToRGB                 | Convert Lab to RGB                |
| :x:                | CIConvertRGBtoLab                 | Convert RGB to Lab                |
| :x:                | CIConvolution3X3                  | 3 by 3 Convolution                |
| :x:                | CIConvolution5X5                  | 5 by 5 Convolution                |
| :x:                | CIConvolution7X7                  | 7 by 7 Convolution                |
| :x:                | CIConvolution9Horizontal          | Horizontal 9 Convolution          |
| :x:                | CIConvolution9Vertical            | Vertical 9 Convolution            |
| :x:                | CIConvolutionRGB3X3               | 3 by 3 RGB Convolution            |
| :x:                | CIConvolutionRGB5X5               | 5 by 5 RGB Convolution            |
| :x:                | CIConvolutionRGB7X7               | 7 by 7 RGB Convolution            |
| :x:                | CIConvolutionRGB9Horizontal       | Horizontal 9 RGB Convolution      |
| :x:                | CIConvolutionRGB9Vertical         | Vertical 9 RGB Convolution        |
| :x:                | CICopyMachineTransition           | Copy Machine                      |
| :x:                | CICoreMLModelFilter               | CoreML Model Filter               |
| :x:                | CICrop                            | Crop                              |
| :x:                | CICrystallize                     | Crystallize                       |
| :x:                | CIDarkenBlendMode                 | Darken Blend Mode                 |
| :x:                | CIDepthBlurEffect                 | Depth Blur Effect                 |
| :x:                | CIDepthOfField                    | Depth of Field                    |
| :x:                | CIDepthToDisparity                | Depth To Disparity                |
| :x:                | CIDifferenceBlendMode             | Difference Blend Mode             |
| :x:                | CIDiscBlur                        | Disc Blur                         |
| :x:                | CIDisintegrateWithMaskTransition  | Disintegrate With Mask            |
| :x:                | CIDisparityToDepth                | Disparity To Depth                |
| :x:                | CIDisplacementDistortion          | Displacement Distortion           |
| :x:                | CIDissolveTransition              | Dissolve                          |
| :x:                | CIDither                          | Dither                            |
| :x:                | CIDivideBlendMode                 | Divide Blend Mode                 |
| :x:                | CIDocumentEnhancer                | Document Enhancer                 |
| :x:                | CIDotScreen                       | Dot Screen                        |
| :x:                | CIDroste                          | Droste                            |
| :x:                | CIEdgePreserveUpsampleFilter      | Edge Preserve Upsample Filter     |
| :x:                | CIEdges                           | Edges                             |
| :x:                | CIEdgeWork                        | Edge Work                         |
| :x:                | CIEightfoldReflectedTile          | Eightfold Reflected Tile          |
| :x:                | CIExclusionBlendMode              | Exclusion Blend Mode              |
| :x:                | CIExposureAdjust                  | Exposure Adjust                   |
| :x:                | CIFalseColor                      | False Color                       |
| :x:                | CIFlashTransition                 | Flash                             |
| :x:                | CIFourfoldReflectedTile           | Fourfold Reflected Tile           |
| :x:                | CIFourfoldRotatedTile             | Fourfold Rotated Tile             |
| :x:                | CIFourfoldTranslatedTile          | Fourfold Translated Tile          |
| :x:                | CIGaborGradients                  | Gabor Gradients                   |
| :x:                | CIGammaAdjust                     | Gamma Adjust                      |
| :x:                | CIGaussianBlur                    | Gaussian Blur                     |
| :x:                | CIGaussianGradient                | Gaussian Gradient                 |
| :x:                | CIGlassDistortion                 | Glass Distortion                  |
| :x:                | CIGlassLozenge                    | Glass Lozenge                     |
| :x:                | CIGlideReflectedTile              | Glide Reflected Tile              |
| :x:                | CIGloom                           | Gloom                             |
| :x:                | CIGuidedFilter                    | Guided Filter                     |
| :x:                | CIHardLightBlendMode              | Hard Light Blend Mode             |
| :x:                | CIHatchedScreen                   | Hatched Screen                    |
| :x:                | CIHeightFieldFromMask             | Height Field From Mask            |
| :x:                | CIHexagonalPixellate              | Hexagonal Pixelate                |
| :x:                | CIHighlightShadowAdjust           | Highlight and Shadow Adjust       |
| :x:                | CIHistogramDisplayFilter          | Histogram Display                 |
| :x:                | CIHoleDistortion                  | Hole Distortion                   |
| :x:                | CIHueAdjust                       | Hue Adjust                        |
| :x:                | CIHueBlendMode                    | Hue Blend Mode                    |
| :x:                | CIHueSaturationValueGradient      | Hue/Saturation/Value Gradient     |
| :x:                | CIKaleidoscope                    | Kaleidoscope                      |
| :x:                | CIKeystoneCorrectionCombined      | Combined Keystone Correction      |
| :x:                | CIKeystoneCorrectionHorizontal    | Horizontal Keystone Correction    |
| :x:                | CIKeystoneCorrectionVertical      | Vertical Keystone Correction      |
| :x:                | CIKMeans                          | KMeans                            |
| :x:                | CILabDeltaE                       | Lab ∆E                            |
| :x:                | CILanczosScaleTransform           | Lanczos Scale Transform           |
| :x:                | CILenticularHaloGenerator         | Lenticular Halo                   |
| :x:                | CILightenBlendMode                | Lighten Blend Mode                |
| :x:                | CILightTunnel                     | Light Tunnel Distortion           |
| :x:                | CILinearBurnBlendMode             | Linear Burn Blend Mode            |
| :x:                | CILinearDodgeBlendMode            | Linear Dodge Blend Mode           |
| :x:                | CILinearGradient                  | Linear Gradient                   |
| :x:                | CILinearLightBlendMode            | Linear Light Blend Mode           |
| :x:                | CILinearToSRGBToneCurve           | Linear to sRGB Tone Curve         |
| :x:                | CILineOverlay                     | Line Overlay                      |
| :x:                | CILineScreen                      | Line Screen                       |
| :x:                | CILuminosityBlendMode             | Luminosity Blend Mode             |
| :x:                | CIMaskedVariableBlur              | Masked Variable Blur              |
| :x:                | CIMaskToAlpha                     | Mask to Alpha                     |
| :x:                | CIMaximumComponent                | Maximum Component                 |
| :x:                | CIMaximumCompositing              | Maximum                           |
| :x:                | CIMedianFilter                    | Median                            |
| :x:                | CIMeshGenerator                   | Mesh Generator                    |
| :x:                | CIMinimumComponent                | Minimum Component                 |
| :x:                | CIMinimumCompositing              | Minimum                           |
| :x:                | CIMix                             | Mix                               |
| :x:                | CIModTransition                   | Mod                               |
| :x:                | CIMorphologyGradient              | Morphology Gradient               |
| :x:                | CIMorphologyMaximum               | Morphology Maximum                |
| :x:                | CIMorphologyMinimum               | Morphology Minimum                |
| :x:                | CIMorphologyRectangleMaximum      | Morphology Rectangle Maximum      |
| :x:                | CIMorphologyRectangleMinimum      | Morphology Rectangle Minimum      |
| :x:                | CIMotionBlur                      | Motion Blur                       |
| :x:                | CIMultiplyBlendMode               | Multiply Blend Mode               |
| :x:                | CIMultiplyCompositing             | Multiply                          |
| :x:                | CINinePartStretched               | Nine Part Stretched               |
| :x:                | CINinePartTiled                   | Nine Part Tiled                   |
| :x:                | CINoiseReduction                  | Noise Reduction                   |
| :x:                | CIOpTile                          | Op Tile                           |
| :x:                | CIOverlayBlendMode                | Overlay Blend Mode                |
| :x:                | CIPageCurlTransition              | Page Curl                         |
| :x:                | CIPageCurlWithShadowTransition    | Page Curl With Shadow             |
| :x:                | CIPaletteCentroid                 | Palette Centroid                  |
| :x:                | CIPalettize                       | Palettize                         |
| :x:                | CIParallelogramTile               | Parallelogram Tile                |
| :x:                | CIPDF417BarcodeGenerator          | PDF417 Barcode Generator          |
| :x:                | CIPersonSegmentation              | Person Segmentation               |
| :x:                | CIPerspectiveCorrection           | Perspective Correction            |
| :x:                | CIPerspectiveRotate               | Perspective Rotate                |
| :x:                | CIPerspectiveTile                 | Perspective Tile                  |
| :x:                | CIPerspectiveTransform            | Perspective Transform             |
| :x:                | CIPerspectiveTransformWithExtent  | Perspective Transform with Extent |
| :white_check_mark: | CIPhotoEffectChrome               | Photo Effect Chrome               |
| :white_check_mark: | CIPhotoEffectFade                 | Photo Effect Fade                 |
| :white_check_mark: | CIPhotoEffectInstant              | Photo Effect Instant              |
| :white_check_mark: | CIPhotoEffectMono                 | Photo Effect Mono                 |
| :white_check_mark: | CIPhotoEffectNoir                 | Photo Effect Noir                 |
| :white_check_mark: | CIPhotoEffectProcess              | Photo Effect Process              |
| :white_check_mark: | CIPhotoEffectTonal                | Photo Effect Tonal                |
| :white_check_mark: | CIPhotoEffectTransfer             | Photo Effect Transfer             |
| :x:                | CIPinchDistortion                 | Pinch Distortion                  |
| :x:                | CIPinLightBlendMode               | Pin Light Blend Mode              |
| :x:                | CIPixellate                       | Pixelate                          |
| :x:                | CIPointillize                     | Pointillize                       |
| :x:                | CIQRCodeGenerator                 | QR Code Generator                 |
| :x:                | CIRadialGradient                  | Radial Gradient                   |
| :x:                | CIRandomGenerator                 | Random Generator                  |
| :x:                | CIRippleTransition                | Ripple                            |
| :x:                | CIRoundedRectangleGenerator       | Rounded Rectangle Generator       |
| :x:                | CIRowAverage                      | Row Average                       |
| :x:                | CISaliencyMapFilter               | Saliency Map Filter               |
| :x:                | CISampleNearest                   | Sample Nearest                    |
| :x:                | CISaturationBlendMode             | Saturation Blend Mode             |
| :x:                | CIScreenBlendMode                 | Screen Blend Mode                 |
| :x:                | CISepiaTone                       | Sepia Tone                        |
| :x:                | CIShadedMaterial                  | Shaded Material                   |
| :x:                | CISharpenLuminance                | Sharpen Luminance                 |
| :x:                | CISixfoldReflectedTile            | Sixfold Reflected Tile            |
| :x:                | CISixfoldRotatedTile              | Sixfold Rotated Tile              |
| :x:                | CISmoothLinearGradient            | Smooth Linear Gradient            |
| :x:                | CISoftLightBlendMode              | Soft Light Blend Mode             |
| :x:                | CISourceAtopCompositing           | Source Atop                       |
| :x:                | CISourceInCompositing             | Source In                         |
| :x:                | CISourceOutCompositing            | Source Out                        |
| :x:                | CISourceOverCompositing           | Source Over                       |
| :x:                | CISpotColor                       | Spot Color                        |
| :x:                | CISpotLight                       | Spot Light                        |
| :x:                | CISRGBToneCurveToLinear           | sRGB Tone Curve to Linear         |
| :x:                | CIStarShineGenerator              | Star Shine                        |
| :x:                | CIStraightenFilter                | Straighten                        |
| :x:                | CIStretchCrop                     | Stretch Crop                      |
| :x:                | CIStripesGenerator                | Stripes                           |
| :x:                | CISubtractBlendMode               | Subtract Blend Mode               |
| :x:                | CISunbeamsGenerator               | Sunbeams                          |
| :x:                | CISwipeTransition                 | Swipe                             |
| :x:                | CITemperatureAndTint              | Temperature and Tint              |
| :x:                | CITextImageGenerator              | Text Image Generator              |
| :x:                | CIThermal                         | Thermal                           |
| :x:                | CIToneCurve                       | Tone Curve                        |
| :x:                | CITorusLensDistortion             | Torus Lens Distortion             |
| :x:                | CITriangleKaleidoscope            | Triangle Kaleidoscope             |
| :x:                | CITriangleTile                    | Triangle Tile                     |
| :x:                | CITwelvefoldReflectedTile         | Twelvefold Reflected Tile         |
| :x:                | CITwirlDistortion                 | Twirl Distortion                  |
| :x:                | CIUnsharpMask                     | Unsharp Mask                      |
| :x:                | CIVibrance                        | Vibrance                          |
| :x:                | CIVignette                        | Vignette                          |
| :x:                | CIVignetteEffect                  | Vignette Effect                   |
| :x:                | CIVividLightBlendMode             | Vivid Light Blend Mode            |
| :x:                | CIVortexDistortion                | Vortex Distortion                 |
| :x:                | CIWhitePointAdjust                | White Point Adjust                |
| :x:                | CIXRay                            | X-Ray                             |
| :x:                | CIZoomBlur                        | Zoom Blur                         |

### Sample results

![Brightness](https://raw.githubusercontent.com/nikolaydymura/flutter_image_filters/main/demos/Brightness.jpg)

## Examples

- [Big Flutter Filters Demo](https://github.com/nikolaydymura/image_filters_example) - big example of how to use filters and.

## Maintainers

- [Nikolay Dymura](https://github.com/nikolaydymura)
- [Egor Terekhov](https://github.com/EgorEko)