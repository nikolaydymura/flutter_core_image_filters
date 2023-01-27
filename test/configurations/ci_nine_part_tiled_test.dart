import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CINinePartTiledConfiguration configuration;
  setUp(() {
    configuration = CINinePartTiledConfiguration();
  });
  group('CINinePartTiled', () {
    test('verify name', () {
      expect(configuration.name, 'CINinePartTiled');
    });

    test('change inputBreakpoint1', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBreakpoint1')
          as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.breakpoint1 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputBreakpoint0', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBreakpoint0')
          as CGPositionParameter;
      expect(parameter.value, const Point(50, 50));
      configuration.breakpoint0 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputFlipYTiles', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputFlipYTiles')
          as SliderNSNumberParameter;
      expect(parameter.value, 1);
      configuration.flipYTiles = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputGrowAmount', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputGrowAmount')
          as CGPositionParameter;
      expect(parameter.value, const Point(100, 100));
      configuration.growAmount = const Point(150, 150);
      expect(parameter.value, const Point(150, 150));
    });
  });
}
