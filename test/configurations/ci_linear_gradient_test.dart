import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CILinearGradientConfiguration configuration;
  setUp(() {
    configuration = CILinearGradientConfiguration();
  });
  group('CILinearGradient', () {
    test('verify name', () {
      expect(configuration.name, 'CILinearGradient');
    });

    test('change inputColor0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor0') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1));
      configuration.color0 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputPoint1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint1') as CGPositionParameter;
      expect(parameter.value, const Point(200, 200));
      configuration.point1 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputPoint0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPoint0') as CGPositionParameter;
      expect(parameter.value, const Point(0, 0));
      configuration.point0 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputColor1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor1') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 1));
      configuration.color1 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
  });
}
