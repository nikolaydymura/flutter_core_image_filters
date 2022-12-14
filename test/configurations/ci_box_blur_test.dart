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
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.radius = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
