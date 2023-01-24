part of flutter_core_image_filters;

class CIVectorParameter extends VectorParameter {
  CIVectorParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      value,
    );
  }
}
