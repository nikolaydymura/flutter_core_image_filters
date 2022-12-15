import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIHistogramDisplayFilterConfiguration configuration;
  setUp(() {
    configuration = CIHistogramDisplayFilterConfiguration();
  });
  group('CIHistogramDisplayFilter', () {
    test('verify name', () {
      expect(configuration.name, 'CIHistogramDisplayFilter');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(
        parameters,
        ['inputLowLimit', 'inputHighLimit', 'inputHeight'],
      );
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['LowLimit', 'HighLimit', 'Height'],
      );
    });
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
