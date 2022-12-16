import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CISourceAtopCompositingConfiguration configuration;
  setUp(() {
    configuration = CISourceAtopCompositingConfiguration();
  });
  group('CISourceAtopCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CISourceAtopCompositing');
    });
    testInputKeys(build: () => configuration);
  });
}
