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
// coverage:ignore-start
  static final ImagePreviewApi _gApi = ImagePreviewApi();

// coverage:ignore-end
  final ImagePreviewApi _api;
  final int _textureId;

  CIImagePreviewController._(this._api, this._textureId);

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

  Future<void> setOutputSurface(Rect rect) async {
    await _api.setOutput(
      _textureId,
      [rect.left, rect.top, rect.width, rect.height],
    );
  }

  static Future<CIImagePreviewController> initialize({
    @visibleForTesting ImagePreviewApi? previewApi,
  }) async {
// coverage:ignore-start
    final api = previewApi ?? _gApi;
// coverage:ignore-end
    final textureId = await api.create();
    return CIImagePreviewController._(api, textureId);
  }

// coverage:ignore-start
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

  static Future<CIImagePreviewController> fromRect(Rect rect) async {
    final controller = await initialize();
    await controller.setOutputSurface(rect);
    return controller;
  }

// coverage:ignore-end
  Future<void> connect(
    CIFilterConfiguration configuration, {
    CIContext context = CIContext.mlt,
  }) async {
    if (configuration.ready) {
      if (configuration is GroupCIFilterConfiguration) {
        for (final config in configuration._configurations) {
          await _api.connect(
            _textureId,
            config._filterId,
            context.platformKey,
          );
        }
      } else {
        await _api.connect(
          _textureId,
          configuration._filterId,
          context.platformKey,
        );
      }
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
}
