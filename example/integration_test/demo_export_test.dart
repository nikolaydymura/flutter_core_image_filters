import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final inputSource = AssetInputSource('images/demo.jpeg');
  late final Directory tmpDirectory;
  setUpAll(() async {
    tmpDirectory = await getTemporaryDirectory();
  });

  test('export all', skip: true, () async {
    for (final name in FlutterCoreImageFilters.availableFilters) {
      if (!name.startsWith('Photo Effect')) {
        continue;
      }
      final configuration =
          FlutterCoreImageFilters.createFilter(displayName: name);
      if (configuration == null) {
        continue;
      }
      try {
        await configuration.prepare();
        final watch = Stopwatch();
        watch.start();
        final image = await configuration.export(inputSource);
        final bytes = await image.toByteData();
        debugPrint(
          'Exporting image took ${watch.elapsedMilliseconds} milliseconds',
        );
        if (bytes == null) {
          continue;
        }
        final output = File('${tmpDirectory.path}/$name.jpeg');
        final persistedImage = img.Image.fromBytes(
          image.width,
          image.height,
          bytes.buffer.asUint8List(),
        );
        img.JpegEncoder encoder = img.JpegEncoder();
        final data = encoder.encodeImage(persistedImage);
        await output.writeAsBytes(data);
        debugPrint(
          'Exporting file took ${watch.elapsedMilliseconds} milliseconds',
        );
        debugPrint('Exported: ${output.absolute}');
        await output.copy(
            '/Users/nd/IdeaProjects/home/flutter_gpu_filters/image_filters_example/gpu_flutter_dependencies/flutter_core_image_filters/demos/$name.jpeg');
      } finally {
        await configuration.dispose();
      }
    }
  });
  test('export video', skip: true, () async {
    final configuration = CIPhotoEffectNoirConfiguration();
    try {
      await configuration.prepare();
      final watch = Stopwatch();
      watch.start();
      final output = File('${tmpDirectory.path}/${configuration.name}.mp4');
      final config =
          VideoExportConfig(AssetInputSource('videos/demo.mp4'), output);
      await configuration.exportVideoFile(config);
      debugPrint(
        'Exporting file took ${watch.elapsedMilliseconds} milliseconds',
      );
      debugPrint('Exported: ${output.absolute}');
      await output.copy(
          '/Users/nd/IdeaProjects/home/flutter_gpu_filters/image_filters_example/gpu_flutter_dependencies/flutter_core_image_filters/demos/${configuration.name}.mp4');
    } finally {
      await configuration.dispose();
    }
  });
}
