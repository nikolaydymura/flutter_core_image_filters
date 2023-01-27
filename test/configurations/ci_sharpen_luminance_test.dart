import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CISharpenLuminanceConfiguration configuration;
  setUp(() {
    configuration = CISharpenLuminanceConfiguration();
  });
  group('CISharpenLuminance', () {
    test('verify name', () {
      expect(configuration.name, 'CISharpenLuminance');
    });

    test('change inputSharpness', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSharpness') as NumberParameter;
      expect(parameter.value, 0.4);
      configuration.sharpness = 1;
      expect(parameter.value, 1);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 1.69);
      configuration.radius = 10;
      expect(parameter.value, 10);
    });
  });
}
