import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISampleNearestConfiguration configuration;
  setUp(() {
    configuration = CISampleNearestConfiguration();
  });
  group('CISampleNearest', () {
    test('verify name', () {
      expect(configuration.name, 'CISampleNearest');
    });
  });
}
