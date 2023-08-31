part of flutter_core_image_filters;

class CIImageParameter extends DataParameter {
  CIImageParameter(super.name, super.displayName);

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
      await configuration._api.setCIImageSourceParameter(
        configuration._filterId,
        name,
        true,
        asset!,
      );
    } else if (file != null) {
      await configuration._api.setCIImageSourceParameter(
        configuration._filterId,
        name,
        false,
        file!.absolute.path,
      );
    } else if (data != null) {
      await configuration._api
          .setCIImageDataParameter(configuration._filterId, name, data!);
    }
  }
}
