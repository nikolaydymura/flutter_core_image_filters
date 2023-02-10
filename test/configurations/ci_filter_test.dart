import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
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
        when(mockFilterApi.exportData(101, 'jpeg', 'system', null)).thenAnswer(
          (_) async => File('example/images/demo.jpeg').readAsBytesSync(),
        );
        when(mockFilterApi.exportData(101, 'png', 'system', null)).thenAnswer(
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
        verify(mockFilterApi.exportData(101, 'jpeg', 'system', null)).called(1);
      });
      test('export from data', () async {
        final data = Uint8List.fromList([]);
        final image = await configuration.export(DataInputSource(data));
        expect(image.width, 1800);
        expect(image.height, 1075);
        verify(mockFilterApi.setInputData(101, data));
        verify(mockFilterApi.exportData(101, 'png', 'system', null)).called(1);
      });
      test('export from file', () async {
        final file = File('demo.jpeg');
        final image = await configuration.export(FileInputSource(file));
        expect(image.width, 1800);
        expect(image.height, 1075);
        verify(mockFilterApi.setInputFile(101, file.absolute.path));
        verify(mockFilterApi.exportData(101, 'jpeg', 'system', null)).called(1);
      });
    });
    group('exportImageFile', () {
      setUp(() async {
        await configuration.prepare();
        when(mockFilterApi.exportImageFile(101, any, 'jpeg', 'system', null))
            .thenAnswer((_) async {});
        when(mockFilterApi.exportImageFile(101, any, 'png', 'system', null))
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
        verify(
          mockFilterApi.exportImageFile(
            101,
            output.absolute.path,
            'jpeg',
            'system',
            null,
          ),
        ).called(1);
      });
      test('export from data', () async {
        final data = Uint8List.fromList([]);
        final output = File('demo.png');
        final config = ImageExportConfig(DataInputSource(data), output);
        await configuration.exportImageFile(config);
        verify(mockFilterApi.setInputData(101, data));
        verify(
          mockFilterApi.exportImageFile(
            101,
            output.absolute.path,
            'png',
            'system',
            null,
          ),
        ).called(1);
      });
      test('export from file', () async {
        final file = File('demo.jpeg');
        final config = ImageExportConfig(FileInputSource(file), file);
        await configuration.exportImageFile(config);
        verify(mockFilterApi.setInputFile(101, file.absolute.path));
        verify(
          mockFilterApi.exportImageFile(
            101,
            file.absolute.path,
            'jpeg',
            'system',
            null,
          ),
        ).called(1);
      });
    });
    group('exportVideoFile', () {
      setUp(() async {
        await configuration.prepare();
        when(
          mockFilterApi.exportVideoFile(
            101,
            true,
            any,
            any,
            'mov',
            'system',
            'AVAssetExportPresetHighestQuality',
            1000,
          ),
        ).thenAnswer((_) async => 201);
        when(
          mockFilterApi.exportVideoFile(
            101,
            false,
            any,
            any,
            'mp4',
            'system',
            any,
            1000,
          ),
        ).thenAnswer((_) async => 201);
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
        configuration.exportVideoFile(config).listen((event) {});
        await Future.delayed(const Duration(milliseconds: 100));
        verify(
          mockFilterApi.exportVideoFile(
            101,
            true,
            'demo.mov',
            output.absolute.path,
            'mov',
            'system',
            'AVAssetExportPresetHighestQuality',
            1000,
          ),
        ).called(1);
      });
      for (final preset in AVAssetExportPreset.values) {
        test('export video file from file', () async {
          final fileIn = File('demo.mp4');
          final fileOut = File('output.mp4');
          final config = CIVideoExportConfig(
            FileInputSource(fileIn),
            fileOut,
            preset: preset,
          );
          configuration.exportVideoFile(config).listen((event) {});
          await Future.delayed(const Duration(milliseconds: 100));
          verify(
            mockFilterApi.exportVideoFile(
              101,
              false,
              fileIn.absolute.path,
              fileOut.absolute.path,
              'mp4',
              'system',
              preset.platformKey,
              1000,
            ),
          ).called(1);
        });
      }
    });
  });
}
