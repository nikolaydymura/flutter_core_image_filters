import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIColorBlendModeConfiguration();
  });
  group('CIColorBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
