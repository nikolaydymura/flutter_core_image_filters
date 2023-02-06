part of flutter_core_image_filters;

class NSDataParameter extends DataParameter {
  NSDataParameter(super.name, super.displayName);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
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
      await configuration._api
          .setNSDataParameter(configuration._filterId, name, data!);
    }
  }
}
