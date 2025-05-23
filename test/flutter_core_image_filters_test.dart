import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify amount', () {
    expect(
      FlutterCoreImageFilters.availableFilters.length,
      greaterThanOrEqualTo(232),
    );
  });
  test('enlist all', () async {
    final filters = [
      'Accordion Fold Transition',
      'Addition',
      'Affine Clamp',
      'Affine Tile',
      'Affine Transform',
      'Area Average',
      'Area Histogram',
      'Area Logarithmic Histogram',
      'Area Maximum',
      'Area Maximum Alpha',
      'Area Minimum',
      'Area Minimum Alpha',
      'Area Min and Max',
      'Area Min and Max Red',
      'Attributed Text Image Generator',
      'Aztec Code Generator',
      'Barcode Generator',
      'Bars Swipe Transition',
      'Bicubic Scale Transform',
      'Blend With Alpha Mask',
      'Blend With Blue Mask',
      'Blend With Mask',
      'Blend With Red Mask',
      'Bloom',
      'Bokeh Blur',
      'Box Blur',
      'Bump Distortion',
      'Bump Distortion Linear',
      //TODO: unsupported 'Lens Correction for AVC',
      'Checkerboard',
      'Circle Splash Distortion',
      'Circular Screen',
      'Circular Wrap Distortion',
      'Clamp',
      'CMYK Halftone',
      'Code 128 Barcode Generator',
      'Color Absolute Difference',
      'Color Blend Mode',
      'Color Burn Blend Mode',
      'Color Clamp',
      'Color Controls',
      'Color Cross Polynomial',
      'Color Cube',
      'Color Cubes Mixed With Mask',
      'Color Cube with ColorSpace',
      'Color Curves',
      'Color Dodge Blend Mode',
      'Color Invert',
      'Color Map',
      'Color Matrix',
      'Color Monochrome',
      'Color Polynomial',
      'Color Posterize',
      'Color Threshold',
      'Color Threshold Otsu',
      'Column Average',
      'Comic Effect',
      'Constant Color',
      'Convert Lab to RGB',
      'Convert RGB to Lab',
      '3 by 3 Convolution',
      '5 by 5 Convolution',
      '7 by 7 Convolution',
      'Horizontal 9 Convolution',
      'Vertical 9 Convolution',
      '3 by 3 RGB Convolution',
      '5 by 5 RGB Convolution',
      '7 by 7 RGB Convolution',
      'Horizontal 9 RGB Convolution',
      'Vertical 9 RGB Convolution',
      'Copy Machine',
      //TODO: unsupported 'CoreML Model Filter',
      'Crop',
      'Crystallize',
      'Darken Blend Mode',
      'Depth Blur Effect',
      'Depth of Field',
      'Depth To Disparity',
      'Difference Blend Mode',
      'Disc Blur',
      'Disintegrate With Mask',
      'Disparity To Depth',
      'Displacement Distortion',
      'Dissolve',
      'Dither',
      'Divide Blend Mode',
      'Document Enhancer',
      'Dot Screen',
      'Droste',
      'Edge Preserve Upsample Filter',
      'Edges',
      'Edge Work',
      'Eightfold Reflected Tile',
      'Exclusion Blend Mode',
      'Exposure Adjust',
      'False Color',
      'Flash',
      'Fourfold Reflected Tile',
      'Fourfold Rotated Tile',
      'Fourfold Translated Tile',
      'Gabor Gradients',
      'Gamma Adjust',
      'Gaussian Blur',
      'Gaussian Gradient',
      'Glass Distortion',
      'Glass Lozenge',
      'Glide Reflected Tile',
      'Gloom',
      'Guided Filter',
      'Hard Light Blend Mode',
      'Hatched Screen',
      'Height Field From Mask',
      'Hexagonal Pixelate',
      'Highlight and Shadow Adjust',
      'Histogram Display',
      'Hole Distortion',
      'Hue Adjust',
      'Hue Blend Mode',
      'Hue/Saturation/Value Gradient',
      'Kaleidoscope',
      'Combined Keystone Correction',
      'Horizontal Keystone Correction',
      'Vertical Keystone Correction',
      'KMeans',
      'Lab ∆E',
      'Lanczos Scale Transform',
      'Lenticular Halo',
      'Lighten Blend Mode',
      'Light Tunnel Distortion',
      'Linear Burn Blend Mode',
      'Linear Dodge Blend Mode',
      'Linear Gradient',
      'Linear Light Blend Mode',
      'Linear to sRGB Tone Curve',
      'Line Overlay',
      'Line Screen',
      'Luminosity Blend Mode',
      'Masked Variable Blur',
      'Mask to Alpha',
      'Maximum Component',
      'Maximum',
      'Median',
      'Mesh Generator',
      'Minimum Component',
      'Minimum',
      'Mix',
      'Mod',
      'Morphology Gradient',
      'Morphology Maximum',
      'Morphology Minimum',
      'Morphology Rectangle Maximum',
      'Morphology Rectangle Minimum',
      'Motion Blur',
      'Multiply Blend Mode',
      'Multiply',
      'Nine Part Stretched',
      'Nine Part Tiled',
      'Noise Reduction',
      'Op Tile',
      'Overlay Blend Mode',
      'Page Curl',
      'Page Curl With Shadow',
      'Palette Centroid',
      'Palettize',
      'Parallelogram Tile',
      'PDF417 Barcode Generator',
      'Person Segmentation',
      'Perspective Correction',
      'Perspective Rotate',
      'Perspective Tile',
      'Perspective Transform',
      'Perspective Transform with Extent',
      'Photo Effect Chrome',
      'Photo Effect Fade',
      'Photo Effect Instant',
      'Photo Effect Mono',
      'Photo Effect Noir',
      'Photo Effect Process',
      'Photo Effect Tonal',
      'Photo Effect Transfer',
      'Pinch Distortion',
      'Pin Light Blend Mode',
      'Pixelate',
      'Pointillize',
      'QR Code Generator',
      'Radial Gradient',
      'Random Generator',
      'Ripple',
      'Rounded Rectangle Generator',
      'Row Average',
      'Saliency Map Filter',
      'Sample Nearest',
      'Saturation Blend Mode',
      'Screen Blend Mode',
      'Sepia Tone',
      'Shaded Material',
      'Sharpen Luminance',
      'Sixfold Reflected Tile',
      'Sixfold Rotated Tile',
      'Smooth Linear Gradient',
      'Soft Light Blend Mode',
      'Source Atop',
      'Source In',
      'Source Out',
      'Source Over',
      'Spot Color',
      'Spot Light',
      'sRGB Tone Curve to Linear',
      'Star Shine',
      'Straighten',
      'Stretch Crop',
      'Stripes',
      'Subtract Blend Mode',
      'Sunbeams',
      'Swipe',
      'Temperature and Tint',
      'Text Image Generator',
      'Thermal',
      'Tone Curve',
      'Torus Lens Distortion',
      'Triangle Kaleidoscope',
      'Triangle Tile',
      'Twelvefold Reflected Tile',
      'Twirl Distortion',
      'Unsharp Mask',
      'Vibrance',
      'Vignette',
      'Vignette Effect',
      'Vivid Light Blend Mode',
      'Vortex Distortion',
      'White Point Adjust',
      'X-Ray',
      'Zoom Blur',
    ];
    for (final name in filters) {
      final configuration = FlutterCoreImageFilters.createFilter(
        displayName: name,
      );
      expect(configuration, isNotNull, reason: '`$name` not implemented');
    }
    for (final name in FlutterCoreImageFilters.availableFilters) {
      if (name.contains('Lookup Table')) {
        continue;
      }
      expect(filters.contains(name), true);
    }
  });
  test('video only', () async {
    final filters = [
      'Accordion Fold Transition',
      'Addition',
      'Affine Clamp',
      'Affine Tile',
      'Affine Transform',
      'Area Average',
      'Area Histogram',
      'Area Logarithmic Histogram',
      'Area Maximum',
      'Area Maximum Alpha',
      'Area Minimum',
      'Area Minimum Alpha',
      'Area Min and Max',
      'Area Min and Max Red',
      'Attributed Text Image Generator',
      'Barcode Generator',
      'Bars Swipe Transition',
      'Bicubic Scale Transform',
      'Blend With Alpha Mask',
      'Blend With Blue Mask',
      'Blend With Mask',
      'Blend With Red Mask',
      'Bloom',
      'Bokeh Blur',
      'Box Blur',
      'Bump Distortion',
      'Bump Distortion Linear',
      //TODO: unsupported 'Lens Correction for AVC',
      'Checkerboard',
      'Circle Splash Distortion',
      'Circular Screen',
      'Circular Wrap Distortion',
      'Clamp',
      'CMYK Halftone',
      'Color Absolute Difference',
      'Color Blend Mode',
      'Color Burn Blend Mode',
      'Color Clamp',
      'Color Controls',
      'Color Cross Polynomial',
      'Color Cube',
      'Color Cubes Mixed With Mask',
      'Color Cube with ColorSpace',
      'Color Curves',
      'Color Dodge Blend Mode',
      'Color Invert',
      'Color Map',
      'Color Matrix',
      'Color Monochrome',
      'Color Polynomial',
      'Color Posterize',
      'Color Threshold',
      'Color Threshold Otsu',
      'Column Average',
      'Comic Effect',
      'Constant Color',
      'Convert Lab to RGB',
      'Convert RGB to Lab',
      '3 by 3 Convolution',
      '5 by 5 Convolution',
      '7 by 7 Convolution',
      'Horizontal 9 Convolution',
      'Vertical 9 Convolution',
      '3 by 3 RGB Convolution',
      '5 by 5 RGB Convolution',
      '7 by 7 RGB Convolution',
      'Horizontal 9 RGB Convolution',
      'Vertical 9 RGB Convolution',
      'Copy Machine',
      //TODO: unsupported 'CoreML Model Filter',
      'Crop',
      'Crystallize',
      'Darken Blend Mode',
      'Depth Blur Effect',
      'Depth of Field',
      'Depth To Disparity',
      'Difference Blend Mode',
      'Disc Blur',
      'Disintegrate With Mask',
      'Disparity To Depth',
      'Displacement Distortion',
      'Dissolve',
      'Dither',
      'Divide Blend Mode',
      'Dot Screen',
      'Droste',
      'Edge Preserve Upsample Filter',
      'Edges',
      'Edge Work',
      'Eightfold Reflected Tile',
      'Exclusion Blend Mode',
      'Exposure Adjust',
      'False Color',
      'Flash',
      'Fourfold Reflected Tile',
      'Fourfold Rotated Tile',
      'Fourfold Translated Tile',
      'Gabor Gradients',
      'Gamma Adjust',
      'Gaussian Blur',
      'Gaussian Gradient',
      'Glass Distortion',
      'Glass Lozenge',
      'Glide Reflected Tile',
      'Gloom',
      'Guided Filter',
      'Hard Light Blend Mode',
      'Hatched Screen',
      'Height Field From Mask',
      'Hexagonal Pixelate',
      'Highlight and Shadow Adjust',
      'Histogram Display',
      'Hole Distortion',
      'Hue Adjust',
      'Hue Blend Mode',
      'Hue/Saturation/Value Gradient',
      'Kaleidoscope',
      'Combined Keystone Correction',
      'Horizontal Keystone Correction',
      'Vertical Keystone Correction',
      'KMeans',
      'Lab ∆E',
      'Lanczos Scale Transform',
      'Lenticular Halo',
      'Lighten Blend Mode',
      'Light Tunnel Distortion',
      'Linear Burn Blend Mode',
      'Linear Dodge Blend Mode',
      'Linear Gradient',
      'Linear Light Blend Mode',
      'Linear to sRGB Tone Curve',
      'Line Overlay',
      'Line Screen',
      'Luminosity Blend Mode',
      'Masked Variable Blur',
      'Mask to Alpha',
      'Maximum Component',
      'Maximum',
      'Median',
      'Mesh Generator',
      'Minimum Component',
      'Minimum',
      'Mix',
      'Mod',
      'Morphology Gradient',
      'Morphology Maximum',
      'Morphology Minimum',
      'Morphology Rectangle Maximum',
      'Morphology Rectangle Minimum',
      'Motion Blur',
      'Multiply Blend Mode',
      'Multiply',
      'Nine Part Stretched',
      'Nine Part Tiled',
      'Noise Reduction',
      'Op Tile',
      'Overlay Blend Mode',
      'Page Curl',
      'Page Curl With Shadow',
      'Palette Centroid',
      'Palettize',
      'Parallelogram Tile',
      'PDF417 Barcode Generator',
      'Person Segmentation',
      'Perspective Correction',
      'Perspective Rotate',
      'Perspective Tile',
      'Perspective Transform',
      'Perspective Transform with Extent',
      'Photo Effect Chrome',
      'Photo Effect Fade',
      'Photo Effect Instant',
      'Photo Effect Mono',
      'Photo Effect Noir',
      'Photo Effect Process',
      'Photo Effect Tonal',
      'Photo Effect Transfer',
      'Pinch Distortion',
      'Pin Light Blend Mode',
      'Pixelate',
      'Pointillize',
      'Radial Gradient',
      'Random Generator',
      'Ripple',
      'Row Average',
      'Saliency Map Filter',
      'Sample Nearest',
      'Saturation Blend Mode',
      'Screen Blend Mode',
      'Sepia Tone',
      'Shaded Material',
      'Sharpen Luminance',
      'Sixfold Reflected Tile',
      'Sixfold Rotated Tile',
      'Smooth Linear Gradient',
      'Soft Light Blend Mode',
      'Source Atop',
      'Source In',
      'Source Out',
      'Source Over',
      'Spot Color',
      'Spot Light',
      'sRGB Tone Curve to Linear',
      'Star Shine',
      'Straighten',
      'Stretch Crop',
      'Stripes',
      'Subtract Blend Mode',
      'Sunbeams',
      'Swipe',
      'Temperature and Tint',
      'Text Image Generator',
      'Thermal',
      'Tone Curve',
      'Torus Lens Distortion',
      'Triangle Kaleidoscope',
      'Triangle Tile',
      'Twelvefold Reflected Tile',
      'Twirl Distortion',
      'Unsharp Mask',
      'Vibrance',
      'Vignette',
      'Vignette Effect',
      'Vivid Light Blend Mode',
      'Vortex Distortion',
      'White Point Adjust',
      'X-Ray',
      'Zoom Blur',
    ];
    for (final name in filters) {
      final configuration = FlutterCoreImageFilters.createFilter(
        displayName: name,
      );
      expect(
        configuration.categories.contains(CICategory.video),
        true,
        reason: '`$name` not supported',
      );
    }
  });
  test('image only', () async {
    final filters = [
      'Accordion Fold Transition',
      'Addition',
      'Affine Clamp',
      'Affine Tile',
      'Affine Transform',
      'Area Average',
      'Area Histogram',
      'Area Logarithmic Histogram',
      'Area Maximum',
      'Area Maximum Alpha',
      'Area Minimum',
      'Area Minimum Alpha',
      'Area Min and Max',
      'Area Min and Max Red',
      'Attributed Text Image Generator',
      'Aztec Code Generator',
      'Barcode Generator',
      'Bars Swipe Transition',
      'Bicubic Scale Transform',
      'Blend With Alpha Mask',
      'Blend With Blue Mask',
      'Blend With Mask',
      'Blend With Red Mask',
      'Bloom',
      'Bokeh Blur',
      'Box Blur',
      'Bump Distortion',
      'Bump Distortion Linear',
      //TODO: unsupported 'Lens Correction for AVC',
      'Checkerboard',
      'Circle Splash Distortion',
      'Circular Screen',
      'Circular Wrap Distortion',
      'Clamp',
      'CMYK Halftone',
      'Code 128 Barcode Generator',
      'Color Absolute Difference',
      'Color Blend Mode',
      'Color Burn Blend Mode',
      'Color Clamp',
      'Color Controls',
      'Color Cross Polynomial',
      'Color Cube',
      'Color Cubes Mixed With Mask',
      'Color Cube with ColorSpace',
      'Color Curves',
      'Color Dodge Blend Mode',
      'Color Invert',
      'Color Map',
      'Color Matrix',
      'Color Monochrome',
      'Color Polynomial',
      'Color Posterize',
      'Color Threshold',
      'Color Threshold Otsu',
      'Column Average',
      'Comic Effect',
      'Constant Color',
      'Convert Lab to RGB',
      'Convert RGB to Lab',
      '3 by 3 Convolution',
      '5 by 5 Convolution',
      '7 by 7 Convolution',
      'Horizontal 9 Convolution',
      'Vertical 9 Convolution',
      '3 by 3 RGB Convolution',
      '5 by 5 RGB Convolution',
      '7 by 7 RGB Convolution',
      'Horizontal 9 RGB Convolution',
      'Vertical 9 RGB Convolution',
      'Copy Machine',
      //TODO: unsupported 'CoreML Model Filter',
      'Crop',
      'Crystallize',
      'Darken Blend Mode',
      'Depth Blur Effect',
      'Depth of Field',
      'Depth To Disparity',
      'Difference Blend Mode',
      'Disc Blur',
      'Disintegrate With Mask',
      'Disparity To Depth',
      'Displacement Distortion',
      'Dissolve',
      'Dither',
      'Divide Blend Mode',
      'Document Enhancer',
      'Dot Screen',
      'Droste',
      'Edge Preserve Upsample Filter',
      'Edges',
      'Edge Work',
      'Eightfold Reflected Tile',
      'Exclusion Blend Mode',
      'Exposure Adjust',
      'False Color',
      'Flash',
      'Fourfold Reflected Tile',
      'Fourfold Rotated Tile',
      'Fourfold Translated Tile',
      'Gabor Gradients',
      'Gamma Adjust',
      'Gaussian Blur',
      'Gaussian Gradient',
      'Glass Distortion',
      'Glass Lozenge',
      'Glide Reflected Tile',
      'Gloom',
      'Guided Filter',
      'Hard Light Blend Mode',
      'Hatched Screen',
      'Height Field From Mask',
      'Hexagonal Pixelate',
      'Highlight and Shadow Adjust',
      'Histogram Display',
      'Hole Distortion',
      'Hue Adjust',
      'Hue Blend Mode',
      'Hue/Saturation/Value Gradient',
      'Kaleidoscope',
      'Combined Keystone Correction',
      'Horizontal Keystone Correction',
      'Vertical Keystone Correction',
      'KMeans',
      'Lab ∆E',
      'Lanczos Scale Transform',
      'Lenticular Halo',
      'Lighten Blend Mode',
      'Light Tunnel Distortion',
      'Linear Burn Blend Mode',
      'Linear Dodge Blend Mode',
      'Linear Gradient',
      'Linear Light Blend Mode',
      'Linear to sRGB Tone Curve',
      'Line Overlay',
      'Line Screen',
      'Luminosity Blend Mode',
      'Masked Variable Blur',
      'Mask to Alpha',
      'Maximum Component',
      'Maximum',
      'Median',
      'Mesh Generator',
      'Minimum Component',
      'Minimum',
      'Mix',
      'Mod',
      'Morphology Gradient',
      'Morphology Maximum',
      'Morphology Minimum',
      'Morphology Rectangle Maximum',
      'Morphology Rectangle Minimum',
      'Motion Blur',
      'Multiply Blend Mode',
      'Multiply',
      'Nine Part Stretched',
      'Nine Part Tiled',
      'Noise Reduction',
      'Op Tile',
      'Overlay Blend Mode',
      'Page Curl',
      'Page Curl With Shadow',
      'Palette Centroid',
      'Palettize',
      'Parallelogram Tile',
      'PDF417 Barcode Generator',
      'Person Segmentation',
      'Perspective Correction',
      'Perspective Rotate',
      'Perspective Tile',
      'Perspective Transform',
      'Perspective Transform with Extent',
      'Photo Effect Chrome',
      'Photo Effect Fade',
      'Photo Effect Instant',
      'Photo Effect Mono',
      'Photo Effect Noir',
      'Photo Effect Process',
      'Photo Effect Tonal',
      'Photo Effect Transfer',
      'Pinch Distortion',
      'Pin Light Blend Mode',
      'Pixelate',
      'Pointillize',
      'QR Code Generator',
      'Radial Gradient',
      'Random Generator',
      'Ripple',
      'Rounded Rectangle Generator',
      'Row Average',
      'Saliency Map Filter',
      'Sample Nearest',
      'Saturation Blend Mode',
      'Screen Blend Mode',
      'Sepia Tone',
      'Shaded Material',
      'Sharpen Luminance',
      'Sixfold Reflected Tile',
      'Sixfold Rotated Tile',
      'Smooth Linear Gradient',
      'Soft Light Blend Mode',
      'Source Atop',
      'Source In',
      'Source Out',
      'Source Over',
      'Spot Color',
      'Spot Light',
      'sRGB Tone Curve to Linear',
      'Star Shine',
      'Straighten',
      'Stretch Crop',
      'Stripes',
      'Subtract Blend Mode',
      'Sunbeams',
      'Swipe',
      'Temperature and Tint',
      'Text Image Generator',
      'Thermal',
      'Tone Curve',
      'Torus Lens Distortion',
      'Triangle Kaleidoscope',
      'Triangle Tile',
      'Twelvefold Reflected Tile',
      'Twirl Distortion',
      'Unsharp Mask',
      'Vibrance',
      'Vignette',
      'Vignette Effect',
      'Vivid Light Blend Mode',
      'Vortex Distortion',
      'White Point Adjust',
      'X-Ray',
      'Zoom Blur',
    ];
    for (final name in filters) {
      final configuration = FlutterCoreImageFilters.createFilter(
        displayName: name,
      );
      expect(
        configuration.categories.contains(CICategory.stillImage),
        true,
        reason: '`$name` not supported',
      );
    }
    for (final name in FlutterCoreImageFilters.availableFilters) {
      if (name.contains('Lookup Table')) {
        continue;
      }
      expect(filters.contains(name), true);
    }
  });
}
