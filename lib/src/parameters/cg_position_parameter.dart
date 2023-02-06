part of flutter_core_image_filters;

class CGPositionParameter extends PointParameter {
  CGPositionParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      [value.x, value.y],
    );
  }
}
