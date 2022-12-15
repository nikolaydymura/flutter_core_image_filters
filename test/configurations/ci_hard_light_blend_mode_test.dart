import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIHardLightBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIHardLightBlendModeConfiguration();
  });
  group('CIHardLightBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIHardLightBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
