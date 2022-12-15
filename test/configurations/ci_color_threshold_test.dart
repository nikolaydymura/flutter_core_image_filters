import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorThresholdConfiguration configuration;
  setUp(() {
    configuration = CIColorThresholdConfiguration();
  });
  group('CIColorThreshold', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorThreshold');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputThreshold']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['Threshold'],
      );
    });
    test('change inputThreshold', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputThreshold') as NumberParameter;
      expect(parameter.value, 0.5);
      configuration.threshold = 0.6;
      expect(parameter.value, 0.6);
    });
  });
}
