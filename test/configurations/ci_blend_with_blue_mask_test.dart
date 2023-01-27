import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBlendWithBlueMaskConfiguration configuration;
  setUp(() {
    configuration = CIBlendWithBlueMaskConfiguration();
  });
  group('CIBlendWithBlueMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIBlendWithBlueMask');
    });
  });
}
