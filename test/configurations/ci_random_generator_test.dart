import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIRandomGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIRandomGeneratorConfiguration();
  });
  group('CIRandomGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIRandomGenerator');
    });
    testInputKeys(build: () => configuration);
  });
}
