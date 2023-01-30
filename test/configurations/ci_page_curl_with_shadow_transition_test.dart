import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPageCurlWithShadowTransitionConfiguration configuration;
  setUp(() {
    configuration = CIPageCurlWithShadowTransitionConfiguration();
  });
  group('CIPageCurlWithShadowTransition', () {
    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTWH(0, 0, 0, 0));
      configuration.extent = const Rect.fromLTWH(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 300, 300));
    });
    test('change inputShadowExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTWH(0, 0, 0, 0));
      configuration.shadowExtent = const Rect.fromLTWH(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 300, 300));
    });
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputShadowAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowAmount') as NumberParameter;
      expect(parameter.value, 0.7);
      configuration.shadowAmount = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputShadowSize', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowSize') as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.shadowSize = 0.7;
      expect(parameter.value, 0.7);
    });

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 100);
      configuration.radius = 200;
      expect(parameter.value, 200);
    });
  });
}
