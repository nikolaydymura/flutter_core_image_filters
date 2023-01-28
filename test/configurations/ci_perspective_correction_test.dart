import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPerspectiveCorrectionConfiguration configuration;
  setUp(() {
    configuration = CIPerspectiveCorrectionConfiguration();
  });
  group('CIPerspectiveCorrection', () {
    test('verify name', () {
      expect(configuration.name, 'CIPerspectiveCorrection');
    });

    test('change inputBottomLeft', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBottomLeft')
          as CGPositionParameter;
      expect(parameter.value, const Point(155, 153));
      configuration.bottomLeft = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputTopRight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTopRight') as CGPositionParameter;
      expect(parameter.value, const Point(646.0, 507.0));
      configuration.topRight = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputTopLeft', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTopLeft') as CGPositionParameter;
      expect(parameter.value, const Point(118.0, 484.0));
      configuration.topLeft = const Point(150, 150);
      expect(parameter.value, const Point(150, 150));
    });
    test('change inputCrop', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCrop') as SliderNSNumberParameter;
      expect(parameter.value, 1);
      configuration.crop = 10;
      expect(parameter.value, 10);
    });
    test('change inputBottomRight', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBottomRight')
          as CGPositionParameter;
      expect(parameter.value, const Point(548.0, 140.0));
      configuration.bottomRight = const Point(150, 150);
      expect(parameter.value, const Point(150, 150));
    });
  });
}
