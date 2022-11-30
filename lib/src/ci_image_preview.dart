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
  static final ImagePreviewApi _api = ImagePreviewApi();
  final int _textureId;

  CIImagePreviewController._(this._textureId);

  Future<void> setImageAsset(String asset) async {
    await _api.setSource(
      SourcePreviewMessage(textureId: _textureId, path: asset, asset: true),
    );
  }

  Future<void> setImageFile(File file) async {
    await _api.setSource(
      SourcePreviewMessage(
        textureId: _textureId,
        path: file.absolute.path,
        asset: false,
      ),
    );
  }

  Future<void> setImageData(Uint8List data) async {
    await _api.setData(
      DataPreviewMessage(textureId: _textureId, data: data),
    );
  }

  static Future<CIImagePreviewController> initialize() async {
    final message = await _api.create();
    return CIImagePreviewController._(message.textureId);
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
    if (configuration.ready) {
      await _api.connect(
        BindPreviewMessage(
          textureId: _textureId,
          filterId: configuration._filterId,
        ),
      );
    } else {
      throw 'Make sure `configuration.prepare()` was completed before connecting to preview';
    }
  }

  Future<void> disconnect(
    CIFilterConfiguration configuration,
  ) async {
    await _api.disconnect(
      PreviewMessage(textureId: _textureId),
    );
  }

  Future<void> dispose() async {
    await _api.dispose(
      PreviewMessage(textureId: _textureId),
    );
  }
}
