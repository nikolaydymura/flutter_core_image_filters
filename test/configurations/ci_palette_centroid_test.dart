import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIPaletteCentroidConfiguration configuration;
  setUp(() {
    configuration = CIPaletteCentroidConfiguration();
  });
  group('CIPaletteCentroid', () {
    test('verify name', () {
      expect(configuration.name, 'CIPaletteCentroid');
    });
    testInputKeys(build: () => configuration);
    test('change inputPerceptual', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPerceptual') as NumberParameter;
      expect(parameter.value, 0);
      configuration.perceptual = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
