import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISepiaToneConfiguration configuration;
  setUp(() {
    configuration = CISepiaToneConfiguration();
  });
  group('CISepiaTone', () {
    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 1);
      configuration.intensity = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
