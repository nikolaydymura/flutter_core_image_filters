import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIHistogramDisplayFilterConfiguration configuration;
  setUp(() {
    configuration = CIHistogramDisplayFilterConfiguration();
  });
  group('CIHistogramDisplayFilter', () {
    test('change inputLowLimit', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputLowLimit') as NumberParameter;
      expect(parameter.value, 0);
      configuration.lowLimit = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputHighLimit', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputHighLimit') as NumberParameter;
      expect(parameter.value, 1);
      configuration.highLimit = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputHeight') as NumberParameter;
      expect(parameter.value, 100);
      configuration.height = 55;
      expect(parameter.value, 55);
    });
  });
}
