import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CITriangleKaleidoscopeConfiguration configuration;
  setUp(() {
    configuration = CITriangleKaleidoscopeConfiguration();
  });
  group('CITriangleKaleidoscope', () {
    test('verify name', () {
      expect(configuration.name, 'CITriangleKaleidoscope');
    });

    test('change inputDecay', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputDecay') as NumberParameter;
      expect(parameter.value, 0.85);
      configuration.decay = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputPoint', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.point = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputRotation', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRotation') as NumberParameter;
      expect(parameter.value, 5.924285296593801);
      configuration.rotation = 3;
      expect(parameter.value, 3);
    });
    test('change inputSize', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSize') as NumberParameter;
      expect(parameter.value, 700);
      configuration.size = 500;
      expect(parameter.value, 500);
    });
  });
}
