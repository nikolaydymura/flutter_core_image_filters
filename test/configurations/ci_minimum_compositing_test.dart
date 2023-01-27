import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMinimumCompositingConfiguration configuration;
  setUp(() {
    configuration = CIMinimumCompositingConfiguration();
  });
  group('CIMinimumCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CIMinimumCompositing');
    });
  });
}
