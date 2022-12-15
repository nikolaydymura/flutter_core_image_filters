import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIDifferenceBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIDifferenceBlendModeConfiguration();
  });
  group('CIDifferenceBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIDifferenceBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
