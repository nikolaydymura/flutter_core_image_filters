import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIStarShineGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIStarShineGeneratorConfiguration();
  });
  group('CIStarShineGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIStarShineGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputEpsilon', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputEpsilon') as NumberParameter;
      expect(parameter.value, -2);
      configuration.epsilon = -4;
      expect(parameter.value, -4);
    });
    test('change inputCrossAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCrossAngle') as NumberParameter;
      expect(parameter.value, 0.6);
      configuration.crossAngle = 0;
      expect(parameter.value, 0);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 50);
      configuration.radius = 150;
      expect(parameter.value, 150);
    });
    test('change inputCrossScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCrossScale') as NumberParameter;
      expect(parameter.value, 15);
      configuration.crossScale = 50;
      expect(parameter.value, 50);
    });

    test('change inputCrossOpacity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCrossOpacity') as NumberParameter;
      expect(parameter.value, -2);
      configuration.crossOpacity = -4;
      expect(parameter.value, -4);
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 204, 153, 1));
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
    test('change inputCrossWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCrossWidth') as NumberParameter;
      expect(parameter.value, 2.5);
      configuration.crossWidth = 6;
      expect(parameter.value, 6);
    });
  });
}
