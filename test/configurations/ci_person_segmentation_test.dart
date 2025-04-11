import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPersonSegmentationConfiguration configuration;
  setUp(() {
    configuration = CIPersonSegmentationConfiguration();
  });
  group('CIPersonSegmentation', () {
    test('change inputQualityLevel', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputQualityLevel',
              )
              as NumberParameter;
      expect(parameter.value.isNaN, true);
      configuration.qualityLevel = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
