part of flutter_core_image_filters;

class CIVideoPreviewController extends VideoPreviewController {
// coverage:ignore-start
  static final VideoPreviewApi _gApi = VideoPreviewApi();

// coverage:ignore-end
  final VideoPreviewApi _api;
  @override
  final int textureId;

  CIVideoPreviewController._(this._api, this.textureId);

  @override
  Future<void> setVideoSource(PathInputSource source) async {
    if (source is FileInputSource) {
      await _api.setSource(
        SourcePreviewMessage(
          textureId: textureId,
          path: source.path,
          asset: false,
        ),
      );
    } else if (source is AssetInputSource) {
      await _api.setSource(
        SourcePreviewMessage(
          textureId: textureId,
          path: source.path,
          asset: true,
        ),
      );
    }
  }

  static Future<VideoPreviewController> initialize({
    @visibleForTesting VideoPreviewApi? previewApi,
  }) async {
// coverage:ignore-start
    final api = previewApi ?? _gApi;
// coverage:ignore-end
    final textureId = await api.create();
    return CIVideoPreviewController._(api, textureId);
  }

// coverage:ignore-start
  static Future<VideoPreviewController> fromFile(File file) async {
    final controller = await initialize();
    await controller.setVideoSource(FileInputSource(file));
    return controller;
  }

  static Future<VideoPreviewController> fromAsset(String asset) async {
    final controller = await initialize();
    await controller.setVideoSource(AssetInputSource(asset));
    return controller;
  }

// coverage:ignore-end
  @override
  Future<void> connect(
    covariant CIFilterConfiguration configuration, {
    CIContext context = CIContext.system,
  }) async {
    await super.connect(configuration);
    await _api.connect(
      textureId,
      configuration._filterId,
      context.platformKey,
    );
  }

  @override
  Future<void> disconnect() async {
    await _api.disconnect(textureId);
  }

  @override
  Future<void> dispose() async {
    await _api.dispose(textureId);
  }

  @override
  Future<void> play() async {
    await _api.resume(textureId);
  }

  @override
  Future<void> pause() async {
    await _api.pause(textureId);
  }
}
