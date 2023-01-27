import 'dart:math';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIStretchCropConfiguration configuration;
  setUp(() {
    configuration = CIStretchCropConfiguration();
  });
  group('CIStretchCrop', () {
    test('verify name', () {
      expect(configuration.name, 'CIStretchCrop');
    });

    test('change inputCenterStretchAmount', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputCenterStretchAmount')
          as NumberParameter;
      expect(parameter.value, 0.25);
      configuration.centerStretchAmount = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputCropAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCropAmount') as NumberParameter;
      expect(parameter.value, 0.25);
      configuration.cropAmount = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputSize', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSize') as CGPositionParameter;
      expect(parameter.value, const Point(1280.0, 720.0));
      configuration.size = const Point(1000, 500);
      expect(parameter.value, const Point(1000, 500));
    });
  });
}
