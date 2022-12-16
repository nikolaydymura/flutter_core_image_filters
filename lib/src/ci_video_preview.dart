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
// coverage:ignore-start
  static final VideoPreviewApi _gApi = VideoPreviewApi();
// coverage:ignore-end
  final VideoPreviewApi _api;
  final int _textureId;

  CIVideoPreviewController._(this._api, this._textureId);

  Future<void> setVideoSource(PathInputSource source) async {
    if (source is FileInputSource) {
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

  static Future<CIVideoPreviewController> initialize({
    @visibleForTesting VideoPreviewApi? previewApi,
  }) async {
// coverage:ignore-start
    final api = previewApi ?? _gApi;
// coverage:ignore-end
    final textureId = await api.create();
    return CIVideoPreviewController._(api, textureId);
  }

// coverage:ignore-start
  static Future<CIVideoPreviewController> fromFile(File file) async {
    final controller = await initialize();
    await controller.setVideoSource(FileInputSource(file));
    return controller;
  }

  static Future<CIVideoPreviewController> fromAsset(String asset) async {
    final controller = await initialize();
    await controller.setVideoSource(AssetInputSource(asset));
    return controller;
  }

// coverage:ignore-end
  Future<void> connect(CIFilterConfiguration configuration) async {
    if (configuration.ready) {
      await _api.connect(_textureId, configuration._filterId);
    } else {
      throw 'Make sure `configuration.prepare()` was completed before connecting to preview';
    }
  }

  Future<void> disconnect() async {
    await _api.disconnect(_textureId);
  }

  Future<void> dispose() async {
    await _api.dispose(_textureId);
  }

  Future<void> play() async {
    await _api.resume(_textureId);
  }

  Future<void> pause() async {
    await _api.pause(_textureId);
  }
}
