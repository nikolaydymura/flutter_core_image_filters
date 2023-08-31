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
  set value(num value) {
    if (value != super.value) {
      _needsUpdate = true;
    }
    super.value = value;
  }

  bool _needsUpdate = true;

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    if (!_needsUpdate) {
      return;
    }
    _needsUpdate = false;
    await configuration._api.setNSNumberParameter(
      configuration._filterId,
      name,
      intValue.toDouble(),
    );
  }
}
