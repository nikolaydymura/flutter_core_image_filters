import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorCubeConfiguration configuration;
  setUp(() {
    configuration = CIColorCubeConfiguration();
  });
  group('CIColorCube', () {
    test('change inputCubeDimension', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCubeDimension') as NumberParameter;
      expect(parameter.value, 2);
      configuration.cubeDimension = 64;
      expect(parameter.value, 64);
    });
    test('change inputExtrapolate', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputExtrapolate') as BoolParameter;
      expect(parameter.value, false);
      configuration.extrapolate = true;
      expect(parameter.value, true);
    });
    group('inputCubeData', () {
      test('change data', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCubeData') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.cubeData = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCubeData') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.png';
        configuration.cubeDataAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCubeData') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.png');
        configuration.cubeDataFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
  });
}
