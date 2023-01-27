import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CITorusLensDistortionConfiguration configuration;
  setUp(() {
    configuration = CITorusLensDistortionConfiguration();
  });
  group('CITorusLensDistortion', () {
    test('verify name', () {
      expect(configuration.name, 'CITorusLensDistortion');
    });
    testInputKeys(build: () => configuration);

    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 80);
      configuration.width = 100;
      expect(parameter.value, 100);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputRefraction', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRefraction') as NumberParameter;
      expect(parameter.value, 1.7);
      configuration.refraction = 2.5;
      expect(parameter.value, 2.5);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 160);
      configuration.radius = 250;
      expect(parameter.value, 250);
    });
  });
}
