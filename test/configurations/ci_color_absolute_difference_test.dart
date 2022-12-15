import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorAbsoluteDifferenceConfiguration configuration;
  setUp(() {
    configuration = CIColorAbsoluteDifferenceConfiguration();
  });
  group('CIColorAbsoluteDifference', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorAbsoluteDifference');
    });
    testInputKeys(build: () => configuration);
  });
}
