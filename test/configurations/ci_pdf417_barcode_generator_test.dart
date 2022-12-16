import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIPDF417BarcodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIPDF417BarcodeGeneratorConfiguration();
  });
  group('CIPDF417BarcodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIPDF417BarcodeGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputMinHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMinHeight') as NumberParameter;
      expect(parameter.value, 13);
      configuration.minHeight = 135;
      expect(parameter.value, 135);
    });
    test('change inputAlwaysSpecifyCompaction', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputAlwaysSpecifyCompaction')
          as ColorParameter;
      expect(parameter.value, 0.0);
      configuration.alwaysSpecifyCompaction = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputDataColumns', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputDataColumns') as ColorParameter;
      expect(parameter.value, 0.0);
      configuration.dataColumns = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputMinWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMinWidth') as ColorParameter;
      expect(parameter.value, 56);
      configuration.minWidth = 263;
      expect(parameter.value, 263);
    });
    test('change inputMaxWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaxWidth') as ColorParameter;
      expect(parameter.value, 56);
      configuration.maxWidth = 263;
      expect(parameter.value, 263);
    });
    test('change inputCorrectionLevel', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCorrectionLevel')
          as ColorParameter;
      expect(parameter.value, 0);
      configuration.correctionLevel = 4;
      expect(parameter.value, 4);
    });
    test('change inputCompactionMode', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCompactionMode') as ColorParameter;
      expect(parameter.value, 0);
      configuration.compactionMode = 1.5;
      expect(parameter.value, 1.5);
    });
    test('change inputRows', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRows') as ColorParameter;
      expect(parameter.value, 3);
      configuration.rows = 43;
      expect(parameter.value, 43);
    });
    test('change inputCompactStyle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCompactStyle') as ColorParameter;
      expect(parameter.value, 0);
      configuration.compactStyle = 1.5;
      expect(parameter.value, 1.5);
    });
    test('change inputPreferredAspectRatio', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputPreferredAspectRatio')
          as ColorParameter;
      expect(parameter.value, 0);
      configuration.preferredAspectRatio = 1;
      expect(parameter.value, 1);
    });
    test('change inputMaxHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaxHeight') as ColorParameter;
      expect(parameter.value, 13);
      configuration.maxHeight = 135;
      expect(parameter.value, 135);
    });
  });
}
