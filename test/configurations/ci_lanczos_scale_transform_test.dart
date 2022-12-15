import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILanczosScaleTransformConfiguration configuration;
  setUp(() {
    configuration = CILanczosScaleTransformConfiguration();
  });
  group('CILanczosScaleTransform', () {
    test('verify name', () {
      expect(configuration.name, 'CILanczosScaleTransform');
    });
    testInputKeys(build: () => configuration);
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 1);
      configuration.scale = 1.25;
      expect(parameter.value, 1.25);
    });

    test('change inputAspectRatio', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAspectRatio') as NumberParameter;
      expect(parameter.value, 1);
      configuration.aspectRatio = 1.55;
      expect(parameter.value, 1.55);
    });
  });
}
