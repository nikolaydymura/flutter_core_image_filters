part of flutter_core_image_filters;

class NSStringParameter extends StringParameter {
  NSStringParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {}
}
