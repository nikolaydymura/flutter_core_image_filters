import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../generated.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFilterApi mockFilterApi;
  late PassthroughFilterConfiguration configuration;
  setUp(() {
    mockFilterApi = MockFilterApi();
    configuration = PassthroughFilterConfiguration(mockFilterApi);
    when(mockFilterApi.create(any)).thenAnswer((_) async => 101);
  });
  tearDown(() {
    verifyNoMoreInteractions(mockFilterApi);
  });
  group('CIFilter', () {
    test('prepare', () async {
      expect(configuration.ready, false);
      await configuration.prepare();
      expect(configuration.ready, true);
      verify(mockFilterApi.create('Passthrough')).called(1);
    });
    test('dispose', () async {
      expect(configuration.ready, false);
      await configuration.prepare();
      expect(configuration.ready, true);
      await configuration.dispose();
      expect(configuration.ready, false);
      verify(mockFilterApi.create('Passthrough')).called(1);
      verify(mockFilterApi.dispose(101)).called(1);
    });
    test('dispose when not ready', () async {
      expect(configuration.ready, false);
      await configuration.dispose();
      expect(configuration.ready, false);
    });
    group('exportData', () {
      setUp(() async {
        await configuration.prepare();
        when(mockFilterApi.exportData(101, 'jpeg')).thenAnswer(
          (_) async => File('example/images/demo.jpeg').readAsBytesSync(),
        );
        when(mockFilterApi.exportData(101, 'png')).thenAnswer(
          (_) async => File('example/images/demo.jpeg').readAsBytesSync(),
        );
      });
      tearDown(() async {
        await configuration.dispose();
        verify(mockFilterApi.create('Passthrough')).called(1);
        verify(mockFilterApi.dispose(101)).called(1);
      });
      test('export from asset', () async {
        const asset = 'demo.jpeg';
        final image = await configuration.export(AssetInputSource(asset));
        expect(image.width, 1800);
        expect(image.height, 1075);
        verify(mockFilterApi.setInputAsset(101, asset));
        verify(mockFilterApi.exportData(101, 'jpeg')).called(1);
      });
      test('export from data', () async {
        final data = Uint8List.fromList([]);
        final image = await configuration.export(DataInputSource(data));
        expect(image.width, 1800);
        expect(image.height, 1075);
        verify(mockFilterApi.setInputData(101, data));
        verify(mockFilterApi.exportData(101, 'png')).called(1);
      });
      test('export from file', () async {
        final file = File('demo.jpeg');
        final image = await configuration.export(FileInputSource(file));
        expect(image.width, 1800);
        expect(image.height, 1075);
        verify(mockFilterApi.setInputFile(101, file.absolute.path));
        verify(mockFilterApi.exportData(101, 'jpeg')).called(1);
      });
    });
    group('exportImageFile', () {
      setUp(() async {
        await configuration.prepare();
        when(mockFilterApi.exportImageFile(101, any, 'jpeg'))
            .thenAnswer((_) async {});
        when(mockFilterApi.exportImageFile(101, any, 'png'))
            .thenAnswer((_) async {});
      });
      tearDown(() async {
        await configuration.dispose();
        verify(mockFilterApi.create('Passthrough')).called(1);
        verify(mockFilterApi.dispose(101)).called(1);
      });
      test('export from asset', () async {
        const asset = 'demo.jpeg';
        final output = File(asset);
        final config = ImageExportConfig(AssetInputSource(asset), output);
        await configuration.exportImageFile(config);
        verify(mockFilterApi.setInputAsset(101, asset));
        verify(mockFilterApi.exportImageFile(101, output.absolute.path, 'jpeg'))
            .called(1);
      });
      test('export from data', () async {
        final data = Uint8List.fromList([]);
        final output = File('demo.png');
        final config = ImageExportConfig(DataInputSource(data), output);
        await configuration.exportImageFile(config);
        verify(mockFilterApi.setInputData(101, data));
        verify(mockFilterApi.exportImageFile(101, output.absolute.path, 'png'))
            .called(1);
      });
      test('export from file', () async {
        final file = File('demo.jpeg');
        final config = ImageExportConfig(FileInputSource(file), file);
        await configuration.exportImageFile(config);
        verify(mockFilterApi.setInputFile(101, file.absolute.path));
        verify(mockFilterApi.exportImageFile(101, file.absolute.path, 'jpeg'))
            .called(1);
      });
    });
    group('exportVideoFile', () {
      setUp(() async {
        await configuration.prepare();
        when(mockFilterApi.exportImageFile(101, any, 'mov'))
            .thenAnswer((_) async {});
        when(mockFilterApi.exportImageFile(101, any, 'mp4'))
            .thenAnswer((_) async {});
      });
      tearDown(() async {
        await configuration.dispose();
        verify(mockFilterApi.create('Passthrough')).called(1);
        verify(mockFilterApi.dispose(101)).called(1);
      });
      test('export from asset', () async {
        const asset = 'demo.mov';
        final output = File(asset);
        final config = VideoExportConfig(AssetInputSource(asset), output);
        await configuration.exportVideoFile(config);
        verify(
          mockFilterApi.exportVideoFile(
            101,
            true,
            'demo.mov',
            output.absolute.path,
            'mov',
          ),
        ).called(1);
      });
      test('export from file', () async {
        final file = File('demo.mp4');
        final config = VideoExportConfig(FileInputSource(file), file);
        await configuration.exportVideoFile(config);
        verify(
          mockFilterApi.exportVideoFile(
            101,
            false,
            file.absolute.path,
            file.absolute.path,
            'mp4',
          ),
        ).called(1);
      });
    });
  });
}
