import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIMeshGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIMeshGeneratorConfiguration();
  });
  group('CIMeshGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIMeshGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputMesh', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMesh') as VectorParameter;
      expect(parameter.value, []);
      configuration.mesh = [0, 0];
      expect(parameter.value, [0, 0]);
    });
    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 1.5);
      configuration.width = 5;
      expect(parameter.value, 5);
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1));
      configuration.color = const Color.fromRGBO(226, 159, 59, 1.0);
      expect(parameter.value, 0.5);
    });
  });
}
