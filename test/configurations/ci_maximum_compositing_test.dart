import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMaximumCompositingConfiguration configuration;
  setUp(() {
    configuration = CIMaximumCompositingConfiguration();
  });
  group('CIMaximumCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CIMaximumCompositing');
    });
  });
}
