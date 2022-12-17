import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIMorphologyRectangleMaximumConfiguration configuration;
  setUp(() {
    configuration = CIMorphologyRectangleMaximumConfiguration();
  });
  group('CIMorphologyRectangleMaximum', () {
    test('verify name', () {
      expect(configuration.name, 'CIMorphologyRectangleMaximum');
    });
    testInputKeys(build: () => configuration);
    test('change inputHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputHeight') as NumberParameter;
      expect(parameter.value, 5);
      configuration.height = 30;
      expect(parameter.value, 30);
    });

    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 5);
      configuration.width = 30;
      expect(parameter.value, 30);
    });
  });
}
