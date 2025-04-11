import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorControlsConfiguration configuration;
  setUp(() {
    configuration = CIColorControlsConfiguration();
  });
  group('CIColorControls', () {
    test('change inputBrightness', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputBrightness',
              )
              as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.brightness = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputSaturation', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputSaturation',
              )
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.saturation = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputContrast', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputContrast')
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.contrast = 2.5;
      expect(parameter.value, 2.5);
    });
  });
}
