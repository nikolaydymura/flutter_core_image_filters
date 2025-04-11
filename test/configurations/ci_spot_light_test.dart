import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISpotLightConfiguration configuration;
  setUp(() {
    configuration = CISpotLightConfiguration();
  });
  group('CISpotLight', () {
    test('change inputLightPointsAt', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputLightPointsAt',
              )
              as VectorParameter;
      expect(parameter.value, const [200, 200, 0]);
      configuration.lightPointsAt = const [150, 150, 0];
      expect(parameter.value, const [150, 150, 0]);
    });
    test('change inputColor', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputColor')
              as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputConcentration', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputConcentration',
              )
              as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.concentration = 1;
      expect(parameter.value, 1);
    });
    test('change inputBrightness', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputBrightness',
              )
              as NumberParameter;
      expect(parameter.value, 3);
      configuration.brightness = 5;
      expect(parameter.value, 5);
    });
    test('change inputLightPosition', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputLightPosition',
              )
              as VectorParameter;
      expect(parameter.value, [400, 600, 150]);
      configuration.lightPosition = [350, 550, 100];
      expect(parameter.value, [350, 550, 100]);
    });
  });
}
