import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'matchers.dart';

const filters = [
  'Area Average',
  'Area Histogram',
  'Area Logarithmic Histogram',
  'Area Maximum',
  'Area Maximum Alpha',
  'Area Minimum',
  'Area Minimum Alpha',
  'Area Min and Max',
  'Area Min and Max Red',
  'Bump Distortion',
  'Bump Distortion Linear',
  'Checkerboard',
  'Circle Splash Distortion',
  'Circular Screen',
  'Circular Wrap Distortion',
  'Clamp',
  'CMYK Halftone',
  'Color Clamp',
  'Color Cross Polynomial',
  'Color Matrix',
  'Color Polynomial',
  'Column Average',
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
  'Crop',
  'Crystallize',
  'Depth of Field',
  'Dot Screen',
  'Droste',
  'Eightfold Reflected Tile',
  'Fourfold Reflected Tile',
  'Fourfold Rotated Tile',
  'Fourfold Translated Tile',
  'Gaussian Gradient',
  'Glass Lozenge',
  'Glide Reflected Tile',
  'Hatched Screen',
  'Hexagonal Pixelate',
  'Hole Distortion',
  'Kaleidoscope',
  'Combined Keystone Correction',
  'Horizontal Keystone Correction',
  'Vertical Keystone Correction',
  'Lenticular Halo',
  'Light Tunnel Distortion',
  'Linear Gradient',
  'Line Screen',
  'Nine Part Stretched',
  'Nine Part Tiled',
  'Op Tile',
  'Parallelogram Tile',
  'Perspective Correction',
  'Perspective Tile',
  'Perspective Transform',
  'Perspective Transform with Extent',
  'Pinch Distortion',
  'Pixelate',
  'Pointillize',
  'Radial Gradient',
  'Rounded Rectangle Generator',
  'Row Average',
  'Sixfold Reflected Tile',
  'Sixfold Rotated Tile',
  'Smooth Linear Gradient',
  'Spot Light',
  'Star Shine',
  'Stretch Crop',
  'Stripes',
  'Sunbeams',
  'Temperature and Tint',
  'Tone Curve',
  'Torus Lens Distortion',
  'Triangle Kaleidoscope',
  'Triangle Tile',
  'Twelvefold Reflected Tile',
  'Twirl Distortion',
  'Vignette Effect',
  'Vortex Distortion',
  'Zoom Blur',
];

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final source = AssetInputSource('images/demo.jpeg');

  for (final filter in filters) {
    group(filter, () {
      late CIFilterConfiguration configuration;
      setUpAll(() async {
        configuration =
            FlutterCoreImageFilters.createFilter(displayName: filter);
        await configuration.prepare();
      });
      tearDownAll(() async {
        await configuration.dispose();
      });

      test('default values with default "CIContext"', () async {
        await expectImageFileFilteredSuccessfully(
          configuration,
          source,
          'default.jpeg',
          diffTolerance: 10.0,
        );
      });

      test('default values with "Metal"', () async {
        await expectImageFileFilteredSuccessfully(
          configuration,
          source,
          'default.jpeg',
          context: CIContext.mlt,
          diffTolerance: 10.0,
        );
      });

      test('default values with "OpenGL"', () async {
        await expectImageFileFilteredSuccessfully(
          configuration,
          source,
          'default.jpeg',
          context: CIContext.egl,
          diffTolerance: 10.0,
        );
      });
    });
  }
}
