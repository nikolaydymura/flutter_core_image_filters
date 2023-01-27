import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIGuidedFilterConfiguration configuration;
  setUp(() {
    configuration = CIGuidedFilterConfiguration();
  });
  group('CIGuidedFilter', () {
    test('verify name', () {
      expect(configuration.name, 'CIGuidedFilter');
    });

    test('change inputEpsilon', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputEpsilon') as NumberParameter;
      expect(parameter.value, 0.0001);
      configuration.epsilon = 0.0;
      expect(parameter.value, 0.0);
    });
    test('change inputRadius', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputRadius') as NumberParameter;
      expect(parameter.value, 1);
      configuration.radius = 4;
      expect(parameter.value, 4);
    });
    group('inputGuideImage', () {
      test('change data', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputGuideImage') as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.guideImage = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputGuideImage') as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.jpeg';
        configuration.guideImageAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputGuideImage') as CIImageParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.jpeg');
        configuration.guideImageFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
