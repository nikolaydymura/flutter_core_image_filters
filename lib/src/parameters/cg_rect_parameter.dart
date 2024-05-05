part of '../../flutter_core_image_filters.dart';

class CGRectParameter extends RectParameter {
  CGRectParameter(super.name, super.displayName, super.value);

  bool _needsUpdate = true;

  @override
  set value(Rect value) {
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
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      values,
    );
  }
}
