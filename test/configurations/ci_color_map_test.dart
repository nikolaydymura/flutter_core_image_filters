import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorMapConfiguration configuration;
  setUp(() {
    configuration = CIColorMapConfiguration();
  });
  group('CIColorMap', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorMap');
    });
  });
  group('inputGradientImage', () {
    test('change data', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputGradientImage')
          as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final data = Uint8List(0);
      configuration.gradientImage = data;
      expect(parameter.data, data);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
    });
    test('change asset', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputGradientImage')
          as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      const asset = 'demo.jpeg';
      configuration.gradientImageAsset = asset;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, asset);
    });
    test('change file', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputGradientImage')
          as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final file = File('demo.jpeg');
      configuration.gradientImageFile = file;
      expect(parameter.data, isNull);
      expect(parameter.file, file);
      expect(parameter.asset, isNull);
    });
  });
}
