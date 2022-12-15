import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDitherConfiguration configuration;
  setUp(() {
    configuration = CIDitherConfiguration();
  });
  group('CIDither', () {
    test('verify name', () {
      expect(configuration.name, 'CIDither');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputIntensity']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(names, ['Intensity']);
    });
    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.intensity = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
