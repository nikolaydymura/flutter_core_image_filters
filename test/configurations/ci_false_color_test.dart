import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIFalseColorConfiguration configuration;
  setUp(() {
    configuration = CIFalseColorConfiguration();
  });
  group('CIFalseColor', () {
    test('verify name', () {
      expect(configuration.name, 'CIFalseColor');
    });
    testInputKeys(build: () => configuration);
    test('change inputColor0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor0') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 1.0));
      configuration.color0 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputColor1', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor1') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 1.0));
      configuration.color1 = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
  });
}
