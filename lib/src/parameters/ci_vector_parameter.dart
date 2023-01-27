part of flutter_core_image_filters;

class CIVectorParameter extends VectorParameter {
  final int? length;
  List<double> _value;

  CIVectorParameter(String name, String displayName, this._value, [this.length])
      : super(name, displayName, _value);

  @override
  List<double> get value => _value;

  @override
  set value(List<double> v) {
    final l = length;
    if (l != null) {
      if (v.length != l) {
        throw 'Array must be $l length';
      }
    }
    _value = v;
  }

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      value,
    );
  }
}
