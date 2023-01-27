import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorMatrixConfiguration configuration;
  setUp(() {
    configuration = CIColorMatrixConfiguration();
  });
  group('CIColorMatrix', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorMatrix');
    });

    test('change inputGVector', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputGVector') as CIVectorParameter;
      expect(parameter.value, [0, 1, 0, 0]);
      configuration.gVector = [0, 0.9, 0, 0];
      expect(parameter.value, [0, 0.9, 0, 0]);
    });

    test('change inputBiasVector', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBiasVector') as CIVectorParameter;
      expect(parameter.value, [0, 0, 0, 0]);
      configuration.biasVector = [0.1, 0.1, 0.1, 0.1];
      expect(parameter.value, [0.1, 0.1, 0.1, 0.1]);
    });
    test('change inputRVector', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRVector') as CIVectorParameter;
      expect(parameter.value, [1, 0, 0, 0]);
      configuration.rVector = [0.9, 0, 0, 0];
      expect(parameter.value, [0.9, 0, 0, 0]);
    });
    test('change inputAVector', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAVector') as CIVectorParameter;
      expect(parameter.value, [0, 0, 0, 1]);
      configuration.aVector = [0, 0, 0, 0.9];
      expect(parameter.value, [0, 0, 0, 0.9]);
    });
    test('change inputBVector', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBVector') as CIVectorParameter;
      expect(parameter.value, [0, 0, 1, 0]);
      configuration.bVector = [0, 0, 0.9, 0];
      expect(parameter.value, [0, 0, 0.9, 0]);
    });
  });
}
