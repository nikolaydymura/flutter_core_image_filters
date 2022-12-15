import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIFalseColorConfiguration configuration;
  setUp(() {
    configuration = CIFalseColorConfiguration();
  });
  group('CIFalseColor', () {
    test('verify name', () {
      expect(configuration.name, 'CIFalseColor');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputColor0', 'inputEV']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(names, ['Color0', 'EV']);
    });
    test('change inputColor0', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColor0') as ColorParameter;
      expect(parameter.value, const Color.fromRGBO(0, 0, 0, 1.0));
      configuration.color = Colors.orange;
      expect(parameter.value, Colors.orange);
    });
    test('change inputEV', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputEV') as NumberParameter;
      expect(parameter.value, 0);
      configuration.eV = -8;
      expect(parameter.value, -8);
    });
  });
}
