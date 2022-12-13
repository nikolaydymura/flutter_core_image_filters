import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAdditionCompositingConfiguration configuration;
  setUp(() {
    configuration = CIAdditionCompositingConfiguration();
  });
  group('CIAdditionCompositing', () {
    test('verify name', () {
      expect(configuration.name, 'CIAdditionCompositing');
    });
  });
}
