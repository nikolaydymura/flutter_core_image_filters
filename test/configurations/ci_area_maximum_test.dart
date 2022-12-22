import 'dart:ui';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIAreaMaximumConfiguration configuration;
  setUp(() {
    configuration = CIAreaMaximumConfiguration();
  });
  group('CIAreaMaximum', () {
    test('verify name', () {
      expect(configuration.name, 'CIAreaMaximum');
    });
    testInputKeys(build: () => configuration);
    test('change inputExtent', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtent') as CGRectParameter;
      expect(parameter.value, const Rect.fromLTRB(0, 0, 640, 80));
      configuration.extent = const Rect.fromLTRB(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTRB(0, 0, 300, 300));
    });
  });
}
