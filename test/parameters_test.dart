import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'generated.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFilterApi mockFilterApi;
  late PassthroughFilterConfiguration configuration;
  setUp(() async {
    mockFilterApi = MockFilterApi();
    configuration = PassthroughFilterConfiguration(mockFilterApi);
    when(mockFilterApi.create(any)).thenAnswer((_) async => 101);
    await configuration.prepare();
  });
  tearDown(() async {
    verify(mockFilterApi.create('Passthrough')).called(1);
    verifyNoMoreInteractions(mockFilterApi);
  });
  test('NSNumberParameter', () async {
    final parameter = NSNumberParameter('inputValue', 'Value', 0);
    parameter.value = 1;
    await parameter.update(configuration);
    verify(mockFilterApi.setNSNumberParameter(101, 'inputValue', 1.0));
  });
  test('SliderNSNumberParameter', () async {
    final parameter = SliderNSNumberParameter('inputValue', 'Value', 0);
    parameter.value = 1;
    await parameter.update(configuration);
    verify(mockFilterApi.setNSNumberParameter(101, 'inputValue', 1.0));
  });
  test('CGRectParameter', () async {
    final parameter = CGRectParameter('inputValue', 'Value', Rect.zero);
    parameter.value = const Rect.fromLTWH(0, 0, 200, 100);
    await parameter.update(configuration);
    verify(
      mockFilterApi
          .setCIVectorParameter(101, 'inputValue', [0.0, 0.0, 200.0, 100.0]),
    );
  });
  test('CIColorParameter', () async {
    final parameter = CIColorParameter('inputValue', 'Value', Colors.black);
    parameter.value = Colors.orange;
    await parameter.update(configuration);
    verify(
      mockFilterApi.setCIColorParameter(
        101,
        'inputValue',
        [1.0, 0.596078431372549, 0.0, 1.0],
      ),
    );
  });
  group('NSDataParameter', () {
    test('from asset', () async {
      final parameter = NSDataParameter('inputValue', 'Value');
      parameter.asset = 'demo.jpeg';
      await parameter.update(configuration);
      verify(
        mockFilterApi.setNSDataSourceParameter(
          101,
          'inputValue',
          true,
          'demo.jpeg',
        ),
      );
    });
    test('from file', () async {
      final parameter = NSDataParameter('inputValue', 'Value');
      final file = File('demo.jpeg');
      parameter.file = file;
      await parameter.update(configuration);
      verify(
        mockFilterApi.setNSDataSourceParameter(
          101,
          'inputValue',
          false,
          file.absolute.path,
        ),
      );
    });
    test('from data', () async {
      final parameter = NSDataParameter('inputValue', 'Value');
      final data = Uint8List(0);
      parameter.data = data;
      await parameter.update(configuration);
      verify(mockFilterApi.setNSDataParameter(101, 'inputValue', data));
    });
  });
  group('CIImageParameter', () {
    test('from asset', () async {
      final parameter = CIImageParameter('inputValue', 'Value');
      parameter.asset = 'demo.jpeg';
      await parameter.update(configuration);
      verify(
        mockFilterApi.setCIImageSourceParameter(
          101,
          'inputValue',
          true,
          'demo.jpeg',
        ),
      );
    });
    test('from file', () async {
      final parameter = CIImageParameter('inputValue', 'Value');
      final file = File('demo.jpeg');
      parameter.file = file;
      await parameter.update(configuration);
      verify(
        mockFilterApi.setCIImageSourceParameter(
          101,
          'inputValue',
          false,
          file.absolute.path,
        ),
      );
    });
    test('from data', () async {
      final parameter = CIImageParameter('inputValue', 'Value');
      final data = Uint8List(0);
      parameter.data = data;
      await parameter.update(configuration);
      verify(mockFilterApi.setCIImageDataParameter(101, 'inputValue', data));
    });
  });
  test('NSBoolParameter', () async {
    final parameter = NSBoolParameter('inputValue', 'Value', false);
    parameter.value = true;
    await parameter.update(configuration);
    verify(
      mockFilterApi.setNSNumberParameter(101, 'inputValue', 1),
    );
  });
  test('NSStringParameter', () async {
    final parameter = NSStringParameter('inputValue', 'Value', '');
    parameter.value = 'hello';
    await parameter.update(configuration);
  });
}
