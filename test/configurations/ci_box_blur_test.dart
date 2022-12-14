import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIBoxBlurConfiguration configuration;
  setUp(() {
    configuration = CIBoxBlurConfiguration();
  });
  group('CIBoxBlur', () {
    test('verify name', () {
      expect(configuration.name, 'CIBoxBlur');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputRadius']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(names, ['Radius']);
    });
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 10);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });
  });
}
