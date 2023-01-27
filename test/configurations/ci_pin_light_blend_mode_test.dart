import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPinLightBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIPinLightBlendModeConfiguration();
  });
  group('CIPinLightBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIPinLightBlendMode');
    });
  });
}
