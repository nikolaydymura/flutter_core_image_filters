import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIExposureAdjustConfiguration configuration;
  setUp(() {
    configuration = CIExposureAdjustConfiguration();
  });
  group('CIExposureAdjust', () {
    test('verify name', () {
      expect(configuration.name, 'CIExposureAdjust');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputEV']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(
        names,
        ['EV'],
      );
    });

    test('change inputEV', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputEV') as NumberParameter;
      expect(parameter.value, 0);
      configuration.eV = 2;
      expect(parameter.value, 2);
    });
  });
}
