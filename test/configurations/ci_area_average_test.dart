import 'dart:ui';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAreaAverageConfiguration configuration;
  setUp(() {
    configuration = CIAreaAverageConfiguration();
  });
  group('CIAreaAverage', () {
    test('change inputExtent', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputExtent')
              as CGRectParameter;
      expect(parameter.value, const Rect.fromLTWH(0, 0, 640, 80));
      configuration.extent = const Rect.fromLTWH(0, 0, 300, 300);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 300, 300));
    });
  });
}
