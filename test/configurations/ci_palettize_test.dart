import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIPalettizeConfiguration configuration;
  setUp(() {
    configuration = CIPalettizeConfiguration();
  });
  group('CIPalettize', () {
    test('change inputPerceptual', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPerceptual') as BoolParameter;
      expect(parameter.value, false);
      configuration.perceptual = true;
      expect(parameter.value, true);
    });
  });
}
