import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDissolveTransitionConfiguration configuration;
  setUp(() {
    configuration = CIDissolveTransitionConfiguration();
  });
  group('CIDissolveTransition', () {
    test('change inputTime', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputTime')
              as NumberParameter;
      expect(parameter.value, 0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
