import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CICMYKHalftoneConfiguration configuration;
  setUp(() {
    configuration = CICMYKHalftoneConfiguration();
  });
  group('CICMYKHalftone', () {
    test('change inputGCR', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputGCR')
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.gCR = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputUCR', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputUCR')
              as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.uCR = 0.7;
      expect(parameter.value, 0.7);
    });

    test('change inputWidth', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputWidth')
              as NumberParameter;
      expect(parameter.value, 6);
      configuration.width = 50;
      expect(parameter.value, 50);
    });
    test('change inputCenter', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputCenter')
              as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputAngle', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputAngle')
              as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = -1;
      expect(parameter.value, -1);
    });
    test('change inputSharpness', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputSharpness')
              as NumberParameter;
      expect(parameter.value, 0.7);
      configuration.sharpness = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
