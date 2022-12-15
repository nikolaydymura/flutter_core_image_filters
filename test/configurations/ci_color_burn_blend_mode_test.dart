import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorBurnBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIColorBurnBlendModeConfiguration();
  });
  group('CIColorBurnBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorBurnBlendMode');
    });
    testInputKeys(build: () => configuration);
  });
}
