import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIHighlightShadowAdjustConfiguration configuration;
  setUp(() {
    configuration = CIHighlightShadowAdjustConfiguration();
  });
  group('CIHighlightShadowAdjust', () {
    test('change inputHighlightAmount', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputHighlightAmount')
          as NumberParameter;
      expect(parameter.value, 1);
      configuration.highlightAmount = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 0);
      configuration.radius = 5;
      expect(parameter.value, 5);
    });
    test('change inputShadowAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputShadowAmount') as NumberParameter;
      expect(parameter.value, 0);
      configuration.shadowAmount = -0.5;
      expect(parameter.value, -0.5);
    });
  });
}
