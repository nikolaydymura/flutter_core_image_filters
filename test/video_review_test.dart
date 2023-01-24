import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'generated.mocks.dart';

void main() {
  late CIVideoPreviewController controller;
  late MockVideoPreviewApi mockPreviewApi;
  late MockFilterApi mockFilterApi;
  setUp(() async {
    mockFilterApi = MockFilterApi();
    mockPreviewApi = MockVideoPreviewApi();
    when(mockFilterApi.create(any)).thenAnswer((_) async => 202);
    when(mockPreviewApi.create()).thenAnswer((_) async => 101);
    controller =
    await CIVideoPreviewController.initialize(previewApi: mockPreviewApi);
  });
  tearDown(() {
    verify(mockPreviewApi.create()).called(1);
    verifyNoMoreInteractions(mockPreviewApi);
    verifyNoMoreInteractions(mockFilterApi);
  });
  group('CIVideoPreview', () {
    test('setImageSource with asset', () async {
      await controller.setVideoSource(AssetInputSource('video.mp4'));
      verify(mockPreviewApi.setSource(any)).called(1);
    });
    test('setImageSource with file', () async {
      await controller.setVideoSource(FileInputSource(File('video.mp4')));
      verify(mockPreviewApi.setSource(any)).called(1);
    });
    test('dispose', () async {
      await controller.dispose();
      verify(mockPreviewApi.dispose(101)).called(1);
    });
    test('disconnect', () async {
      await controller.disconnect();
      verify(mockPreviewApi.disconnect(101)).called(1);
    });
    test('play', () async {
      await controller.play();
      verify(mockPreviewApi.resume(101)).called(1);
    });
    test('pause', () async {
      await controller.pause();
      verify(mockPreviewApi.pause(101)).called(1);
    });
    test('connect when configuration not ready', () async {
      expect(
            () =>
            controller.connect(PassthroughFilterConfiguration(mockFilterApi)),
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
    testWidgets('CIVideoPreview', (widgetTester) async {
      await widgetTester.pumpWidget(CIVideoPreview(controller: controller));
      final textureFinder = find.byType(Texture);
      expect(textureFinder, findsOneWidget);
    });
  });
}
