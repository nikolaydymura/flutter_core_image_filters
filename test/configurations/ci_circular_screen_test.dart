import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CICircularScreenConfiguration configuration;
  setUp(() {
    configuration = CICircularScreenConfiguration();
  });
  group('CICircularScreen',  () {
    test('verify name', () {
      expect(configuration.name, 'CICircularScreen');
    });
    testInputKeys(build: () => configuration);
    test('change inputCenter', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCenter') as CGPositionParameter;
      expect(parameter.value, const Point(150, 150));
      configuration.center = const Point(100, 100);
      expect(parameter.value, const Point(100, 100));
    });
    test('change inputSharpness', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSharpness') as NumberParameter;
      expect(parameter.value, 0.7);
      configuration.sharpness = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
