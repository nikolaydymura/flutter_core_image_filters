import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorPolynomialConfiguration configuration;
  setUp(() {
    configuration = CIColorPolynomialConfiguration();
  });
  group('CIColorPolynomial', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorPolynomial');
    });
    testInputKeys(build: () => configuration);
    test('change inputRedCoefficients', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputRedCoefficients')
          as CIVectorParameter;
      expect(parameter.value, [0, 1, 0, 0]);
      configuration.redCoefficients = [0, 0.9, 0, 0];
      expect(parameter.value, [0, 0.9, 0, 0]);
    });

    test('change inputGreenCoefficients', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputGreenCoefficients')
          as CIVectorParameter;
      expect(parameter.value, [0, 1, 0, 0]);
      configuration.greenCoefficients = [0, 0.9, 0, 0];
      expect(parameter.value, [0, 0.9, 0, 0]);
    });
    test('change inputAlphaCoefficients', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAlphaCoefficients')
      as CIVectorParameter;
      expect(parameter.value, [0, 1, 0, 0]);
      configuration.alphaCoefficients = [0, 0.9, 0, 0];
      expect(parameter.value, [0, 0.9, 0, 0]);
    });
    test('change inputBlueCoefficients', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBlueCoefficients')
          as CIVectorParameter;
      expect(parameter.value, [0, 1, 0, 0]);
      configuration.greenCoefficients = [0, 0.9, 0, 0];
      expect(parameter.value, [0, 0.9, 0, 0]);
    });
  });
}
