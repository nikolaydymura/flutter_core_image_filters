import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIShadedMaterialConfiguration configuration;
  setUp(() {
    configuration = CIShadedMaterialConfiguration();
  });
  group('CIShadedMaterial', () {
    test('verify name', () {
      expect(configuration.name, 'CIShadedMaterial');
    });
    testInputKeys(build: () => configuration);
    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 10);
      configuration.scale = 100;
      expect(parameter.value, 100);
    });
    group('inputShadingImage', () {
      test('change data', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputShadingImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.shadingImage = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputShadingImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.jpeg';
        configuration.shadingImageAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputShadingImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.jpeg');
        configuration.shadingImageFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
