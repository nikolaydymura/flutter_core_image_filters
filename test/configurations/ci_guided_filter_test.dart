import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIGuidedFilterConfiguration configuration;
  setUp(() {
    configuration = CIGuidedFilterConfiguration();
  });
  group('CIGuidedFilter', () {
    test('change inputEpsilon', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputEpsilon')
              as NumberParameter;
      expect(parameter.value, 0.0001);
      configuration.epsilon = 0.0;
      expect(parameter.value, 0.0);
    });
    test('change inputRadius', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputRadius')
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.radius = 4;
      expect(parameter.value, 4);
    });
  });
}
