import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIMorphologyGradientConfiguration configuration;
  setUp(() {
    configuration = CIMorphologyGradientConfiguration();
  });
  group('CIMorphologyGradient', () {
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 5);
      configuration.radius = 25;
      expect(parameter.value, 25);
    });
  });
}
