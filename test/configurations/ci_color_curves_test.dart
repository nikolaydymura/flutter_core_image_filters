import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CIColorCurvesConfiguration configuration;
  setUp(() {
    configuration = CIColorCurvesConfiguration();
  });
  group('CIColorCurves', () {
    test('verify name', () {
      expect(configuration.name, 'CIColorCurves');
    });
    group('inputCurvesData', () {
      test('change data', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCurvesData') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final data = Uint8List(0);
        configuration.curvesData = data;
        expect(parameter.data, data);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
      });
      test('change asset', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCurvesData') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        const asset = 'demo.png';
        configuration.curvesDataAsset = asset;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, asset);
      });
      test('change file', () {
        final parameter = configuration.parameters
            .firstWhere((e) => e.name == 'inputCurvesData') as DataParameter;
        expect(parameter.data, isNull);
        expect(parameter.file, isNull);
        expect(parameter.asset, isNull);
        final file = File('demo.png');
        configuration.curvesDataFile = file;
        expect(parameter.data, isNull);
        expect(parameter.file, file);
        expect(parameter.asset, isNull);
      });
    });
    test('change inputCurvesDomain', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputCurvesDomain') as VectorParameter;
      expect(parameter.value, [0.0, 1.0]);
      configuration.curvesDomain = [0.5, 0.9];
      expect(parameter.value, [0.5, 0.9]);
    });
  });
}
