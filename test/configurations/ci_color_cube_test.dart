import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorCubeConfiguration configuration;
  setUp(() {
    configuration = CIColorCubeConfiguration();
  });
  group('CIColorCube', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorCube');
    });
    testInputKeys(build: () => configuration);
  });
}
