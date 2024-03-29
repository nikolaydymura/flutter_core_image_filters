import 'package:flutter/material.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'matchers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final source = AssetInputSource('images/demo.jpeg');

  final configuration = CIColorMonochromeConfiguration();

  setUpAll(() async {
    await configuration.prepare();
  });

  tearDownAll(() async {
    await configuration.dispose();
  });

  group('CIMonochromeConfiguration', () {
    test('monochrome default', () async {
      await expectFilteredSuccessfully(
        configuration,
        source,
        'monochrome_default.jpeg',
      );
    });
    test('monochrome 0.1', () async {
      configuration.intensity = 0.1;
      await configuration.update();

      await expectFilteredSuccessfully(
        configuration,
        source,
        'monochrome_0.1.jpeg',
      );
    });
    test('monochrome 0.5', () async {
      configuration.intensity = 0.5;
      configuration.color = Color.fromRGBO(
        (0.4 * 255).toInt(),
        (0.2 * 255).toInt(),
        (0.1 * 255).toInt(),
        1.0,
      );
      await configuration.update();

      await expectFilteredSuccessfully(
        configuration,
        source,
        'monochrome_0.5.jpeg',
      );
    });
    test('monochrome 0.9', () async {
      configuration.intensity = 0.9;
      configuration.color = Color.fromRGBO(
        (0.3 * 255).toInt(),
        (0.1 * 255).toInt(),
        (0.05 * 255).toInt(),
        1.0,
      );
      await configuration.update();

      await expectFilteredSuccessfully(
        configuration,
        source,
        'monochrome_0.9.jpeg',
      );
    });
  });
}
