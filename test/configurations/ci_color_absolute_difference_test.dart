import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorAbsoluteDifferenceConfiguration configuration;
  setUp(() {
    configuration = CIColorAbsoluteDifferenceConfiguration();
  });
  group('CIColorAbsoluteDifference', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorAbsoluteDifference');
    });
    test('verify inputImage2', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputImage2']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(names, ['Image 2']);
    });
  });
}
