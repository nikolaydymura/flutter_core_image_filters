import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIHueBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIHueBlendModeConfiguration();
  });
  group('CIHueBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIHueBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
