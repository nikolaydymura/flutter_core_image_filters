part of flutter_core_image_filters;

class CGAffineTransformParameter extends VectorParameter<CGAffineTransform> {
  CGAffineTransformParameter(super.name, super.displayName, super.value);

  @override
  FutureOr<void> update(covariant CIFilterConfiguration configuration) async {
    if (!configuration.ready) {
      debugPrint('Invoke `prepare()` before updating parameter $name');
      return;
    }
    await configuration._api.setNSValueParameter(
      configuration._filterId,
      name,
      floats64,
    );
  }

  @override
  List<double> get values => value.storage;
}

class CGAffineTransform {
  final double a;
  final double b;
  final double c;
  final double d;
  final double tx;
  final double ty;

  const CGAffineTransform({
    this.a = 1.0,
    this.b = 0.0,
    this.c = 0.0,
    this.d = 1.0,
    this.tx = 0.0,
    this.ty = 0.0,
  });

  List<double> get storage => [a, b, c, d, tx, ty];

  CGAffineTransform copyWith({
    double? a,
    double? b,
    double? c,
    double? d,
    double? tx,
    double? ty,
  }) {
    return CGAffineTransform(
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      tx: tx ?? this.tx,
      ty: ty ?? this.ty,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CGAffineTransform &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b &&
          c == other.c &&
          d == other.d &&
          tx == other.tx &&
          ty == other.ty;

  // coverage:ignore-start
  @override
  int get hashCode =>
      a.hashCode ^
      b.hashCode ^
      c.hashCode ^
      d.hashCode ^
      tx.hashCode ^
      ty.hashCode;
  // coverage:ignore-end
}
