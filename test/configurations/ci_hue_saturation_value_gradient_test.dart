import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIHueSaturationValueGradientConfiguration configuration;
  setUp(() {
    configuration = CIHueSaturationValueGradientConfiguration();
  });
  group('CIHueSaturationValueGradient', () {
    test('verify name', () {
      expect(configuration.name, 'CIHueSaturationValueGradient');
    });

    test('change inputColorSpace', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColorSpace') as StringParameter;
      expect(parameter.value, '');
      configuration.colorSpace = 'a';
      expect(parameter.value, 'a');
    });

    test('change inputDither', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputDither') as NumberParameter;
      expect(parameter.value, 1);
      configuration.dither = 2;
      expect(parameter.value, 2);
    });
    test('change inputSoftness', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSoftness') as NumberParameter;
      expect(parameter.value, 1);
      configuration.softness = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 300);
      configuration.radius = 500;
      expect(parameter.value, 500);
    });
    test('change inputValue', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputValue') as NumberParameter;
      expect(parameter.value, 1);
      configuration.value = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
