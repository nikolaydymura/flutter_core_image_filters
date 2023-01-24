import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIModTransitionConfiguration configuration;
  setUp(() {
    configuration = CIModTransitionConfiguration();
  });
  group('CIModTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CIModTransition');
    });
    testInputKeys(build: () => configuration);

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 2);
      configuration.angle = 0;
      expect(parameter.value, 0);
    });
    test('change inputCompression', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCompression') as NumberParameter;
      expect(parameter.value, 300);
      configuration.compression = 500;
      expect(parameter.value, 500);
    });

    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 150);
      configuration.radius = 100;
      expect(parameter.value, 100);
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
