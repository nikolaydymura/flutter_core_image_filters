import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CILenticularHaloGeneratorConfiguration configuration;
  setUp(() {
    configuration = CILenticularHaloGeneratorConfiguration();
  });
  group('CILenticularHaloGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CILenticularHaloGenerator');
    });

    test('change inputHaloRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputHaloRadius') as NumberParameter;
      expect(parameter.value, 70);
      configuration.haloRadius = 500;
      expect(parameter.value, 500);
    });

    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 229, 204, 1));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputStriationContrast', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputStriationContrast')
          as NumberParameter;
      expect(parameter.value, 1);
      configuration.striationContrast = 3;
      expect(parameter.value, 3);
    });
    test('change inputHaloOverlap', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputHaloOverlap') as NumberParameter;
      expect(parameter.value, 0.77);
      configuration.haloOverlap = 3;
      expect(parameter.value, 3);
    });
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputStriationStrength', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputStriationStrength')
          as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.striationStrength = 2;
      expect(parameter.value, 2);
    });

    test('change inputHaloWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputHaloWidth') as NumberParameter;
      expect(parameter.value, 87);
      configuration.haloWidth = 200;
      expect(parameter.value, 200);
    });
  });
}
