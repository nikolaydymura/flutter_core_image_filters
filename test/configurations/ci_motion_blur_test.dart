import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMotionBlurConfiguration configuration;
  setUp(() {
    configuration = CIMotionBlurConfiguration();
  });
  group('CIMotionBlur', () {
    test('verify name', () {
      expect(configuration.name, 'CIMotionBlur');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputRadius', 'inputAngle']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Radius', 'Angle'],
      );
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 20);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = 1;
      expect(parameter.value, 1);
    });
  });
}
