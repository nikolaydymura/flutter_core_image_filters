part of flutter_core_image_filters;

class NSNumberParameter extends NumberParameter {
  NSNumberParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await CIFilterConfiguration._api.updateParameter(configuration._filterId, name, value);
  }
}
