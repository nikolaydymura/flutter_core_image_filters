import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CILineOverlayConfiguration configuration;
  setUp(() {
    configuration = CILineOverlayConfiguration();
  });
  group('CILineOverlay', () {
    test('change inputNoiseLevel', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputNRNoiseLevel',
              )
              as NumberParameter;
      expect(parameter.value, 0.07000000000000001);
      configuration.noiseLevel = 0.08;
      expect(parameter.value, 0.08);
    });

    test('change inputContrast', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputContrast')
              as NumberParameter;
      expect(parameter.value, 50);
      configuration.contrast = 100;
      expect(parameter.value, 100);
    });
    test('change inputThreshold', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputThreshold')
              as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.threshold = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputEdgeIntensity', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputEdgeIntensity',
              )
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.edgeIntensity = 100;
      expect(parameter.value, 100);
    });
    test('change inputNRSharpness', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputNRSharpness',
              )
              as NumberParameter;
      expect(parameter.value, 0.71);
      configuration.nrSharpness = 1;
      expect(parameter.value, 1);
    });
  });
}
