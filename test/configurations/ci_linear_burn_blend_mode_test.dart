import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILinearBurnBlendModeConfiguration configuration;
  setUp(() {
    configuration = CILinearBurnBlendModeConfiguration();
  });
  group('CILinearBurnBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CILinearBurnBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
