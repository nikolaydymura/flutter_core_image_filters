import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIBumpDistortionConfiguration configuration;
  setUp(() {
    configuration = CIBumpDistortionConfiguration();
  });
  group('CIBumpDistortion', () {
    test('verify name', () {
      expect(configuration.name, 'CIBumpDistortion');
    });
    testInputKeys(build: () => configuration);

    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 300);
      configuration.radius = 400;
      expect(parameter.value, 400);
    });

    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.scale = 0.0;
      expect(parameter.value, 0.0);
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
