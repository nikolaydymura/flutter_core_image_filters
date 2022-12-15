import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIBarcodeGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIBarcodeGeneratorConfiguration();
  });
  group('CIBarcodeGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIBarcodeGenerator');
    });
    testInputKeys(build: () => configuration);
  });
}
