import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIDivideBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIDivideBlendModeConfiguration();
  });
  group('CIAdditionCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CIDivideBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
