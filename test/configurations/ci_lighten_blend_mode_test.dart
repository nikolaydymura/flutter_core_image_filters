import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILightenBlendModeConfiguration configuration;
  setUp(() {
    configuration = CILightenBlendModeConfiguration();
  });
  group('CILightenBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CILightenBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
