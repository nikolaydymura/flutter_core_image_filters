import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorDodgeBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIColorDodgeBlendModeConfiguration();
  });
  group('CIColorDodgeBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorDodgeBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
