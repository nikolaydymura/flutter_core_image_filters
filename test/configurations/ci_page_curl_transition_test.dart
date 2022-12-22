import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIPageCurlTransitionConfiguration configuration;
  setUp(() {
    configuration = CIPageCurlTransitionConfiguration();
  });
  group('CIPageCurlTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CIPageCurlTransition');
    });
    testInputKeys(build: () => configuration);

    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
      configuration.extent = const Rect.fromLTRB(0, 0, 640, 80);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
    });

    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 100);
      configuration.radius = 200;
      expect(parameter.value, 200);
    });

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = 0.7;
      expect(parameter.value, 0.7);
    });
  });
}
