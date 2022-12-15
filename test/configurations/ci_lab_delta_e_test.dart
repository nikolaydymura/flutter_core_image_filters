import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILabDeltaEConfiguration configuration;
  setUp(() {
    configuration = CILabDeltaEConfiguration();
  });
  group('CILabDeltaE', () {
    test('verify name', () {
      expect(configuration.name, 'CILabDeltaE');
    });
    testInputKeys(build: () => configuration);
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
