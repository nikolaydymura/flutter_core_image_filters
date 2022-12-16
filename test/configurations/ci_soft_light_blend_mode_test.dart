import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CISoftLightBlendModeConfiguration configuration;
  setUp(() {
    configuration = CISoftLightBlendModeConfiguration();
  });
  group('CISoftLightBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CISoftLightBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
