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
  static final VideoPreviewApi _api = VideoPreviewApi();
  final int _textureId;

  CIVideoPreviewController._(this._textureId);

  Future<void> setVideoAsset(String asset) async {
    await _api.setSource(
      SourcePreviewMessage(textureId: _textureId, path: asset, asset: true),
    );
  }

  Future<void> setVideoFile(File file) async {
    await _api.setSource(
      SourcePreviewMessage(
        textureId: _textureId,
        path: file.absolute.path,
        asset: false,
      ),
    );
  }

  static Future<CIVideoPreviewController> initialize() async {
    final message = await _api.create();
    return CIVideoPreviewController._(message.textureId);
  }

  static Future<CIVideoPreviewController> fromFile(File file) async {
    final controller = await initialize();
    await controller.setVideoFile(file);
    return controller;
  }

  static Future<CIVideoPreviewController> fromAsset(String asset) async {
    final controller = await initialize();
    await controller.setVideoAsset(asset);
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

  Future<void> play() async {
    await _api.resume(
      PreviewMessage(textureId: _textureId),
    );
  }

  Future<void> pause() async {
    await _api.pause(
      PreviewMessage(textureId: _textureId),
    );
  }
}
