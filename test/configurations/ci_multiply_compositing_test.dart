import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIMultiplyCompositingConfiguration configuration;
  setUp(() {
    configuration = CIMultiplyCompositingConfiguration();
  });
  group('CIMultiplyCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CIMultiplyCompositing');
    });
    testInputKeys(build: () => configuration);
  });
}
