part of flutter_core_image_filters;

class CGRectParameter extends SizeParameter {
  CGRectParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await CIFilterConfiguration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      [value.width, value.height],
    );
  }
}