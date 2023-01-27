import 'dart:ui';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAreaLogarithmicHistogramConfiguration configuration;
  setUp(() {
    configuration = CIAreaLogarithmicHistogramConfiguration();
  });
  group('CIAreaLogarithmicHistogram', () {
    test('verify name', () {
      expect(configuration.name, 'CIAreaLogarithmicHistogram');
    });

    test('change inputMinimumStop', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMinimumStop') as NumberParameter;
      expect(parameter.value, -10);
      configuration.minimumStop = -6;
      expect(parameter.value, -6);
    });
    test('change inputMaximumStop', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaximumStop') as NumberParameter;
      expect(parameter.value, 4);
      configuration.maximumStop = 2;
      expect(parameter.value, 2);
    });
    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
      configuration.extent = const Rect.fromLTRB(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
    });
    test('change inputCount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCount') as NumberParameter;
      expect(parameter.value, 64);
      configuration.count = 500;
      expect(parameter.value, 500);
    });
  });
}
