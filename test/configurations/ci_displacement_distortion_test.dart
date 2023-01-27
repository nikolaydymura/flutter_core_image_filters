import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIDisplacementDistortionConfiguration configuration;
  setUp(() {
    configuration = CIDisplacementDistortionConfiguration();
  });
  group('CIDisplacementDistortion', () {
    test('verify name', () {
      expect(configuration.name, 'CIDisplacementDistortion');
    });

    test('change inputScale', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputScale') as NumberParameter;
      expect(parameter.value, 50);
      configuration.scale = 100;
      expect(parameter.value, 100);
    });
    group('displacementImage', () {
      test('change data', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputDisplacementImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.displacementImage = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputDisplacementImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.jpeg';
        configuration.displacementImageAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
                .firstWhere((e) => e.name == 'inputDisplacementImage')
            as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.jpeg');
        configuration.displacementImageFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
