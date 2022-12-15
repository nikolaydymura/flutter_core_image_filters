import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIGaborGradientsConfiguration configuration;
  setUp(() {
    configuration = CIGaborGradientsConfiguration();
  });
  group('CIGaborGradients', () {
    test('verify name', () {
      expect(configuration.name, 'CIGaborGradients');
    });
    testInputKeys(build: () => configuration);
  });
}
