import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIPerspectiveRotateConfiguration configuration;
  setUp(() {
    configuration = CIPerspectiveRotateConfiguration();
  });
  group('CIPerspectiveRotate', () {
    test('verify name', () {
      expect(configuration.name, 'CIPerspectiveRotate');
    });
    testInputKeys(build: () => configuration);
    test('change inputFocalLength', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFocalLength') as NumberParameter;
      expect(parameter.value, 20);
      configuration.focalLength = 10;
      expect(parameter.value, 10);
    });

    test('change inputRoll', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRoll') as NumberParameter;
      expect(parameter.value, 0);
      configuration.roll = 10;
      expect(parameter.value, 10);
    });
    test('change inputPitch', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPitch') as NumberParameter;
      expect(parameter.value, 0);
      configuration.pitch = 10;
      expect(parameter.value, 10);
    });
    test('change inputYaw', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputYaw') as NumberParameter;
      expect(parameter.value, 1);
      configuration.yaw = 10;
      expect(parameter.value, 10);
    });
  });
}
