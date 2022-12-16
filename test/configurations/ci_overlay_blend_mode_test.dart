import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIOverlayBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIOverlayBlendModeConfiguration();
  });
  group('CIOverlayBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIOverlayBlendMode');
    });
  });
}
