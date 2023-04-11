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
    if (configuration is GroupCIFilterConfiguration) {
      final conf = findByParameter(configuration);
      if (conf != null) {
        update(conf);
      } else {
        await configuration._api
            .setNSNumberParameter(configuration._filterId, name, floatValue);
      }
    }
  }
}

extension on ConfigurationParameter {
  CIFilterConfiguration? findByParameter(
      GroupCIFilterConfiguration configuration) {
    return configuration._configurations.firstWhereOrNull(
      (conf) =>
          conf.parameters.firstWhereOrNull((parameter) => parameter == this) !=
          null,
    );
  }
}
