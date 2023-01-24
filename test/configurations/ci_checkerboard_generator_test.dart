import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CICheckerboardGeneratorConfiguration configuration;
  setUp(() {
    configuration = CICheckerboardGeneratorConfiguration();
  });
  group('CICheckerboardGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CICheckerboardGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputSharpness', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSharpness') as NumberParameter;
      expect(parameter.value, 1);
      configuration.sharpness = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputColor0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor0') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 225, 225, 1.0));
      configuration.color0 = const Color.fromRGBO(100, 100, 100, 1.0);
      expect(parameter.value, const Color.fromRGBO(100, 100, 100, 1.0));
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 80);
      configuration.width = 3.0;
      expect(parameter.value, 3.0);
    });

    test('change inputColor1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor1') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 1.0));
      configuration.color1 = const Color.fromRGBO(100, 100, 100, 1.0);
      expect(parameter.value, const Color.fromRGBO(100, 100, 100, 1.0));
    });
  });
}
