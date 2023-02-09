part of flutter_core_image_filters;

class SliderNSIntegerParameter extends RangeNumberParameter {
  SliderNSIntegerParameter(
    super.name,
    super.displayName,
    super.value, {
    super.min,
    super.max,
  });

  @override
  num get value {
    if (super.value.isNaN) {
      return super.value;
    }
    return super.value.toInt().toDouble();
  }

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api.setNSNumberParameter(
      configuration._filterId,
      name,
      intValue.toDouble(),
    );
  }
}
