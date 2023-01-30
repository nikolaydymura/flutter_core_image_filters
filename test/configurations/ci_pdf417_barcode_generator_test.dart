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
    test('change inputMinHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMinHeight') as NumberParameter;
      expect(parameter.value.isNaN, true);
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
          .firstWhere((e) => e.name == 'inputDataColumns') as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.dataColumns = 2;
      expect(parameter.value, 2);
    });
    test('change inputMinWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMinWidth') as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.minWidth = 263;
      expect(parameter.value, 263);
    });
    test('change inputMaxWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaxWidth') as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.maxWidth = 263;
      expect(parameter.value, 263);
    });
    test('change inputCorrectionLevel', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCorrectionLevel')
          as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.correctionLevel = 4;
      expect(parameter.value, 4);
    });
    test('change inputCompactionMode', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCompactionMode')
          as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.compactionMode = 2;
      expect(parameter.value, 2);
    });
    test('change inputRows', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRows') as NumberParameter;
      expect(parameter.value.isNaN, true);
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
          as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.preferredAspectRatio = 1;
      expect(parameter.value, 1);
    });
    test('change inputMaxHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaxHeight') as NumberParameter;
      expect(parameter.value.isNaN, true);
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
