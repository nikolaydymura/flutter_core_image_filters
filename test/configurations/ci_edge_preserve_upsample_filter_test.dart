import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIEdgePreserveUpsampleFilterConfiguration configuration;
  setUp(() {
    configuration = CIEdgePreserveUpsampleFilterConfiguration();
  });
  group('CIEdgePreserveUpsampleFilter', () {
    test('verify name', () {
      expect(configuration.name, 'CIEdgePreserveUpsampleFilter');
    });

    test('change inputLumaSigma', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputLumaSigma') as NumberParameter;
      expect(parameter.value, 0.15);
      configuration.lumaSigma = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputSpatialSigma', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputSpatialSigma') as NumberParameter;
      expect(parameter.value, 3);
      configuration.spatialSigma = 2.5;
      expect(parameter.value, 2.5);
    });
    group('inputSmallImage', () {
      test('change data', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputSmallImage') as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.smallImage = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputSmallImage') as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.jpeg';
        configuration.smallImageAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputSmallImage') as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.jpeg');
        configuration.smallImageFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
