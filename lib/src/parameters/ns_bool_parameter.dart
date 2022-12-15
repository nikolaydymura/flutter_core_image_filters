part of flutter_core_image_filters;

class NSBoolParameter extends BoolParameter {
  NSBoolParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await configuration._api.setNSNumberParameter(
      configuration._filterId,
      name,
      (value ? 1 : 0).toDouble(),
    );
  }
}
