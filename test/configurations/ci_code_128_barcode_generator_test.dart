import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CICode128BarcodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CICode128BarcodeGeneratorConfiguration();
  });
  group('CICode128BarcodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CICode128BarcodeGenerator');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputQuietSpace', 'inputBarcodeHeight']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['QuietSpace', 'BarcodeHeight'],
      );
    });
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
  });
}
