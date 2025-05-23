import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIConvolution9HorizontalConfiguration configuration;
  setUp(() {
    configuration = CIConvolution9HorizontalConfiguration();
  });
  group('CIConvolution9Horizontal', () {
    test('change inputBias', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputBias')
              as NSNumberParameter;
      expect(parameter.value, 0);
      configuration.bias = 1;
      expect(parameter.value, 1);
    });

    test('change inputWeights', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputWeights')
              as Mat3Parameter;
      expect(parameter.value.storage, [0, 0, 0, 0, 1, 0, 0, 0, 0]);
      configuration.weights = Matrix3.fromList([0, 0, 0, 0, 0.9, 0, 0, 0, 0]);
      expect(parameter.value.storage, [0, 0, 0, 0, 0.9, 0, 0, 0, 0]);
    });
  });
}
