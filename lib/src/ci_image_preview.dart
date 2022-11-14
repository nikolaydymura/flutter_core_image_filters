import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'configurations/ci_filter_configuration.dart';

class CIImagePreview extends StatelessWidget {
  final CIImagePreviewController controller;

  const CIImagePreview({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Texture(textureId: controller.textureId);
  }
}

class CIImagePreviewController {
  final int textureId;

  CIImagePreviewController._(this.textureId);

  Future<void> setImageAsset(String asset) async {
    await CIFilterConfiguration.api.setImagePreviewAsset(textureId, asset);
  }

  Future<void> setImageFile(File file) async {
    await CIFilterConfiguration.api.setImagePreviewFile(textureId, file);
  }

  Future<void> setImageData(Uint8List data) async {
    await CIFilterConfiguration.api.setImagePreviewData(textureId, data);
  }

  static Future<CIImagePreviewController> initialize() async {
    final textureId = await CIFilterConfiguration.api.createImagePreview();
    return CIImagePreviewController._(textureId);
  }

  static Future<CIImagePreviewController> fromFile(File file) async {
    final controller = await initialize();
    await controller.setImageFile(file);
    return controller;
  }

  static Future<CIImagePreviewController> fromAsset(String asset) async {
    final controller = await initialize();
    await controller.setImageAsset(asset);
    return controller;
  }

  static Future<CIImagePreviewController> fromMemory(Uint8List data) async {
    final controller = await initialize();
    await controller.setImageData(data);
    return controller;
  }

  Future<void> update(CIFilterConfiguration configuration) async {
    await CIFilterConfiguration.api.setImagePreviewConfiguration(textureId, 0);
  }
}
