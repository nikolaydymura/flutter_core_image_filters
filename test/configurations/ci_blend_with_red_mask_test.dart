import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBlendWithRedMaskConfiguration configuration;
  setUp(() {
    configuration = CIBlendWithRedMaskConfiguration();
  });
  group('CIBlendWithRedMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIBlendWithRedMask');
    });
  });
}
