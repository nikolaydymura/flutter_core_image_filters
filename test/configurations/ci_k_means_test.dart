import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIKMeansConfiguration configuration;
  setUp(() {
    configuration = CIKMeansConfiguration();
  });
  group('CIKMeans', () {
    test('verify name', () {
      expect(configuration.name, 'CIKMeans');
    });

    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
      configuration.extent = const Rect.fromLTRB(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
    });

    test('change inputPerceptual', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPerceptual') as BoolParameter;
      expect(parameter.value, false);
      configuration.perceptual = true;
      expect(parameter.value, true);
    });

    test('change inputCount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCount') as NumberParameter;
      expect(parameter.value, 8);
      configuration.count = 60;
      expect(parameter.value, 60);
    });

    test('change inputPasses', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPasses') as NumberParameter;
      expect(parameter.value, 5);
      configuration.passes = 10;
      expect(parameter.value, 10);
    });
  });
}
