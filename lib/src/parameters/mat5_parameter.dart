part of flutter_core_image_filters;

class Mat5Parameter extends VectorParameter<Mat5> {
  Mat5Parameter(super.name, super.displayName, super.value);

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

class Mat5 {
  final List<double> storage;

  Mat5._(this.storage);

  factory Mat5(List<double> items) {
    if (items.length != 25) {
      throw 'Array must be 25 items';
    }
    return Mat5._(List.unmodifiable(items));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Mat5 &&
          runtimeType == other.runtimeType &&
          storage == other.storage;

// coverage:ignore-start
  @override
  int get hashCode => storage.hashCode;
// coverage:ignore-end
}
