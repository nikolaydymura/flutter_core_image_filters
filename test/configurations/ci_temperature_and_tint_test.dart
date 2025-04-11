import 'dart:math';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CITemperatureAndTintConfiguration configuration;
  setUp(() {
    configuration = CITemperatureAndTintConfiguration();
  });
  group('CITemperatureAndTint', () {
    test('change inputTargetNeutral', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputTargetNeutral',
              )
              as PointParameter;
      expect(parameter.value, const Point(6500.0, 0.0));
      configuration.targetNeutral = const Point(6000.0, 0.0);
      expect(parameter.value, const Point(6000.0, 0.0));
    });
    test('change inputNeutral', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputNeutral')
              as PointParameter;
      expect(parameter.value, const Point(6500.0, 0.0));
      configuration.neutral = const Point(6000.0, 0.0);
      expect(parameter.value, const Point(6000.0, 0.0));
    });
  });
}
