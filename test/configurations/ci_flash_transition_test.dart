import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIFlashTransitionConfiguration configuration;
  setUp(() {
    configuration = CIFlashTransitionConfiguration();
  });
  group('CIFlashTransition', () {
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as CIColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 204, 153, 1.0));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150.0, 150.0));
      configuration.center = const Point(100.0, 100.0);
      expect(parameter.value, const Point(100.0, 100.0));
    });
    test('change inputMaxStriationRadius', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputMaxStriationRadius')
          as NumberParameter;
      expect(parameter.value, 2.58);
      configuration.maxStriationRadius = 5;
      expect(parameter.value, 5);
    });

    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
      configuration.extent = const Rect.fromLTRB(0, 0, 640, 80);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
    });

    test('change inputStriationStrength', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputStriationStrength')
          as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.striationStrength = 1.5;
      expect(parameter.value, 1.5);
    });
    test('change inputFadeThreshold', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFadeThreshold') as NumberParameter;
      expect(parameter.value, 0.85);
      configuration.fadeThreshold = 1.5;
      expect(parameter.value, 1.5);
    });
    test('change inputStriationContrast', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputStriationContrast')
          as NumberParameter;
      expect(parameter.value, 1.375);
      configuration.striationContrast = 2.5;
      expect(parameter.value, 2.5);
    });
  });
}
