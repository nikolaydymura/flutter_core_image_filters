import 'dart:typed_data';

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
    test('change inputCurvesData', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCurvesData') as DataParameter;
      expect(parameter.data, isNull);
      configuration.curvesData0 = Uint8List(0);
      expect(parameter.data, isNotNull);
    });
  });
}
