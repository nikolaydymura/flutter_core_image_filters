import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CINinePartStretchedConfiguration configuration;
  setUp(() {
    configuration = CINinePartStretchedConfiguration();
  });
  group('CINinePartStretched', skip: true, () {
    test('verify name', () {
      expect(configuration.name, 'CINinePartStretched');
    });
    testInputKeys(build: () => configuration);
    test('change inputBreakpoint1', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBreakpoint1')
          as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.breakpoint1 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputGrowAmount', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputGrowAmount')
          as CGPositionParameter;
      expect(parameter.value, const Point(100, 100));
      configuration.growAmount = const Point(150, 150);
      expect(parameter.value, const Point(150, 150));
    });
    test('change inputBreakpoint0', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBreakpoint0')
          as CGPositionParameter;
      expect(parameter.value, const Point(50, 50));
      configuration.breakpoint0 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
  });
}
