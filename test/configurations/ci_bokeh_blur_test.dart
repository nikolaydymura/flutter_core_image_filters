import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBokehBlurConfiguration configuration;
  setUp(() {
    configuration = CIBokehBlurConfiguration();
  });
  group('CIBokehBlur', () {
    test('verify name', () {
      expect(configuration.name, 'CIBokehBlur');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters,
          ['inputSoftness', 'inputRingSize', 'inputRadius', 'inputRingAmount']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Softness', 'RingSize', 'Radius', 'RingAmount'],
      );
    });
    test('change inputSoftness', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSoftness') as NumberParameter;
      expect(parameter.value, 1);
      configuration.softness = 5;
      expect(parameter.value, 5);
    });

    test('change inputRingSize', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRingSize') as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.ringSize = 0.15;
      expect(parameter.value, 0.15);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 20);
      configuration.radius = 200;
      expect(parameter.value, 200);
    });
    test('change inputRingAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRingAmount') as NumberParameter;
      expect(parameter.value, 0);
      configuration.ringAmount = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
