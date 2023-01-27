import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIConvolution3X3RGBConfiguration configuration;
  setUp(() {
    configuration = CIConvolution3X3RGBConfiguration();
  });
  group('CIConvolution3X3RGB', () {
    test('verify name', () {
      expect(configuration.name, 'CIConvolution3X3RGB');
    });
    testInputKeys(build: () => configuration);
    test('change inputBias', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBias') as NSNumberParameter;
      expect(parameter.value, 0);
      configuration.bias = 1;
      expect(parameter.value, 1);
    });

    test('change inputWeights', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWeights') as CIVectorParameter;
      expect(parameter.value, [0, 0, 0, 0, 1, 0, 0, 0, 0]);
      configuration.weights = [0, 0, 0, 0, 0.9, 0, 0, 0, 0];
      expect(parameter.value, [0, 0, 0, 0, 0.9, 0, 0, 0, 0]);
    });
  });
}
