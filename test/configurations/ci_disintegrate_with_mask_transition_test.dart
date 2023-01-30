import 'dart:math';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDisintegrateWithMaskTransitionConfiguration configuration;
  setUp(() {
    configuration = CIDisintegrateWithMaskTransitionConfiguration();
  });
  group('CIDisintegrateWithMaskTransition', () {
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputShadowOffset', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowOffset') as PointParameter;
      expect(parameter.value, const Point(0, -10));
      configuration.shadowOffset = const Point(1, -9);
      expect(parameter.value, const Point(1, -9));
    });
    test('change inputShadowDensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowDensity') as NumberParameter;
      expect(parameter.value, 0.65);
      configuration.shadowDensity = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputShadowRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowRadius') as NumberParameter;
      expect(parameter.value, 8);
      configuration.shadowRadius = 25;
      expect(parameter.value, 25);
    });
  });
}
