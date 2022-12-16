import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIUnsharpMaskConfiguration configuration;
  setUp(() {
    configuration = CIUnsharpMaskConfiguration();
  });
  group('CIUnsharpMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIUnsharpMask');
    });
    testInputKeys(build: () => configuration);
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 2.5);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });

    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.intensity = 0.8;
      expect(parameter.value, 0.8);
    });
  });
}
