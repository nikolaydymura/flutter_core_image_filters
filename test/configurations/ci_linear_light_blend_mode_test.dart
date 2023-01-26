import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILinearLightBlendModeConfiguration configuration;
  setUp(() {
    configuration = CILinearLightBlendModeConfiguration();
  });
  group('CILinearLightBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CILinearLightBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
