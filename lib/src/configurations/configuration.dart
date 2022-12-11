part of flutter_core_image_filters;

abstract class CIFilterConfiguration extends FilterConfiguration {
// coverage:ignore-start
  static final FilterApi _gAPI = FilterApi();
// coverage:ignore-end

  int _filterId = -1;
  final String name;
// coverage:ignore-start
  FilterApi get _api => _gAPI;
// coverage:ignore-end

  bool get ready => _filterId != -1;

  CIFilterConfiguration(this.name);

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

  Future<Image> export(
    InputSource source, {
    ImageExportFormat format = ImageExportFormat.auto,
  }) async {
    if (source is DataInputSource) {
      await _api.setInputData(_filterId, source.data);
      if (format == ImageExportFormat.auto) {
        format = ImageExportFormat.png;
      }
    } else if (source is FileInputSource) {
      await _api.setInputFile(_filterId, source.path);
      if (format == ImageExportFormat.auto) {
        format = source.file.path.endsWith('.png')
            ? ImageExportFormat.png
            : ImageExportFormat.jpeg;
      }
    } else if (source is AssetInputSource) {
      await _api.setInputAsset(_filterId, source.path);
      if (format == ImageExportFormat.auto) {
        format = source.path.endsWith('.png')
            ? ImageExportFormat.png
            : ImageExportFormat.jpeg;
      }
    }
    late Uint8List bytes;
    switch (format) {
      case ImageExportFormat.png:
        bytes = await _api.exportData(_filterId, 'png');
        break;
      case ImageExportFormat.jpeg:
        bytes = await _api.exportData(_filterId, 'jpeg');
        break;
      default:
        break;
    }
    final Image image = await decodeImageFromList(bytes);
    return image;
  }

  Future<void> exportImageFile(ImageExportConfig config) async {
    final source = config.source;
    final output = config.output;
    var format = config.format;
    if (source is DataInputSource) {
      await _api.setInputData(_filterId, source.data);
    } else if (source is FileInputSource) {
      await _api.setInputFile(_filterId, source.path);
    } else if (source is AssetInputSource) {
      await _api.setInputAsset(_filterId, source.path);
    }
    if (format == ImageExportFormat.auto) {
      format = output.path.endsWith('.png')
          ? ImageExportFormat.png
          : ImageExportFormat.jpeg;
    }
    switch (format) {
      case ImageExportFormat.png:
        await _api.exportImageFile(_filterId, output.absolute.path, 'png');
        break;
      case ImageExportFormat.jpeg:
        await _api.exportImageFile(_filterId, output.absolute.path, 'jpeg');
        break;
      default:
        break;
    }
  }

  Future<void> exportVideoFile(VideoExportConfig config) async {
    final source = config.source;
    final output = config.output;
    var format = config.format;
    if (format == VideoExportFormat.auto) {
      format = output.path.endsWith('.mp4')
          ? VideoExportFormat.mp4
          : VideoExportFormat.mov;
    }
    final bool asset = source is AssetInputSource;
    switch (format) {
      case VideoExportFormat.mp4:
        await _api.exportVideoFile(
          _filterId,
          asset,
          source.path,
          output.absolute.path,
          'mp4',
        );
        break;
      case VideoExportFormat.mov:
        await _api.exportVideoFile(
          _filterId,
          asset,
          source.path,
          output.absolute.path,
          'mov',
        );
        break;
      default:
        break;
    }
  }
// coverage:ignore-start
  @override
  List<ConfigurationParameter> get parameters => [];
// coverage:ignore-end
}

abstract class InputSource {}

abstract class PathInputSource extends InputSource {
  final String path;

  PathInputSource(this.path);
}

class DataInputSource extends InputSource {
  final Uint8List data;

  DataInputSource(this.data);
}

class FileInputSource extends PathInputSource {
  final File file;

  FileInputSource(this.file) : super(file.absolute.path);
}

class AssetInputSource extends PathInputSource {
  AssetInputSource(super.path);
}

class ImageExportConfig {
  final InputSource source;
  final File output;
  final ImageExportFormat format;

  ImageExportConfig(
    this.source,
    this.output, {
    this.format = ImageExportFormat.auto,
  });
}

enum ImageExportFormat { png, jpeg, auto }

class VideoExportConfig {
  final PathInputSource source;
  final File output;
  final VideoExportFormat format;

  VideoExportConfig(
    this.source,
    this.output, {
    this.format = VideoExportFormat.auto,
  });
}

enum VideoExportFormat { mp4, mov, auto }

@visibleForTesting
class PassthroughFilterConfiguration extends CIFilterConfiguration {
  @override
  final FilterApi _api;

  PassthroughFilterConfiguration(this._api) : super('Passthrough');
}