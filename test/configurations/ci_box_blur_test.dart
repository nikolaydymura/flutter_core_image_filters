import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIBoxBlurConfiguration configuration;
  setUp(() {
    configuration = CIBoxBlurConfiguration();
  });
  group('CIBoxBlur', () {
    test('verify name', () {
      expect(configuration.name, 'CIBoxBlur');
    });
    testInputKeys(build: () => configuration);
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 10);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });
  });
}
