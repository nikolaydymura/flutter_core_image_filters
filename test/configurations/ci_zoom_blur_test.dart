import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIZoomBlurConfiguration configuration;
  setUp(() {
    configuration = CIZoomBlurConfiguration();
  });
  group('CIZoomBlur', () {
    test('change inputAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAmount') as NumberParameter;
      expect(parameter.value, 20);
      configuration.amount = 0;
      expect(parameter.value, 0);
    });
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
  });
}
