import 'package:flutter/material.dart';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CICopyMachineTransitionConfiguration configuration;
  setUp(() {
    configuration = CICopyMachineTransitionConfiguration();
  });
  group('CICopyMachineTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CICopyMachineTransition');
    });
    testInputKeys(build: () => configuration);
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputOpacity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputOpacity') as NumberParameter;
      expect(parameter.value, 1.3);
      configuration.opacity = 2;
      expect(parameter.value, 2);
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 225, 225, 1.0));
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
    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 200);
      configuration.width = 300;
      expect(parameter.value, 300);
    });
    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = 3;
      expect(parameter.value, 3);
    });
  });
}
