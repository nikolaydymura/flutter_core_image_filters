part of flutter_core_image_filters;

class CIVideoPreview extends StatelessWidget {
  final CIVideoPreviewController controller;

  const CIVideoPreview({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Texture(textureId: controller._textureId);
  }
}

class CIVideoPreviewController {
  static final CoreImagePreviewsPlatform _api =
      CoreImagePreviewsPlatform.instance;
  final int _textureId;

  CIVideoPreviewController._(this._textureId);

  Future<void> setImageAsset(String asset) async {
    await _api.setPreviewAsset(_textureId, asset, video: true);
  }

  Future<void> setImageFile(File file) async {
    await _api.setPreviewFile(_textureId, file, video: true);
  }

  Future<void> setImageData(Uint8List data) async {
    await _api.setPreviewData(_textureId, data, video: true);
  }

  static Future<CIVideoPreviewController> initialize() async {
    final textureId = await _api.createPreview(video: true);
    return CIVideoPreviewController._(textureId);
  }

  static Future<CIVideoPreviewController> fromFile(File file) async {
    final controller = await initialize();
    await controller.setImageFile(file);
    return controller;
  }

  static Future<CIVideoPreviewController> fromAsset(String asset) async {
    final controller = await initialize();
    await controller.setImageAsset(asset);
    return controller;
  }

  static Future<CIVideoPreviewController> fromMemory(Uint8List data) async {
    final controller = await initialize();
    await controller.setImageData(data);
    return controller;
  }

  Future<void> connect(CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      await configuration.prepare();
    }
    await _api.setPreviewConfiguration(
      _textureId,
      configuration._filterId,
      video: true,
    );
  }

  Future<void> disconnect(
    CIFilterConfiguration configuration, {
    bool disposeConfiguration = false,
  }) async {
    if (disposeConfiguration && configuration.ready) {
      await configuration.dispose();
    }
    await _api.setPreviewConfiguration(_textureId, -1, video: true);
  }

  Future<void> dispose() async {
    await _api.destroyPreview(_textureId, video: true);
  }

  Future<void> play() async {
    await _api.resumePreview(_textureId, video: true);
  }

  Future<void> pause() async {
    await _api.pausePreview(_textureId, video: true);
  }
}
