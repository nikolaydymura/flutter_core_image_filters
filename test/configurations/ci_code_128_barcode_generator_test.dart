import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CICode128BarcodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CICode128BarcodeGeneratorConfiguration();
  });
  group('CICode128BarcodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CICode128BarcodeGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputQuietSpace', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputQuietSpace') as NumberParameter;
      expect(parameter.value, 10);
      configuration.quietSpace = 15;
      expect(parameter.value, 15);
    });

    test('change inputBarcodeHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBarcodeHeight') as NumberParameter;
      expect(parameter.value, 32);
      configuration.barcodeHeight = 20;
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
