import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPDF417BarcodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIPDF417BarcodeGeneratorConfiguration();
  });
  group('CIPDF417BarcodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIPDF417BarcodeGenerator');
    });

    test('change inputMinHeight', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputMinHeight')
              as SliderNSNumberParameter;
      expect(parameter.value, 13);
      configuration.minHeight = 135;
      expect(parameter.value, 135);
    });
    test('change inputAlwaysSpecifyCompaction', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputAlwaysSpecifyCompaction')
          as BoolParameter;
      expect(parameter.value, false);
      configuration.alwaysSpecifyCompaction = true;
      expect(parameter.value, true);
    });
    test('change inputDataColumns', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputDataColumns')
          as SliderNSNumberParameter;
      expect(parameter.value, 0.0);
      configuration.dataColumns = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputMinWidth', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputMinWidth')
              as SliderNSNumberParameter;
      expect(parameter.value, 56);
      configuration.minWidth = 263;
      expect(parameter.value, 263);
    });
    test('change inputMaxWidth', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputMaxWidth')
              as SliderNSNumberParameter;
      expect(parameter.value, 56);
      configuration.maxWidth = 263;
      expect(parameter.value, 263);
    });
    test('change inputCorrectionLevel', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCorrectionLevel')
          as SliderNSNumberParameter;
      expect(parameter.value, 0);
      configuration.correctionLevel = 4;
      expect(parameter.value, 4);
    });
    test('change inputCompactionMode', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCompactionMode')
          as SliderNSNumberParameter;
      expect(parameter.value, 0);
      configuration.compactionMode = 1.5;
      expect(parameter.value, 1.5);
    });
    test('change inputRows', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRows') as SliderNSNumberParameter;
      expect(parameter.value, 3);
      configuration.rows = 43;
      expect(parameter.value, 43);
    });
    test('change inputCompactStyle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCompactStyle') as BoolParameter;
      expect(parameter.value, false);
      configuration.compactStyle = true;
      expect(parameter.value, true);
    });
    test('change inputPreferredAspectRatio', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputPreferredAspectRatio')
          as SliderNSNumberParameter;
      expect(parameter.value, 0);
      configuration.preferredAspectRatio = 1;
      expect(parameter.value, 1);
    });
    test('change inputMaxHeight', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputMaxHeight')
              as SliderNSNumberParameter;
      expect(parameter.value, 13);
      configuration.maxHeight = 135;
      expect(parameter.value, 135);
    });
    test('change inputMessage', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMessage') as DataParameter;
      expect(parameter.data, isNull);
      configuration.messageData = Uint8List(0);
      expect(parameter.data, isNotNull);
    });
  });
}
