part of flutter_core_image_filters;

abstract class CIFilterConfiguration extends FilterConfiguration
    with VideoFilterConfiguration {
// coverage:ignore-start
  final FilterApi _gAPI = FilterApi();

// coverage:ignore-end

  int _filterId = -1;
  final String name;

// coverage:ignore-start
  FilterApi get _api => _gAPI;

// coverage:ignore-end

  @override
  bool get ready => _filterId != -1;

  bool get hasInputImage => true;

  Iterable<CICategory> get categories;

  CIFilterConfiguration(this.name);

  @override
  Future<void> prepare() async {
    if (_filterId == -1) {
      _filterId = await _api.create(name);
    }
  }

  Future<void> dispose() async {
    if (_filterId >= 0) {
      await _api.dispose(_filterId);
    }
    _filterId = -1;
  }

  Future<void> update() async {
    for (final param in parameters) {
      await param.update(this);
    }
  }

  Future<Uint8List> exportData(
    InputSource source, {
    ImageExportFormat format = ImageExportFormat.auto,
    CIContext context = CIContext.system,
    Rect? crop,
  }) async {
    if (source is DataInputSource) {
      if (hasInputImage) {
        await _api.setInputData(_filterId, source.data);
      } else {
        debugPrint('Input image not supported for $name');
      }
      if (format == ImageExportFormat.auto) {
        format = ImageExportFormat.png;
      }
    } else if (source is FileInputSource) {
      if (hasInputImage) {
        await _api.setInputFile(_filterId, source.path);
      } else {
        debugPrint('Input image not supported for $name');
      }
      if (format == ImageExportFormat.auto) {
        format = source.file.path.endsWith('.png')
            ? ImageExportFormat.png
            : ImageExportFormat.jpeg;
      }
    } else if (source is AssetInputSource) {
      if (hasInputImage) {
        await _api.setInputAsset(_filterId, source.path);
      } else {
        debugPrint('Input image not supported for $name');
      }
      if (format == ImageExportFormat.auto) {
        format = source.path.endsWith('.png')
            ? ImageExportFormat.png
            : ImageExportFormat.jpeg;
      }
    }
    Uint8List bytes = await _api.exportData(
      _filterId,
      format.platformKey,
      context.platformKey,
      crop?.values,
    );
    return bytes;
  }

  Future<Image> export(
    InputSource source, {
    ImageExportFormat format = ImageExportFormat.auto,
    CIContext context = CIContext.system,
    Rect? crop,
  }) async {
    final bytes =
        await exportData(source, format: format, crop: crop, context: context);
    final Image image = await decodeImageFromList(bytes);
    return image;
  }

  Future<void> exportImageFile(
    ImageExportConfig config, {
    CIContext context = CIContext.system,
    Rect? crop,
  }) async {
    final source = config.source;
    final output = config.output;
    var format = config.format;
    if (hasInputImage) {
      if (source is DataInputSource) {
        await _api.setInputData(_filterId, source.data);
      } else if (source is FileInputSource) {
        await _api.setInputFile(_filterId, source.path);
      } else if (source is AssetInputSource) {
        await _api.setInputAsset(_filterId, source.path);
      }
    } else {
      debugPrint('Input image not supported for $name');
    }
    if (format == ImageExportFormat.auto) {
      format = output.path.endsWith('.png')
          ? ImageExportFormat.png
          : ImageExportFormat.jpeg;
    }
    await _api.exportImageFile(
      _filterId,
      output.absolute.path,
      format.platformKey,
      context.platformKey,
      crop?.values,
    );
  }

  @override
  Stream<double> exportVideoFile(
    VideoExportConfig config, {
    Duration period = const Duration(seconds: 1),
  }) async* {
    if (config is! CIVideoExportConfig) {
      config = CIVideoExportConfig.copy(config);
    }
    final source = config.source;
    final output = config.output;
    var format = config.format;
    if (format == VideoExportFormat.auto) {
      format = output.path.endsWith('.mp4')
          ? VideoExportFormat.mp4
          : VideoExportFormat.mov;
    }
    final bool asset = source is AssetInputSource;

    final sessionId = await _api.exportVideoFile(
      _filterId,
      asset,
      source.path,
      output.absolute.path,
      format.platformKey,
      config.context.platformKey,
      config.preset.platformKey,
      period.inMilliseconds,
    );

    final stream = EventChannel('AVAssetExportSession_$sessionId')
        .receiveBroadcastStream()
        .distinct();
    await for (num event in stream) {
      if (event == -100.0) {
        return;
      }
      yield event.toDouble();
    }
  }

// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [];
// coverage:ignore-end
}

class RectInputSource extends InputSource {
  final Rect output;

  RectInputSource(this.output);
}

class CIVideoExportConfig extends VideoExportConfig {
  final CIContext context;
  final AVAssetExportPreset preset;

  CIVideoExportConfig(
    super.source,
    super.output, {
    super.format,
    this.context = CIContext.system,
    this.preset = AVAssetExportPreset.highestQuality,
  });

  CIVideoExportConfig.copy(VideoExportConfig config)
      : this(config.source, config.output, format: config.format);
}

@visibleForTesting
class PassthroughFilterConfiguration extends CIFilterConfiguration {
  @override
  final FilterApi _api;

  PassthroughFilterConfiguration(this._api) : super('Passthrough');

  @override
  Iterable<CICategory> get categories => {};
}

extension on Rect {
  List<double> get values => [top, left, width, height];
}
