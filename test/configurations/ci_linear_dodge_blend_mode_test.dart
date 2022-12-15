import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILinearDodgeBlendModeConfiguration configuration;
  setUp(() {
    configuration = CILinearDodgeBlendModeConfiguration();
  });
  group('CILinearDodgeBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CILinearDodgeBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
