part of flutter_core_image_filters;

class CIColorParameter extends ColorParameter {
  CIColorParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api.setCIColorParameter(
      configuration._filterId,
      name,
      floats64,
    );
  }

  @override
  List<double> get values =>
      [value.red / 255.0, value.green / 255.0, value.blue / 255.0, value.alpha / 255.0];
}
