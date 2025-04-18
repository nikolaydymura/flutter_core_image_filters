import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIWhitePointAdjustConfiguration configuration;
  setUp(() {
    configuration = CIWhitePointAdjustConfiguration();
  });
  group('CIWhitePointAdjust', () {
    test('change inputColor', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputColor')
              as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1.0));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
  });
}
