import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBlendWithMaskConfiguration configuration;
  setUp(() {
    configuration = CIBlendWithMaskConfiguration();
  });
  group('CIBlendWithMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIBlendWithMask');
    });
  });
}
