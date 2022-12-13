import 'package:collection/collection.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIAttributedTextImageGeneratorConfiguration configuration;
  setUp(() {
    configuration = CIAttributedTextImageGeneratorConfiguration();
  });
  group('CIAttributedTextImageGenerator', () {
    test('verify name', () {
      expect(configuration.name, 'CIAttributedTextImageGenerator');
    });
    test('verify inputKeys', () {
      final parameters =
          configuration.parameters.map((e) => e.name).toSet().sorted();
      expect(parameters, ['inputScaleFactor']);
      final names =
          configuration.parameters.map((e) => e.displayName).toSet().sorted();
      expect(names, ['ScaleFactor']);
    });
    test('change inputIntensity', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputIntensity') as NumberParameter;
      expect(parameter.value, 50.0);
      configuration.scaleFactor = 100;
      expect(parameter.value, 100);
    });
  });
}
