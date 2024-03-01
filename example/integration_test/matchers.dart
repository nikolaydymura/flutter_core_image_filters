import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_core_image_filters/flutter_core_image_filters.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

final _diffRegex =
    RegExp(r'Pixel test failed, ([0-9]+\.[0-9]+)% diff detected');

Future<void> expectFilteredSuccessfully(
  CIFilterConfiguration configuration,
  InputSource texture,
  String goldenKey, {
  CIContext context = CIContext.system,
  double diffTolerance = 0.0,
}) async {
  final crop =
      configuration.hasInputImage ? null : const Rect.fromLTWH(0, 0, 300, 300);
  final image = await configuration.export(
    texture,
    format: ImageExportFormat.jpeg,
    context: context,
    crop: crop,
  );
  final bytes = await image.toByteData();

  expect(bytes, isNotNull);

  final persistedImage = img.Image.fromBytes(
    width: image.width,
    height: image.height,
    bytes: bytes!.buffer,
    numChannels: 4,
  );
  img.JpegEncoder encoder = img.JpegEncoder();
  final data = encoder.encode(persistedImage);
  final output = File(
    'goldens/filters/${configuration.name}/${context.name}-$goldenKey',
  );

  try {
    await expectLater(data, matchesGoldenFile(output.path));
  } on FlutterError catch (e) {
    final percents = _diffRegex.firstMatch('$e')?.group(1);
    if (percents == null) {
      rethrow;
    }
    final value = double.tryParse(percents);
    if (value == null || value > diffTolerance) {
      rethrow;
    }
    debugPrint(e.message);
  }
}

Future<void> expectImageDataFilteredSuccessfully(
  CIFilterConfiguration configuration,
  InputSource texture,
  String goldenKey, {
  CIContext context = CIContext.system,
  double diffTolerance = 0.0,
}) async {
  final crop =
      configuration.hasInputImage ? null : const Rect.fromLTWH(0, 0, 300, 300);
  final data = await configuration.exportData(
    texture,
    format: ImageExportFormat.jpeg,
    context: context,
    crop: crop,
  );

  final output = File(
    'goldens/filters/${configuration.name}/${context.name}-$goldenKey',
  );

  try {
    await expectLater(data, matchesGoldenFile(output.path));
  } on FlutterError catch (e) {
    final percents = _diffRegex.firstMatch('$e')?.group(1);
    if (percents == null) {
      rethrow;
    }
    final value = double.tryParse(percents);
    if (value == null || value > diffTolerance) {
      rethrow;
    }
    debugPrint(e.message);
  }
}

Future<void> expectImageFileFilteredSuccessfully(
  CIFilterConfiguration configuration,
  InputSource source,
  String goldenKey, {
  CIContext context = CIContext.system,
  double diffTolerance = 0.0,
}) async {
  final temp = await getTemporaryDirectory();
  final output = File('${temp.path}/${context.name}-$goldenKey');
  final crop =
      configuration.hasInputImage ? null : const Rect.fromLTWH(0, 0, 300, 300);

  await configuration.exportImageFile(
    ImageExportConfig(
      source,
      output,
      format: ImageExportFormat.jpeg,
    ),
    crop: crop,
    context: context,
  );

  final data = await output.readAsBytes();
  final golden = File(
    'goldens/filters/${configuration.name}/${context.name}-$goldenKey',
  );

  try {
    await expectLater(data, matchesGoldenFile(golden.path));
  } on FlutterError catch (e) {
    final percents = _diffRegex.firstMatch('$e')?.group(1);
    if (percents == null) {
      rethrow;
    }
    final value = double.tryParse(percents);
    if (value == null || value > diffTolerance) {
      rethrow;
    }
    debugPrint(e.message);
  }
}
