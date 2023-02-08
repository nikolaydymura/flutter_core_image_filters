part of flutter_core_image_filters;

class Mat3Parameter extends VectorParameter<Mat3> {
  Mat3Parameter(super.name, super.displayName, super.value);

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

class Mat3 {
  final List<double> storage;

  Mat3._(this.storage);

  factory Mat3(List<double> items) {
    if (items.length != 9) {
      throw 'Array must be 9 items';
    }
    return Mat3._(List.unmodifiable(items));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mat3 &&
          runtimeType == other.runtimeType &&
          storage == other.storage;

// coverage:ignore-start
  @override
  int get hashCode => storage.hashCode;
// coverage:ignore-end
}
