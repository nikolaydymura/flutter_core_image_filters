import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISpotColorConfiguration configuration;
  setUp(() {
    configuration = CISpotColorConfiguration();
  });
  group('CISpotColor', () {
    test('change inputCenterColor2', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenterColor2') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(134, 78, 88, 1));
      configuration.centerColor2 = Colors.orangeAccent;
      expect(parameter.value, Colors.orangeAccent);
    });
    test('change inputCloseness2', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCloseness2') as NumberParameter;
      expect(parameter.value, 0.15);
      configuration.closeness2 = 0.25;
      expect(parameter.value, 0.25);
    });
    test('change inputContrast1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputContrast1') as NumberParameter;
      expect(parameter.value, 0.98);
      configuration.contrast1 = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputReplacementColor2', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputReplacementColor2')
          as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(233, 143, 129, 1));
      configuration.replacementColor2 = Colors.orangeAccent;
      expect(parameter.value, Colors.orangeAccent);
    });
    test('change inputCenterColor1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenterColor1') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(20, 16, 18, 1));
      configuration.centerColor1 = Colors.orangeAccent;
      expect(parameter.value, Colors.orangeAccent);
    });
    test('change inputContrast3', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputContrast3') as NumberParameter;
      expect(parameter.value, 0.99);
      configuration.contrast3 = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputCloseness1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCloseness1') as NumberParameter;
      expect(parameter.value, 0.22);
      configuration.closeness1 = 0.2;
      expect(parameter.value, 0.2);
    });
    test('change inputContrast2', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputContrast2') as NumberParameter;
      expect(parameter.value, 0.98);
      configuration.contrast2 = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputReplacementColor1', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputReplacementColor1')
          as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(112, 49, 50, 1));
      configuration.replacementColor1 = Colors.orangeAccent;
      expect(parameter.value, Colors.orangeAccent);
    });
    test('change inputCenterColor3', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenterColor3') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(235, 116, 85, 1));
      configuration.centerColor3 = Colors.orangeAccent;
      expect(parameter.value, Colors.orangeAccent);
    });
    test('change inputCloseness3', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCloseness3') as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.closeness3 = 0.25;
      expect(parameter.value, 0.25);
    });
    test('change inputReplacementColor3', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputReplacementColor3')
          as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(232, 192, 155, 1));
      configuration.replacementColor3 = Colors.orangeAccent;
      expect(parameter.value, Colors.orangeAccent);
    });
  });
}
