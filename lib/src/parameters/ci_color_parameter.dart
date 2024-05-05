part of '../../flutter_core_image_filters.dart';

class CIColorParameter extends ColorParameter {
  CIColorParameter(super.name, super.displayName, super.value);
  bool _needsUpdate = true;

  @override
  set value(Color value) {
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
    await configuration._api.setCIColorParameter(
      configuration._filterId,
      name,
      values,
    );
  }

  @override
  List<double> get values => [
        value.red / 255.0,
        value.green / 255.0,
        value.blue / 255.0,
        value.alpha / 255.0,
      ];
}
