import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIScreenBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIScreenBlendModeConfiguration();
  });
  group('CIScreenBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIScreenBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
