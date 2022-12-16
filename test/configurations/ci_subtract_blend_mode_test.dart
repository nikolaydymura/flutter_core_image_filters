import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CISubtractBlendModeConfiguration configuration;
  setUp(() {
    configuration = CISubtractBlendModeConfiguration();
  });
  group('CISubtractBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CISubtractBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
