import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorCurvesConfiguration configuration;
  setUp(() {
    configuration = CIColorCurvesConfiguration();
  });
  group('CIColorCurves', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorCurves');
    });
    test('change inputColorSpace', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColorSpace') as StringParameter;
      expect(parameter.value, '');
      configuration.colorSpace = 'a';
      expect(parameter.value, 'a');
    });
    test('change inputCurvesDomain', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCurvesDomain') as VectorParameter;
      expect(parameter.value, [0.0, 1.0]);
      configuration.curvesDomain = [0.5, 0.9];
      expect(parameter.value, [0.5, 0.9]);
    });
  });
}
