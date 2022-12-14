import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorMapConfiguration configuration;
  setUp(() {
    configuration = CIColorMapConfiguration();
  });
  group('CIColorMap', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorMap');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(
        parameters,
        ['inputGradientImage'],
      );
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Gradient Image'],
      );
    });
  });
}
