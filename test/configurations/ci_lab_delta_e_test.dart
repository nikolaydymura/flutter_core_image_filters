import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers.dart';

void main() {
  late CILabDeltaEConfiguration configuration;
  setUp(() {
    configuration = CILabDeltaEConfiguration();
  });
  group('CILabDeltaE', () {
    test('verify name', () {
      expect(configuration.name, 'CILabDeltaE');
    });
    testInputKeys(build: () => configuration);
  });
  group('inputImage2', () {
    test('change data', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputImage2')
      as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final data = Uint8List(0);
      configuration.image2 = data;
      expect(parameter.data, data);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
    });
    test('change asset', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputImage2')
      as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      const asset = 'demo.jpeg';
      configuration.image2Asset = asset;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, asset);
    });
    test('change file', () {
      final parameter = configuration.parameters
          .firstWhere((e) => e.name == 'inputImage2')
      as CIImageParameter;
      expect(parameter.data, isNull);
      expect(parameter.file, isNull);
      expect(parameter.asset, isNull);
      final file = File('demo.jpeg');
      configuration.image2File = file;
      expect(parameter.data, isNull);
      expect(parameter.file, file);
      expect(parameter.asset, isNull);
    });
  });
}
