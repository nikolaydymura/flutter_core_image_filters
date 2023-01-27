import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIKaleidoscopeConfiguration configuration;
  setUp(() {
    configuration = CIKaleidoscopeConfiguration();
  });
  group('CIKaleidoscope', () {
    test('verify name', () {
      expect(configuration.name, 'CIKaleidoscope');
    });

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = 1;
      expect(parameter.value, 1);
    });

    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputCount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCount') as NumberParameter;
      expect(parameter.value, 6);
      configuration.count = 30;
      expect(parameter.value, 30);
    });
  });
}
