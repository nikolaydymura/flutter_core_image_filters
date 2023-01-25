import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIHexagonalPixellateConfiguration configuration;
  setUp(() {
    configuration = CIHexagonalPixellateConfiguration();
  });
  group('CIHexagonalPixellate',  () {
    test('verify name', () {
      expect(configuration.name, 'CIHexagonalPixellate');
    });
    testInputKeys(build: () => configuration);
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 8);
      configuration.scale = 250;
      expect(parameter.value, 250);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
  });
}