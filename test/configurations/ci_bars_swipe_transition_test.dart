import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIBarsSwipeTransitionConfiguration configuration;
  setUp(() {
    configuration = CIBarsSwipeTransitionConfiguration();
  });
  group('CIBarsSwipeTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CIBarsSwipeTransition');
    });
    testInputKeys(build: () => configuration);
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 3.141592653589793);
      configuration.angle = 5;
      expect(parameter.value, 5);
    });
    test('change inputWidth', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputWidth') as NumberParameter;
      expect(parameter.value, 30);
      configuration.width = 2;
      expect(parameter.value, 2);
    });
    test('change inputBarOffset', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBarOffset') as NumberParameter;
      expect(parameter.value, 1);
      configuration.barOffset = 50;
      expect(parameter.value, 50);
    });
  });
}
