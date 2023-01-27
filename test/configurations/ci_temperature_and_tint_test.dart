import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CITemperatureAndTintConfiguration configuration;
  setUp(() {
    configuration = CITemperatureAndTintConfiguration();
  });
  group('CITemperatureAndTint', () {
    test('verify name', () {
      expect(configuration.name, 'CITemperatureAndTint');
    });
    testInputKeys(build: () => configuration);
    test('change inputTargetNeutral', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTargetNeutral') as VectorParameter;
      expect(parameter.value, [6500, 0]);
      configuration.targetNeutral = [6000, 0];
      expect(parameter.value, [6000, 0]);
    });
    test('change inputNeutral', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputNeutral') as VectorParameter;
      expect(parameter.value, [6500, 0]);
      configuration.neutral = [6000, 0];
      expect(parameter.value, [6000, 0]);
    });
  });
}
