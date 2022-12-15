import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMixConfiguration configuration;
  setUp(() {
    configuration = CIMixConfiguration();
  });
  group('CIMix', () {
    test('verify name', () {
      expect(configuration.name, 'CIMix');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputAmount']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(names, ['Amount']);
    });
    test('change inputAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAmount') as NumberParameter;
      expect(parameter.value, 1);
      configuration.amount = 0.5;
      expect(parameter.value, 0.5);
    });
  });
}
