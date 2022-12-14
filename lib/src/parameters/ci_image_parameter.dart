part of flutter_core_image_filters;

class CIImageParameter extends DataParameter {
  CIImageParameter(super.name, super.displayName);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
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
