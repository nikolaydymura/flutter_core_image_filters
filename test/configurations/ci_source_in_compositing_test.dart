import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CISourceInCompositingConfiguration configuration;
  setUp(() {
    configuration = CISourceInCompositingConfiguration();
  });
  group('CISourceInCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CISourceInCompositing');
    });
    testInputKeys(build: () => configuration);
  });
}
