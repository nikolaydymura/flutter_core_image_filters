import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAffineTileConfiguration configuration;
  setUp(() {
    configuration = CIAffineTileConfiguration();
  });
  group('CIAffineTile', () {
    test('change inputTransform', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputTransform')
              as CGAffineTransformParameter;
      expect(parameter.value, const CGAffineTransform());
      configuration.transform = const CGAffineTransform().copyWith(
        a: 0.0,
        b: 1.0,
        c: 1.0,
        d: 0.0,
        tx: 1.0,
        ty: 1.0,
      );
      expect(
        parameter.value,
        const CGAffineTransform().copyWith(
          a: 0.0,
          b: 1.0,
          c: 1.0,
          d: 0.0,
          tx: 1.0,
          ty: 1.0,
        ),
      );
    });
  });
}
