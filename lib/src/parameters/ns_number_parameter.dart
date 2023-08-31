part of flutter_core_image_filters;

class NSNumberParameter extends NumberParameter {
  NSNumberParameter(super.name, super.displayName, super.value);

  bool _needsUpdate = true;

  @override
  set value(num value) {
    if (value != super.value) {
      _needsUpdate = true;
    }
    super.value = value;
  }

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
    await configuration._api
        .setNSNumberParameter(configuration._filterId, name, floatValue);
  }
}
