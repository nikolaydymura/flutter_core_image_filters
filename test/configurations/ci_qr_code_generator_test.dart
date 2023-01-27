import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIQRCodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIQRCodeGeneratorConfiguration();
  });
  group('CIQRCodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIQRCodeGenerator');
    });

    test('change inputCorrectionLevel', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCorrectionLevel')
          as StringParameter;
      expect(parameter.value, 'M');
      configuration.correctionLevel = 'L';
      expect(parameter.value, 'L');
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
