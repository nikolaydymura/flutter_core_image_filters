import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIRowAverageConfiguration configuration;
  setUp(() {
    configuration = CIRowAverageConfiguration();
  });
  group('CIRowAverage', () {
    test('verify name', () {
      expect(configuration.name, 'CIRowAverage');
    });

    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
      configuration.extent = const Rect.fromLTRB(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
    });
  });
}
