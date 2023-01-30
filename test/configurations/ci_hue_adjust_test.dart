import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIHueAdjustConfiguration configuration;
  setUp(() {
    configuration = CIHueAdjustConfiguration();
  });
  group('CIHueAdjust', () {
    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0);
      configuration.angle = -1;
      expect(parameter.value, -1);
    });
  });
}
