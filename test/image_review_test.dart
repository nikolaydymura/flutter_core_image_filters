import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'generated.mocks.dart';

void main() {
  late CIImagePreviewController controller;
  late MockImagePreviewApi mockPreviewApi;
  late MockFilterApi mockFilterApi;
  setUp(() async {
    mockFilterApi = MockFilterApi();
    mockPreviewApi = MockImagePreviewApi();
    when(mockFilterApi.create(any)).thenAnswer((_) async => 202);
    when(mockPreviewApi.create()).thenAnswer((_) async => 101);
    controller =
        await CIImagePreviewController.initialize(previewApi: mockPreviewApi);
  });
  tearDown(() {
    verify(mockPreviewApi.create()).called(1);
    verifyNoMoreInteractions(mockPreviewApi);
    verifyNoMoreInteractions(mockFilterApi);
  });
  group('CIImagePreview', () {
    test('setImageSource with data', () async {
      await controller.setImageSource(DataInputSource(Uint8List(0)));
      verify(mockPreviewApi.setData(any)).called(1);
    });
    test('setImageSource with asset', () async {
      await controller.setImageSource(AssetInputSource('image.jpeg'));
      verify(mockPreviewApi.setSource(any)).called(1);
    });
    test('setImageSource with file', () async {
      await controller.setImageSource(FileInputSource(File('image.jpeg')));
      verify(mockPreviewApi.setSource(any)).called(1);
    });
    test('no image source', () async {
      await controller
          .setOutputSurface(const Rect.fromLTWH(0.0, 0.0, 640.0, 480.0));
      verify(mockPreviewApi.setOutput(any, [0.0, 0.0, 640.0, 480.0])).called(1);
    });
    test('dispose', () async {
      await controller.dispose();
      verify(mockPreviewApi.dispose(101)).called(1);
    });
    test('disconnect', () async {
      await controller.disconnect();
      verify(mockPreviewApi.disconnect(101)).called(1);
    });
    test('connect when configuration not ready', () async {
      expect(
        () => controller.connect(PassthroughFilterConfiguration(mockFilterApi)),
        throwsA(isA<String>()),
      );
    });
    test('connect when configuration is ready', () async {
      final configuration = PassthroughFilterConfiguration(mockFilterApi);
      await configuration.prepare();
      await controller.connect(configuration);
      verify(mockPreviewApi.connect(101, 202, 'system')).called(1);
      verify(mockFilterApi.create('Passthrough')).called(1);
    });
    testWidgets('CIImagePreview', (widgetTester) async {
      await widgetTester.pumpWidget(CIImagePreview(controller: controller));
      final textureFinder = find.byType(Texture);
      expect(textureFinder, findsOneWidget);
    });
  });
}
