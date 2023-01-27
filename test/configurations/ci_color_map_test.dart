import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorMapConfiguration configuration;
  setUp(() {
    configuration = CIColorMapConfiguration();
  });
  group('CIColorMap', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorMap');
    });
  });
}
