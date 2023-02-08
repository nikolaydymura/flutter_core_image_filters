part of flutter_core_image_filters;

class Mat7Parameter extends VectorParameter<Mat7> {
  Mat7Parameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api.setCIVectorParameter(
      configuration._filterId,
      name,
      values,
    );
  }

  @override
  List<double> get values => value.storage;
}

class Mat7 {
  final List<double> storage;

  Mat7._(this.storage);

  factory Mat7(List<double> items) {
    if (items.length != 49) {
      throw 'Array must be 49 items';
    }
    return Mat7._(List.unmodifiable(items));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mat7 &&
          runtimeType == other.runtimeType &&
          storage == other.storage;

// coverage:ignore-start
  @override
  int get hashCode => storage.hashCode;
// coverage:ignore-end
}
