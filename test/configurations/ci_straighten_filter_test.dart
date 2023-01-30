import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIStraightenFilterConfiguration configuration;
  setUp(() {
    configuration = CIStraightenFilterConfiguration();
  });
  group('CIStraightenFilter', () {
    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.angle = 4;
      expect(parameter.value, 4);
    });
  });
}
