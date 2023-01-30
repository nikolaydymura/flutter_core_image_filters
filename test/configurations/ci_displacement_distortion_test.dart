import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDisplacementDistortionConfiguration configuration;
  setUp(() {
    configuration = CIDisplacementDistortionConfiguration();
  });
  group('CIDisplacementDistortion', () {
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 50);
      configuration.scale = 100;
      expect(parameter.value, 100);
    });
  });
}
