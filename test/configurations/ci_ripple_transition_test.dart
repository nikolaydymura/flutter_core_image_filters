import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIRippleTransitionConfiguration configuration;
  setUp(() {
    configuration = CIRippleTransitionConfiguration();
  });
  group('CIRippleTransition', () {
    test('change inputExtent', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputExtent')
              as CGRectParameter;
      expect(parameter.value, const Rect.fromLTWH(0, 0, 300, 300));
      configuration.extent = const Rect.fromLTWH(0, 0, 640, 80);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 640, 80));
    });
    test('change inputTime', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputTime')
              as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputScale', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputScale')
              as NumberParameter;
      expect(parameter.value, 50);
      configuration.scale = 0;
      expect(parameter.value, 0);
    });

    test('change inputWidth', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputWidth')
              as NumberParameter;
      expect(parameter.value, 100);
      configuration.width = 200;
      expect(parameter.value, 200);
    });

    test('change inputCenter', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputCenter')
              as CGPositionParameter;
      expect(parameter.value, const Point(150.0, 150.0));
      configuration.center = const Point(100.0, 100.0);
      expect(parameter.value, const Point(100.0, 100.0));
    });
  });
}
