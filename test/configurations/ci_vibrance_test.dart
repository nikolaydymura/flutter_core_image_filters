import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIVibranceConfiguration configuration;
  setUp(() {
    configuration = CIVibranceConfiguration();
  });
  group('CIVibrance', () {
    test('change inputAmount', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAmount') as NumberParameter;
      expect(parameter.value, 0);
      configuration.amount = 0.25;
      expect(parameter.value, 0.25);
    });
  });
}
