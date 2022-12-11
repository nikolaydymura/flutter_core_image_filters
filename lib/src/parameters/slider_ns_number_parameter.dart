part of flutter_core_image_filters;

class SliderNSNumberParameter extends RangeNumberParameter {
  SliderNSNumberParameter(
    super.name,
    super.displayName,
    super.value, {
    super.min,
    super.max,
  });

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await configuration._api
        .setNSNumberParameter(configuration._filterId, name, value.toDouble());
  }
}
