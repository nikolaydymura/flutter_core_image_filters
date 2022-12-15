import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIGaussianBlurConfiguration configuration;
  setUp(() {
    configuration = CIGaussianBlurConfiguration();
  });
  group('CIGaussianBlur', () {
    test('verify name', () {
      expect(configuration.name, 'CIGaussianBlur');
    });
    testInputKeys(build: () => configuration);
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 10);
      configuration.radius = 20;
      expect(parameter.value, 20);
    });
  });
}
