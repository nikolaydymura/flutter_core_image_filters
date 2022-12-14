import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorPosterizeConfiguration configuration;
  setUp(() {
    configuration = CIColorPosterizeConfiguration();
  });
  group('CIColorPosterize', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorPosterize');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputLevels']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Levels'],
      );
    });
    test('change inputLevels', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputLevels') as NumberParameter;
      expect(parameter.value, 6);
      configuration.levels = 16;
      expect(parameter.value, 16);
    });
  });
}
