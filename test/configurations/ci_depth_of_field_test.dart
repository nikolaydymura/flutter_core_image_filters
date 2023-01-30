import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDepthOfFieldConfiguration configuration;
  setUp(() {
    configuration = CIDepthOfFieldConfiguration();
  });
  group('CIDepthOfField', () {
    test('change inputPoint1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint1') as CGPositionParameter;
      expect(parameter.value, const Point(300, 300));
      configuration.point1 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputUnsharpMaskRadius', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputUnsharpMaskRadius')
          as NumberParameter;
      expect(parameter.value, 2.5);
      configuration.unsharpMaskRadius = 5;
      expect(parameter.value, 5);
    });
    test('change inputSaturation', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSaturation') as NumberParameter;
      expect(parameter.value, 1.5);
      configuration.saturation = 5;
      expect(parameter.value, 5);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 6);
      configuration.radius = 15;
      expect(parameter.value, 15);
    });
    test('change inputUnsharpMaskIntensity', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputUnsharpMaskIntensity')
          as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.unsharpMaskIntensity = 5;
      expect(parameter.value, 5);
    });
    test('change inputPoint0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint0') as CGPositionParameter;
      expect(parameter.value, const Point(0, 300));
      configuration.point0 = const Point(100, 200);
      expect(parameter.value, const Point(100, 200));
    });
  });
}
