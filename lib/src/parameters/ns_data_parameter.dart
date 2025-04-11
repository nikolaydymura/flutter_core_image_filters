part of '../../flutter_core_image_filters.dart';

class NSDataParameter extends DataParameter {
  NSDataParameter(super.name, super.displayName);

  bool _needsUpdate = true;

  @override
  set asset(String? asset) {
    if (asset != super.asset) {
      _needsUpdate = true;
    }
    super.asset = asset;
  }

  @override
  set file(File? file) {
    if (file != super.file) {
      _needsUpdate = true;
    }
    super.file = file;
  }

  @override
  set data(Uint8List? data) {
    if (data != super.data) {
      _needsUpdate = true;
    }
    super.data = data;
  }

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    if (!_needsUpdate) {
      return;
    }
    _needsUpdate = false;
    if (asset != null) {
      await configuration._api.setNSDataSourceParameter(
        configuration._filterId,
        name,
        true,
        asset!,
      );
    } else if (file != null) {
      await configuration._api.setNSDataSourceParameter(
        configuration._filterId,
        name,
        false,
        file!.absolute.path,
      );
    } else if (data != null) {
      await configuration._api.setNSDataParameter(
        configuration._filterId,
        name,
        data!,
      );
    }
  }
}

class CubeDataParameter extends DataParameter {
  bool _needsUpdate = true;
  bool _image = false;
  int _size = 0;
  int _columns = 0;
  int _rows = 0;

  set image(bool value) {
    if (value != _image) {
      _needsUpdate = true;
    }
    _image = value;
  }

  set size(int value) {
    if (_size != value) {
      _needsUpdate = true;
    }
    _size = value;
  }

  set rows(int value) {
    if (_rows != value) {
      _needsUpdate = true;
    }
    _rows = value;
  }

  set columns(int value) {
    if (_columns != value) {
      _needsUpdate = true;
    }
    _columns = value;
  }

  @override
  set asset(String? asset) {
    if (asset != super.asset) {
      _needsUpdate = true;
    }
    super.asset = asset;
  }

  @override
  set file(File? file) {
    if (file != super.file) {
      _needsUpdate = true;
    }
    super.file = file;
  }

  @override
  set data(Uint8List? data) {
    if (data != super.data) {
      _needsUpdate = true;
    }
    super.data = data;
  }

  CubeDataParameter(super.name, super.displayName);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    if (!_needsUpdate) {
      return;
    }
    _needsUpdate = false;
    if (_image) {
      if (asset != null) {
        await configuration._api.setCIImageCubeSourceParameter(
          configuration._filterId,
          name,
          true,
          asset!,
          _size,
          _columns,
          _rows,
        );
      } else if (file != null) {
        await configuration._api.setCIImageCubeSourceParameter(
          configuration._filterId,
          name,
          false,
          file!.absolute.path,
          _size,
          _columns,
          _rows,
        );
      } else if (data != null) {
        await configuration._api.setCIImageCubeDataParameter(
          configuration._filterId,
          name,
          data!,
          _size,
          _columns,
          _rows,
        );
      }
    } else {
      if (asset != null) {
        await configuration._api.setNSDataSourceParameter(
          configuration._filterId,
          name,
          true,
          asset!,
        );
      } else if (file != null) {
        await configuration._api.setNSDataSourceParameter(
          configuration._filterId,
          name,
          false,
          file!.absolute.path,
        );
      } else if (data != null) {
        await configuration._api.setNSDataParameter(
          configuration._filterId,
          name,
          data!,
        );
      }
    }
  }
}
