import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISunbeamsGeneratorConfiguration configuration;
  setUp(() {
    configuration = CISunbeamsGeneratorConfiguration();
  });
  group('CISunbeamsGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CISunbeamsGenerator');
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
      expect(parameter.value, 1.375);
      configuration.striationContrast = 2.5;
      expect(parameter.value, 2.5);
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
      configuration.striationStrength = 1.5;
      expect(parameter.value, 1.5);
    });
    test('change inputMaxStriationRadius', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputMaxStriationRadius')
          as NumberParameter;
      expect(parameter.value, 2.58);
      configuration.maxStriationRadius = 5;
      expect(parameter.value, 5);
    });
    test('change inputSunRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSunRadius') as NumberParameter;
      expect(parameter.value, 40);
      configuration.sunRadius = 400;
      expect(parameter.value, 400);
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 127, 0, 1));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
  });
}
