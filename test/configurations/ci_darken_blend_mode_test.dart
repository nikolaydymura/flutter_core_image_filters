import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDarkenBlendModeConfiguration configuration;
  setUp(() {
    configuration = CIDarkenBlendModeConfiguration();
  });
  group('CIDarkenBlendMode', () {
    test('verify name', () {
      expect(configuration.name, 'CIDarkenBlendMode');
    });
  });
}
