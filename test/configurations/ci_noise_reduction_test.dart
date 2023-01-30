import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CINoiseReductionConfiguration configuration;
  setUp(() {
    configuration = CINoiseReductionConfiguration();
  });
  group('CINoiseReduction', () {
    test('change inputNoiseLevel', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputNoiseLevel') as NumberParameter;
      expect(parameter.value, 0.02);
      configuration.noiseLevel = 0.05;
      expect(parameter.value, 0.05);
    });

    test('change inputSharpness', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSharpness') as NumberParameter;
      expect(parameter.value, 0.4);
      configuration.sharpness = 1;
      expect(parameter.value, 1);
    });
  });
}
