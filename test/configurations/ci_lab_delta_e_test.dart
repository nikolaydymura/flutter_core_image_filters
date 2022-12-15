import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CILabDeltaEConfiguration configuration;
  setUp(() {
    configuration = CILabDeltaEConfiguration();
  });
  group('CILabDeltaE', () {
    test('verify name', () {
      expect(configuration.name, 'CILabDeltaE');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputScale', 'inputAspectRatio']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Scale', 'AspectRatio'],
      );
    });
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 0);
      configuration.scale = 1;
      expect(parameter.value, 1);
    });

    test('change inputAspectRatio', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAspectRatio') as NumberParameter;
      expect(parameter.value, 0);
      configuration.aspectRatio = 1;
      expect(parameter.value, 1);
    });
  });
}
