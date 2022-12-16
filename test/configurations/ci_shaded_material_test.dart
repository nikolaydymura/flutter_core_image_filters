import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIShadedMaterialConfiguration configuration;
  setUp(() {
    configuration = CIShadedMaterialConfiguration();
  });
  group('CIShadedMaterial', () {
    test('verify name', () {
      expect(configuration.name, 'CIShadedMaterial');
    });
    testInputKeys(build: () => configuration);
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 10);
      configuration.scale = 100;
      expect(parameter.value, 100);
    });
  });
}
