part of flutter_core_image_filters;

class CGRectParameter extends RectParameter {
  CGRectParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      [value.left, value.top, value.width, value.height],
    );
  }
}
