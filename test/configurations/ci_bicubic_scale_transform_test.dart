import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBicubicScaleTransformConfiguration configuration;
  setUp(() {
    configuration = CIBicubicScaleTransformConfiguration();
  });
  group('CIBicubicScaleTransform', () {
    test('change inputB', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputB')
              as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.b = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputScale', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputScale')
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.scale = 50;
      expect(parameter.value, 50);
    });
    test('change inputC', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputC')
              as NumberParameter;
      expect(parameter.value, 0.75);
      configuration.c = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputAspectRatio', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputAspectRatio',
              )
              as NumberParameter;
      expect(parameter.value, 1);
      configuration.aspectRatio = 1.2;
      expect(parameter.value, 1.2);
    });
  });
}
