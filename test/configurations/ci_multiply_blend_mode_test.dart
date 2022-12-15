import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMultiplyBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIMultiplyBlendModeConfiguration();
  });
  group('CIMultiplyBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIMultiplyBlendMode');
    });
  });
}
