import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIExclusionBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIExclusionBlendModeConfiguration();
  });
  group('CIExclusionBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIExclusionBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
