import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAttributedTextImageGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIAttributedTextImageGeneratorConfiguration();
  });
  group('CIAttributedTextImageGenerator', () {
    test('change inputScaleFactor', () {
      final parameter =
          configuration.parameters.firstWhere(
                (e) => e.name == 'inputScaleFactor',
              )
              as NumberParameter;
      expect(parameter.value, 1.0);
      configuration.scaleFactor = 100;
      expect(parameter.value, 100);
    });
    test('change inputPadding', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputPadding')
              as NumberParameter;
      expect(parameter.value, 0);
      configuration.padding = 100;
      expect(parameter.value, 100);
    });
    test('change inputText', () {
      final parameter =
          configuration.parameters.firstWhere((e) => e.name == 'inputText')
              as StringParameter;
      expect(parameter.value, '');
      configuration.text = 'a';
      expect(parameter.value, 'a');
    });
  });
}
