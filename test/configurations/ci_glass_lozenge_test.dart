import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIGlassLozengeConfiguration configuration;
  setUp(() {
    configuration = CIGlassLozengeConfiguration();
  });
  group('CIGlassLozenge',  () {
    test('verify name', () {
      expect(configuration.name, 'CIGlassLozenge');
    });
    testInputKeys(build: () => configuration);
    test('change inputRefraction', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRefraction') as NumberParameter;
      expect(parameter.value, 1.7);
      configuration.refraction = 3;
      expect(parameter.value, 3);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 100);
      configuration.radius = 500;
      expect(parameter.value, 500);
    });
    test('change inputPoint0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint0') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.point0 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputPoint1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint1') as CGPositionParameter;
      expect(parameter.value, const Point(350, 150));
      configuration.point1 = const Point(200, 200);
      expect(parameter.value, const Point(200, 200));
    });
  });
}
