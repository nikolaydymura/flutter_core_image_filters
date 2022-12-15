import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIComicEffectConfiguration configuration;
  setUp(() {
    configuration = CIComicEffectConfiguration();
  });
  group('CIComicEffect', () {
    test('verify name', () {
      expect(configuration.name, 'CIComicEffect');
    });
    testInputKeys(build: () => configuration);
  });
}
