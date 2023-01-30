import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDepthBlurEffectConfiguration configuration;
  setUp(() {
    configuration = CIDepthBlurEffectConfiguration();
  });
  group('CIDepthBlurEffect', () {
    test('change inputChinPositions', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputChinPositions')
          as CGPositionParameter;
      expect(parameter.value, const Point(-1.0, -1.0));
      configuration.chinPositions = const Point(0, 0);
      expect(parameter.value, const Point(0, 0));
    });
    test('change inputLeftEyePositions', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputLeftEyePositions')
          as CGPositionParameter;
      expect(parameter.value, const Point(-1.0, -1.0));
      configuration.leftEyePositions = const Point(0, 0);
      expect(parameter.value, const Point(0, 0));
    });
    test('change inputShape', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShape') as StringParameter;
      expect(parameter.value, '');
      configuration.shape = ' ';
      expect(parameter.value, ' ');
    });

    test('change inputScaleFactor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScaleFactor') as NumberParameter;
      expect(parameter.value, 1);
      configuration.scaleFactor = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputRightEyePositions', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputRightEyePositions')
          as CGPositionParameter;
      expect(parameter.value, const Point(-1.0, -1.0));
      configuration.rightEyePositions = const Point(0, 0);
      expect(parameter.value, const Point(0, 0));
    });
    test('change inputLumaNoiseScale', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputLumaNoiseScale')
          as NumberParameter;
      expect(parameter.value, 0);
      configuration.lumaNoiseScale = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputNosePositions', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputNosePositions')
          as CGPositionParameter;
      expect(parameter.value, const Point(-1.0, -1.0));
      configuration.nosePositions = const Point(0, 0);
      expect(parameter.value, const Point(0, 0));
    });
    test('change inputAperture', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAperture') as NumberParameter;
      expect(parameter.value, 0);
      configuration.aperture = 10;
      expect(parameter.value, 10);
    });
    test('change inputFocusRect', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFocusRect') as CGRectParameter;
      expect(
        parameter.value,
        const Rect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      );
      configuration.focusRect = const Rect.fromLTRB(0, 0, 0, 0);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 0, 0));
    });
  });
}
