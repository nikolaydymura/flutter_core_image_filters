import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDiscBlurConfiguration configuration;
  setUp(() {
    configuration = CIDiscBlurConfiguration();
  });
  group('CIDiscBlur', () {
    test('verify name', () {
      expect(configuration.name, 'CIDiscBlur');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputRadius']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Radius'],
      );
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 8);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });
  });
}
