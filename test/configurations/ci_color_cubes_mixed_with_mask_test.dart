import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorCubesMixedWithMaskConfiguration configuration;
  setUp(() {
    configuration = CIColorCubesMixedWithMaskConfiguration();
  });
  group('CIColorCubesMixedWithMask', () {
    test('change inputCubeDimension', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCubeDimension') as NumberParameter;
      expect(parameter.value, 2);
      configuration.cubeDimension = 64;
      expect(parameter.value, 64);
    });
    test('change inputColorSpace', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputColorSpace') as StringParameter;
      expect(parameter.value, '');
      configuration.colorSpace = 'sRGB';
      expect(parameter.value, 'sRGB');
    });
    test('change inputExtrapolate', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtrapolate') as BoolParameter;
      expect(parameter.value, false);
      configuration.extrapolate = true;
      expect(parameter.value, true);
    });
    group('inputCube0Data', () {
      test('change data', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCube0Data') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.cubeData0 = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCube0Data') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.png';
        configuration.cubeData0Asset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCube0Data') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.png');
        configuration.cubeData0File = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
    group('inputCube1Data', () {
      test('change data', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCube1Data') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.cubeData1 = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCube1Data') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.png';
        configuration.cubeData1Asset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCube1Data') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.png');
        configuration.cubeData1File = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
