import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CISaliencyMapFilterConfiguration configuration;
  setUp(() {
    configuration = CISaliencyMapFilterConfiguration();
  });
  group('CISaliencyMapFilter', () {
    test('verify name', () {
      expect(configuration.name, 'CISaliencyMapFilter');
    });
    testInputKeys(build: () => configuration);
  });
}
