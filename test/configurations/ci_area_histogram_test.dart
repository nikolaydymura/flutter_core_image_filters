import 'dart:ui';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAreaHistogramConfiguration configuration;
  setUp(() {
    configuration = CIAreaHistogramConfiguration();
  });
  group('CIAreaHistogram', () {
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 1);
      configuration.scale = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputCount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCount') as NumberParameter;
      expect(parameter.value, 64);
      configuration.count = 500;
      expect(parameter.value, 500);
    });
    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTWH(0, 0, 640, 80));
      configuration.extent = const Rect.fromLTWH(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 300, 300));
    });
  });
}
