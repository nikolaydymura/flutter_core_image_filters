import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CITextImageGeneratorConfiguration configuration;
  setUp(() {
    configuration = CITextImageGeneratorConfiguration();
  });
  group('CITextImageGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CITextImageGenerator');
    });
    testInputKeys(build: () => configuration);
    test('change inputFontName', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFontName') as StringParameter;
      expect(parameter.value, 'HelveticaNeue');
      configuration.fontName = 'TimesNewRoman';
      expect(parameter.value, 'TimesNewRoman');
    });
    test('change inputText', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputText') as StringParameter;
      expect(parameter.value, '');
      configuration.text = 'a';
      expect(parameter.value, 'a');
    });
    test('change inputFontSize', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputFontSize') as NumberParameter;
      expect(parameter.value, 12);
      configuration.fontSize = 16;
      expect(parameter.value, 16);
    });
  });
}