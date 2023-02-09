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
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api
        .setNSNumberParameter(configuration._filterId, name, floatValue);
  }
}
