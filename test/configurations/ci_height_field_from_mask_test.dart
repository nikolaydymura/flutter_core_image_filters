import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIHeightFieldFromMaskConfiguration configuration;
  setUp(() {
    configuration = CIHeightFieldFromMaskConfiguration();
  });
  group('CIHeightFieldFromMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIHeightFieldFromMask');
    });

    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 10);
      configuration.radius = 150;
      expect(parameter.value, 150);
    });
  });
}
