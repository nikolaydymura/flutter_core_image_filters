import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIVortexDistortionConfiguration configuration;
  setUp(() {
    configuration = CIVortexDistortionConfiguration();
  });
  group('CIVortexDistortion', () {
    test('verify name', () {
      expect(configuration.name, 'CIVortexDistortion');
    });
    testInputKeys(build: () => configuration);

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 56.54866776461628);
      configuration.angle = 0;
      expect(parameter.value, 0);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 300);
      configuration.radius = 500;
      expect(parameter.value, 500);
    });
  });
}
