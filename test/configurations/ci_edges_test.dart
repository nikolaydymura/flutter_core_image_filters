import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIEdgesConfiguration configuration;
  setUp(() {
    configuration = CIEdgesConfiguration();
  });
  group('CIEdges', () {
    test('verify name', () {
      expect(configuration.name, 'CIEdges');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputIntensity']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Intensity'],
      );
    });

    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 1);
      configuration.intensity = 6;
      expect(parameter.value, 6);
    });
  });
}
