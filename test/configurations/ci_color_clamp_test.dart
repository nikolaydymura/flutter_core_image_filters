import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorClampConfiguration configuration;
  setUp(() {
    configuration = CIColorClampConfiguration();
  });
  group('CIColorClamp', () {
    test('change inputMaxComponents', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputMaxComponents',
              )
              as CIVectorParameter;
      expect(parameter.value, [1, 1, 1, 1]);
      configuration.maxComponents = [0.9, 0.9, 0.9, 0.9];
      expect(parameter.value, [0.9, 0.9, 0.9, 0.9]);
    });

    test('change inputMinComponents', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputMinComponents',
              )
              as CIVectorParameter;
      expect(parameter.value, [0, 0, 0, 0]);
      configuration.minComponents = [0.1, 0.1, 0.1, 0.1];
      expect(parameter.value, [0.1, 0.1, 0.1, 0.1]);
    });
  });
}
