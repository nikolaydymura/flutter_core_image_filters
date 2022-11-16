part of flutter_core_image_filters;

class CIImagePreview extends StatelessWidget {
  final CIImagePreviewController controller;

  const CIImagePreview({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Texture(textureId: controller._textureId);
  }
}

class CIImagePreviewController {
  static final CoreImagePreviewsPlatform _api =
      CoreImagePreviewsPlatform.instance;
  final int _textureId;

  CIImagePreviewController._(this._textureId);

  Future<void> setImageAsset(String asset) async {
    await _api.setImagePreviewAsset(_textureId, asset);
  }

  Future<void> setImageFile(File file) async {
    await _api.setImagePreviewFile(_textureId, file);
  }

  Future<void> setImageData(Uint8List data) async {
    await _api.setImagePreviewData(_textureId, data);
  }

  static Future<CIImagePreviewController> initialize() async {
    final textureId = await _api.createImagePreview();
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

  Future<void> connect(CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      await configuration.prepare();
    }
    await _api.setImagePreviewConfiguration(
      _textureId,
      configuration._filterId,
    );
  }

  Future<void> disconnect(
    CIFilterConfiguration configuration, {
    bool disposeConfiguration = false,
  }) async {
    if (disposeConfiguration && configuration.ready) {
      await configuration.dispose();
    }
    await _api.setImagePreviewConfiguration(_textureId, -1);
  }
}
