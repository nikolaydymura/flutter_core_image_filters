import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMorphologyRectangleMinimumConfiguration configuration;
  setUp(() {
    configuration = CIMorphologyRectangleMinimumConfiguration();
  });
  group('CIMorphologyRectangleMinimum', () {
    test('verify name', () {
      expect(configuration.name, 'CIMorphologyRectangleMinimum');
    });

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
