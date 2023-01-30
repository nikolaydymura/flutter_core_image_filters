import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIEdgePreserveUpsampleFilterConfiguration configuration;
  setUp(() {
    configuration = CIEdgePreserveUpsampleFilterConfiguration();
  });
  group('CIEdgePreserveUpsampleFilter', () {
    test('change inputLumaSigma', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputLumaSigma') as NumberParameter;
      expect(parameter.value, 0.15);
      configuration.lumaSigma = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputSpatialSigma', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSpatialSigma') as NumberParameter;
      expect(parameter.value, 3);
      configuration.spatialSigma = 2.5;
      expect(parameter.value, 2.5);
    });
  });
}
