import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIRoundedRectangleGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIRoundedRectangleGeneratorConfiguration();
  });
  group('CIRoundedRectangleGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIRoundedRectangleGenerator');
    });
    testInputKeys(build: () => configuration);

    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 100, 100));
      configuration.extent = const Rect.fromLTRB(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
    });
    test('change inputColor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(255, 255, 255, 1.0));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 10);
      configuration.radius = 50;
      expect(parameter.value, 50);
    });
  });
}
