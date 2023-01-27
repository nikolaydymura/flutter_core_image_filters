import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBlendWithAlphaMaskConfiguration configuration;
  setUp(() {
    configuration = CIBlendWithAlphaMaskConfiguration();
  });
  group('CIBlendWithAlphaMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIBlendWithAlphaMask');
    });
  });
}
