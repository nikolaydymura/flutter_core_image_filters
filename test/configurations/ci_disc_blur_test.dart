import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDiscBlurConfiguration configuration;
  setUp(() {
    configuration = CIDiscBlurConfiguration();
  });
  group('CIDiscBlur', () {
    test('change inputRadius', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputRadius')
              as NumberParameter;
      expect(parameter.value, 8);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });
  });
}
