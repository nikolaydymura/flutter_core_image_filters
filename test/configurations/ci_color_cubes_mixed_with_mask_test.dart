import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorCubesMixedWithMaskConfiguration configuration;
  setUp(() {
    configuration = CIColorCubesMixedWithMaskConfiguration();
  });
  group('CIColorCubesMixedWithMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorCubesMixedWithMask');
    });
    testInputKeys(build: () => configuration);
  });
}
