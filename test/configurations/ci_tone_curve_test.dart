import 'dart:math';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIToneCurveConfiguration configuration;
  setUp(() {
    configuration = CIToneCurveConfiguration();
  });
  group('CIToneCurve', () {
    test('verify name', () {
      expect(configuration.name, 'CIToneCurve');
    });
    testInputKeys(build: () => configuration);
    test('change inputPoint0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint0') as PointParameter;
      expect(parameter.value, const Point(0.0, 0.0));
      configuration.point0 = const Point(0.5, 0.5);
      expect(parameter.value, const Point(0.5, 0.5));
    });
    test('change inputPoint1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint1') as PointParameter;
      expect(parameter.value, const Point(0.25, 0.25));
      configuration.point1 = const Point(0.3, 0.3);
      expect(parameter.value, const Point(0.3, 0.3));
    });
    test('change inputPoint2', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint2') as PointParameter;
      expect(parameter.value, const Point(0.5, 0.5));
      configuration.point2 = const Point(0.55, 0.55);
      expect(parameter.value, const Point(0.55, 0.55));
    });
    test('change inputPoint3', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint3') as PointParameter;
      expect(parameter.value, const Point(0.75, 0.75));
      configuration.point3 = const Point(0.80, 0.80);
      expect(parameter.value, const Point(0.80, 0.80));
    });
    test('change inputPoint4', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint4') as PointParameter;
      expect(parameter.value, const Point(1.0, 1.0));
      configuration.point4 = const Point(1.05, 1.05);
      expect(parameter.value, const Point(1.05, 1.05));
    });
  });
}
