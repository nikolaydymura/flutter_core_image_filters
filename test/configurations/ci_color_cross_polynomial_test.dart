import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorCrossPolynomialConfiguration configuration;
  setUp(() {
    configuration = CIColorCrossPolynomialConfiguration();
  });
  group('CIColorCrossPolynomial', () {
    test('change inputRedCoefficients', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputRedCoefficients',
              )
              as CIVectorParameter;
      expect(parameter.value, [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
      configuration.redCoefficients = [0.9, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      expect(parameter.value, [0.9, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    });

    test('change inputGreenCoefficients', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputGreenCoefficients',
              )
              as CIVectorParameter;
      expect(parameter.value, [0, 1, 0, 0, 0, 0, 0, 0, 0, 0]);
      configuration.greenCoefficients = [0, 0.9, 0, 0, 0, 0, 0, 0, 0, 0];
      expect(parameter.value, [0, 0.9, 0, 0, 0, 0, 0, 0, 0, 0]);
    });
    test('change inputBlueCoefficients', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputBlueCoefficients',
              )
              as CIVectorParameter;
      expect(parameter.value, [0, 0, 1, 0, 0, 0, 0, 0, 0, 0]);
      configuration.blueCoefficients = [0, 0, 0.9, 0, 0, 0, 0, 0, 0, 0];
      expect(parameter.value, [0, 0, 0.9, 0, 0, 0, 0, 0, 0, 0]);
    });
  });
}
