import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILuminosityBlendModeConfiguration configuration;
  setUp(() {
    configuration = CILuminosityBlendModeConfiguration();
  });
  group('CILuminosityBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CILuminosityBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
