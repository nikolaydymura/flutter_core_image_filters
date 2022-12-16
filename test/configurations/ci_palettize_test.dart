import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIPalettizeConfiguration configuration;
  setUp(() {
    configuration = CIPalettizeConfiguration();
  });
  group('CIPalettize', () {
    test('verify name', () {
      expect(configuration.name, 'CIPalettize');
    });
    testInputKeys(build: () => configuration);
    test('change inputPerceptual', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputPerceptual') as NumberParameter;
      expect(parameter.value, 0);
      configuration.perceptual = 0.5;
      expect(parameter.value, 0.5);
    });
    group('inputPaletteImage', () {
      test('change data', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputPaletteImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.paletteImage = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputPaletteImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.jpeg';
        configuration.paletteImageAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputPaletteImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.jpeg');
        configuration.paletteImageFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
