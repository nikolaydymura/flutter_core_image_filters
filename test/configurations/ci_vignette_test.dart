import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIVignetteConfiguration configuration;
  setUp(() {
    configuration = CIVignetteConfiguration();
  });
  group('CIVignette', () {
    test('verify name', () {
      expect(configuration.name, 'CIVignette');
    });
    testInputKeys(build: () => configuration);
    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 0);
      configuration.intensity = 0.25;
      expect(parameter.value, 0.25);
    });
  });
}
