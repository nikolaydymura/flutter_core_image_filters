import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDrosteConfiguration configuration;
  setUp(() {
    configuration = CIDrosteConfiguration();
  });
  group('CIDroste', () {
    test('verify name', () {
      expect(configuration.name, 'CIDroste');
    });

    test('change inputInsetPoint0', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputInsetPoint0')
          as CGPositionParameter;
      expect(parameter.value, const Point(200, 200));
      configuration.insetPoint0 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputStrands', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputStrands') as NumberParameter;
      expect(parameter.value, 1);
      configuration.strands = 0;
      expect(parameter.value, 0);
    });
    test('change inputInsetPoint1', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputInsetPoint1')
          as CGPositionParameter;
      expect(parameter.value, const Point(400, 400));
      configuration.insetPoint1 = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });

    test('change inputPeriodicity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPeriodicity') as NumberParameter;
      expect(parameter.value, 1);
      configuration.periodicity = 2;
      expect(parameter.value, 2);
    });

    test('change inputZoom', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputZoom') as NumberParameter;
      expect(parameter.value, 1.0);
      configuration.zoom = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputRotation', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRotation') as NumberParameter;
      expect(parameter.value, 0);
      configuration.rotation = 3;
      expect(parameter.value, 3);
    });
  });
}
