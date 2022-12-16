import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIStraightenFilterConfiguration configuration;
  setUp(() {
    configuration = CIStraightenFilterConfiguration();
  });
  group('CIStraightenFilter', () {
    test('verify name', () {
      expect(configuration.name, 'CIStraightenFilter');
    });
    testInputKeys(build: () => configuration);
    test('change inputAngle', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputAngle') as NumberParameter;
      expect(parameter.value, 3.141592653589793);
      configuration.angle = 4;
      expect(parameter.value, 4);
    });
  });
}
