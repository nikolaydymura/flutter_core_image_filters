import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'matchers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final source = AssetInputSource('images/demo.jpeg');

  final configuration = CIColorCubeConfiguration();

  setUpAll(() async {
    await configuration.prepare();
  });

  tearDownAll(() async {
    await configuration.dispose();
  });

  group('CIColorCubeConfiguration', () {
    test('no extrapolate', () async {
      configuration.extrapolate = false;
      configuration.cubeDimension = 64;
      configuration.cubeDataAsset = 'images/lookup_amatorka.png';
      await configuration.update();

      await expectFilteredSuccessfully(
        configuration,
        source,
        'no-extrapolate.jpeg',
      );
    });
    test('extrapolate', () async {
      configuration.extrapolate = true;
      configuration.cubeDimension = 64;
      configuration.cubeDataAsset = 'images/lookup_amatorka.png';
      await configuration.update();

      await expectFilteredSuccessfully(
        configuration,
        source,
        'extrapolate.jpeg',
      );
    });
  });
}
