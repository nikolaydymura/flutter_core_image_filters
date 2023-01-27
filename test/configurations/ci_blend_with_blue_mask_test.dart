import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CIBlendWithBlueMaskConfiguration configuration;
  setUp(() {
    configuration = CIBlendWithBlueMaskConfiguration();
  });
  group('CIBlendWithBlueMask', () {
    test('verify name', () {
      expect(configuration.name, 'CIBlendWithBlueMask');
    });
    testInputKeys(build: () => configuration);
  });
  group('inputBackgroundImage', () {
    test('change data', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBackgroundImage')
          as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final data = Uint8List(0);
      configuration.backgroundImage = data;
      expect(parameter.data, data);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
    });
    test('change asset', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBackgroundImage')
          as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      const asset = 'demo.jpeg';
      configuration.backgroundImageAsset = asset;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, asset);
    });
    test('change file', () {
      final parameter = configuration.parameters
              .firstWhere((e) => e.name == 'inputBackgroundImage')
          as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final file = File('demo.jpeg');
      configuration.backgroundImageFile = file;
      expect(parameter.data, isNull);
      expect(parameter.file, file);
      expect(parameter.asset, isNull);
    });
  });
  group('inputMaskImage', () {
    test('change data', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaskImage') as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final data = Uint8List(0);
      configuration.maskImage = data;
      expect(parameter.data, data);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
    });
    test('change asset', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaskImage') as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      const asset = 'demo.jpeg';
      configuration.maskImageAsset = asset;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, asset);
    });
    test('change file', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputMaskImage') as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final file = File('demo.jpeg');
      configuration.maskImageFile = file;
      expect(parameter.data, isNull);
      expect(parameter.file, file);
      expect(parameter.asset, isNull);
    });
  });
}
