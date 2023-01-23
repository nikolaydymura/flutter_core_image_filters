import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIRadialGradientConfiguration configuration;
  setUp(() {
    configuration = CIRadialGradientConfiguration();
  });
  group('CIRadialGradient', skip: true, () {
    test('verify name', () {
      expect(configuration.name, 'CIRadialGradient');
    });
    testInputKeys(build: () => configuration);
    test('change inputRadius1', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputRadius1')
              as SliderNSNumberParameter;
      expect(parameter.value, 100);
      configuration.radius1 = 500;
      expect(parameter.value, 500);
    });
    test('change inputColor0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor0') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1));
      configuration.color0 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputRadius0', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputRadius0')
              as SliderNSNumberParameter;
      expect(parameter.value, 5);
      configuration.radius0 = 500;
      expect(parameter.value, 500);
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
