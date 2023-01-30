import 'dart:ui';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CICropConfiguration configuration;
  setUp(() {
    configuration = CICropConfiguration();
  });
  group('CICrop', () {
    test('change inputRectangle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRectangle') as CGRectParameter;
      expect(
        parameter.value,
        const Rect.fromLTWH(
          -8.98847e+307,
          -8.98847e+307,
          1.79769e+308,
          1.79769e+308,
        ),
      );
      configuration.rectangle = const Rect.fromLTWH(0, 0, 0, 0);
      expect(parameter.value, const Rect.fromLTWH(0, 0, 0, 0));
    });
  });
}
