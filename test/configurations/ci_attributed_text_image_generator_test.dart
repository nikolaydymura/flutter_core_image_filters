import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIAttributedTextImageGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIAttributedTextImageGeneratorConfiguration();
  });
  group('CIAttributedTextImageGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIAttributedTextImageGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputScaleFactor', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScaleFactor') as NumberParameter;
      expect(parameter.value, 50.0);
      configuration.scaleFactor = 100;
      expect(parameter.value, 100);
    });
  });
}
