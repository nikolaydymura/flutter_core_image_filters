import 'dart:io';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/src/buffer_matcher.dart';
import 'package:image/image.dart' as img;

Future<void> expectFilteredSuccessfully(
  CIFilterConfiguration configuration,
  InputSource texture,
  String goldenKey,
) async {
  final image =
      await configuration.export(texture, format: ImageExportFormat.jpeg);
  final bytes = await image.toByteData();

  expect(bytes, isNotNull);

  final persistedImage = img.Image.fromBytes(
    image.width,
    image.height,
    bytes!.buffer.asUint8List(),
  );
  img.JpegEncoder encoder = img.JpegEncoder();
  final data = encoder.encodeImage(persistedImage);
  final output = File(
    '../../test/goldens/filters/${configuration.runtimeType}/$goldenKey',
  );

  await expectLater(data, bufferMatchesGoldenFile(output.path));
}
