import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPerspectiveTransformWithExtentConfiguration configuration;
  setUp(() {
    configuration = CIPerspectiveTransformWithExtentConfiguration();
  });
  group('CIPerspectiveTransformWithExtent', () {
    test('change inputBottomLeft', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputBottomLeft',
              )
              as CGPositionParameter;
      expect(parameter.value, const Point(155.0, 153.0));
      configuration.bottomLeft = const Point(100.0, 100.0);
      expect(parameter.value, const Point(100.0, 100.0));
    });
    test('change inputTopRight', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputTopRight')
              as CGPositionParameter;
      expect(parameter.value, const Point(646.0, 507.0));
      configuration.topRight = const Point(100.0, 100.0);
      expect(parameter.value, const Point(100.0, 100.0));
    });
    test('change inputBottomRight', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputBottomRight',
              )
              as CGPositionParameter;
      expect(parameter.value, const Point(548.0, 140.0));
      configuration.bottomRight = const Point(100.0, 100.0);
      expect(parameter.value, const Point(100.0, 100.0));
    });
    test('change inputExtent', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputExtent')
              as CGRectParameter;
      expect(parameter.value, const Rect.fromLTWH(0, 0, 300, 300));
      configuration.extent = const Rect.fromLTWH(0, 0, 640, 80);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 640, 80));
    });
    test('change inputTopLeft', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputTopLeft')
              as CGPositionParameter;
      expect(parameter.value, const Point(118.0, 484.0));
      configuration.topLeft = const Point(100.0, 100.0);
      expect(parameter.value, const Point(100.0, 100.0));
    });
  });
}
