import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIGaussianGradientConfiguration configuration;
  setUp(() {
    configuration = CIGaussianGradientConfiguration();
  });
  group('CIGaussianGradient', () {
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 300);
      configuration.radius = 500;
      expect(parameter.value, 500);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputColor1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor1') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 0));
      configuration.color1 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });

    test('change inputColor0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor0') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1));
      configuration.color0 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
  });
}
