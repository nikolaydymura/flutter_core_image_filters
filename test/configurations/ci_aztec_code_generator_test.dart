import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAztecCodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIAztecCodeGeneratorConfiguration();
  });
  group('CIAztecCodeGenerator', () {
    test('change inputCompactStyle', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputCompactStyle',
              )
              as BoolParameter;
      expect(parameter.value, false);
      configuration.compactStyle = true;
      expect(parameter.value, true);
    });

    test('change inputCorrectionLevel', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputCorrectionLevel',
              )
              as NumberParameter;
      expect(parameter.value, 23);
      configuration.correctionLevel = 50;
      expect(parameter.value, 50);
    });
    test('change inputLayers', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputLayers')
              as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.layers = 20;
      expect(parameter.value, 20);
    });
    test('change inputMessage', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputMessage')
              as DataParameter;
      expect(parameter.data, isNull);
      configuration.messageData = Uint8List(0);
      expect(parameter.data, isNotNull);
    });
  });
}
