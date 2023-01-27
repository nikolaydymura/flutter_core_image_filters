import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CILabDeltaEConfiguration configuration;
  setUp(() {
    configuration = CILabDeltaEConfiguration();
  });
  group('CILabDeltaE', () {
    test('verify name', () {
      expect(configuration.name, 'CILabDeltaE');
    });
  });
}
