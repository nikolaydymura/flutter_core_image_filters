import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CISwipeTransitionConfiguration configuration;
  setUp(() {
    configuration = CISwipeTransitionConfiguration();
  });
  group('CISwipeTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CISwipeTransition');
    });
    testInputKeys(build: () => configuration);
    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = 0.25;
      expect(parameter.value, 0.25);
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 0.0));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
      configuration.extent = const Rect.fromLTRB(0, 0, 640, 80);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
    });
    test('change inputOpacity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputOpacity') as NumberParameter;
      expect(parameter.value, 0);
      configuration.opacity = 0.25;
      expect(parameter.value, 0.25);
    });
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.25;
      expect(parameter.value, 0.25);
    });
    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 3000);
      configuration.width = 500;
      expect(parameter.value, 500);
    });
  });
}
