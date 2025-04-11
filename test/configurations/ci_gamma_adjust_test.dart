import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIGammaAdjustConfiguration configuration;
  setUp(() {
    configuration = CIGammaAdjustConfiguration();
  });
  group('CIGammaAdjust', () {
    test('change inputPower', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputPower')
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.power = 2;
      expect(parameter.value, 2);
    });
  });
}
