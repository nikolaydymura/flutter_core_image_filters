import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISaturationBlendModeConfiguration configuration;
  setUp(() {
    configuration = CISaturationBlendModeConfiguration();
  });
  group('CISaturationBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CISaturationBlendMode');
    });
  });
}
