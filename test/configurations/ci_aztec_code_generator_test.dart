import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIAztecCodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIAztecCodeGeneratorConfiguration();
  });
  group('CIAztecCodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIAztecCodeGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputCompactStyle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCompactStyle') as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.compactStyle = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputCorrectionLevel', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCorrectionLevel')
          as NumberParameter;
      expect(parameter.value, 23);
      configuration.correctionLevel = 50;
      expect(parameter.value, 50);
    });
    test('change inputLayers', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputLayers') as NumberParameter;
      expect(parameter.value, 1);
      configuration.layers = 20;
      expect(parameter.value, 20);
    });
  });
}
