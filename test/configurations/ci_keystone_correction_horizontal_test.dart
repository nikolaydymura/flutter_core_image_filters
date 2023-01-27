import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIKeystoneCorrectionHorizontalConfiguration configuration;
  setUp(() {
    configuration = CIKeystoneCorrectionHorizontalConfiguration();
  });
  group('CIKeystoneCorrectionHorizontal', () {
    test('verify name', () {
      expect(configuration.name, 'CIKeystoneCorrectionHorizontal');
    });

    test('change inputTopRight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTopRight') as CGPositionParameter;
      expect(parameter.value, const Point(0, 0));
      configuration.topRight = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputTopLeft', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTopLeft') as CGPositionParameter;
      expect(parameter.value, const Point(0, 0));
      configuration.topLeft = const Point(200, 200);
      expect(parameter.value, const Point(200, 200));
    });

    test('change inputBottomLeft', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBottomLeft')
          as CGPositionParameter;
      expect(parameter.value, const Point(0, 0));
      configuration.bottomLeft = const Point(150, 150);
      expect(parameter.value, const Point(150, 150));
    });
    test('change inputBottomRight', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBottomRight')
          as CGPositionParameter;
      expect(parameter.value, const Point(0, 0));
      configuration.bottomRight = const Point(50, 50);
      expect(parameter.value, const Point(50, 50));
    });

    test('change inputFocalLength', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFocalLength') as NumberParameter;
      expect(parameter.value, 28);
      configuration.focalLength = 10;
      expect(parameter.value, 10);
    });
  });
}
