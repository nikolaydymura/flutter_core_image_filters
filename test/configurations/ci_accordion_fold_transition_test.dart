import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIAccordionFoldTransitionConfiguration configuration;
  setUp(() {
    configuration = CIAccordionFoldTransitionConfiguration();
  });
  group('CIAccordionFoldTransition', () {
    test('verify name', () {
      expect(configuration.name, 'CIAccordionFoldTransition');
    });
    testInputKeys(build: () => configuration);
    test('change inputTime', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTime') as NumberParameter;
      expect(parameter.value, 0.0);
      configuration.time = 0.5;
      expect(parameter.value, 0.5);
    });

    test('change inputNumberOfFolds', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputNumberOfFolds') as NumberParameter;
      expect(parameter.value, 3);
      configuration.numberOfFolds = 5;
      expect(parameter.value, 5);
    });
    test('change inputBottomHeight', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputBottomHeight') as NumberParameter;
      expect(parameter.value, 0);
      configuration.bottomHeight = 0.4;
      expect(parameter.value, 0.4);
    });
    test('change inputFoldShadowAmount', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputFoldShadowAmount')
          as NumberParameter;
      expect(parameter.value, 0.1);
      configuration.foldShadowAmount = 0.5;
      expect(parameter.value, 0.5);
    });
  });
  group('inputTargetImage', () {
    test('change data', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTargetImage') as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final data = Uint8List(0);
      configuration.targetImage = data;
      expect(parameter.data, data);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
    });
    test('change asset', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTargetImage') as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      const asset = 'demo.jpeg';
      configuration.targetImageAsset = asset;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, asset);
    });
    test('change file', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputTargetImage') as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final file = File('demo.jpeg');
      configuration.targetImageFile = file;
      expect(parameter.data, isNull);
      expect(parameter.file, file);
      expect(parameter.asset, isNull);
    });
  });
}
