part of '../../flutter_core_image_filters.dart';

class CIVectorParameter extends ListParameter {
  final int? length;

  CIVectorParameter(super.name, super.displayName, super.value, [this.length]);

  @override
  set value(List<double> v) {
    final l = length;
    if (l != null) {
      if (v.length != l) {
        debugPrint('WARNING: Array must be $l length');
        return;
      }
    }
    if (listEquals(v, super.value)) {
      _needsUpdate = true;
    }
    super.value = v;
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
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      values,
    );
  }
}
