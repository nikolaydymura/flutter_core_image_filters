import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIColorMonochromeConfiguration configuration;
  setUp(() {
    configuration = CIColorMonochromeConfiguration();
  });
  group('CIColorMonochrome', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorMonochrome');
    });
    testInputKeys(build: () => configuration);
    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 1.0);
      configuration.intensity = 0.5;
      expect(parameter.value, 0.5);
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(153, 115, 76, 1.0));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
  });
}
