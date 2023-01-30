import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIConvertLabToRGBConfiguration configuration;
  setUp(() {
    configuration = CIConvertLabToRGBConfiguration();
  });
  group('CIConvertLabToRGB', () {
    test('change inputNormalize', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputNormalize') as NSBoolParameter;
      expect(parameter.value, false);
      configuration.normalize = true;
      expect(parameter.value, true);
    });
  });
}
