import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIVignetteEffectConfiguration configuration;
  setUp(() {
    configuration = CIVignetteEffectConfiguration();
  });
  group('CIVignetteEffect', () {
    test('change inputFalloff', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFalloff') as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.falloff = 0.7;
      expect(parameter.value, 0.7);
    });
    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 1);
      configuration.intensity = 0;
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
      expect(parameter.value, 150);
      configuration.radius = 1000;
      expect(parameter.value, 1000);
    });
  });
}
