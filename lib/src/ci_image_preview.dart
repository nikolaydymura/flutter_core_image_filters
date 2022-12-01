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

  Future<void> setImageSource(InputSource source) async {
    if (source is DataInputSource) {
      await _api.setData(
        DataPreviewMessage(textureId: _textureId, data: source.data),
      );
    } else if (source is FileInputSource) {
      await _api.setSource(
        SourcePreviewMessage(
          textureId: _textureId,
          path: source.path,
          asset: false,
        ),
      );
    } else if (source is AssetInputSource) {
      await _api.setSource(
        SourcePreviewMessage(
          textureId: _textureId,
          path: source.path,
          asset: true,
        ),
      );
    }
  }

  static Future<CIImagePreviewController> initialize() async {
    final message = await _api.create();
    return CIImagePreviewController._(message.textureId);
  }

  static Future<CIImagePreviewController> fromFile(File file) async {
    final controller = await initialize();
    await controller.setImageSource(FileInputSource(file));
    return controller;
  }

  static Future<CIImagePreviewController> fromAsset(String asset) async {
    final controller = await initialize();
    await controller.setImageSource(AssetInputSource(asset));
    return controller;
  }

  static Future<CIImagePreviewController> fromMemory(Uint8List data) async {
    final controller = await initialize();
    await controller.setImageSource(DataInputSource(data));
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
