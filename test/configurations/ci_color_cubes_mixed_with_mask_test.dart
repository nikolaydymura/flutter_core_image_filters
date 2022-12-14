import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorCubesMixedWithMaskConfiguration configuration;
  setUp(() {
    configuration = CIColorCubesMixedWithMaskConfiguration();
  });
  group('CIColorCubesMixedWithMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorCubesMixedWithMask');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(
        parameters,
        ['inputCubeDimension', 'inputCubeData'],
      );
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Cube Dimension', 'Cube Data'],
      );
    });
  });
}
