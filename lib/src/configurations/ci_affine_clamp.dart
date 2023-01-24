part of flutter_core_image_filters;

class CIAffineClampConfiguration extends CIFilterConfiguration {
  final VectorParameter _transform;

  CIAffineClampConfiguration()
      : _transform = CGAffineTransformParameter(
          'inputTransform',
          'Transform',
          const CGAffineTransform().storage,
        ),
        super('CIAffineClamp');

  set transform(CGAffineTransform value) {
    _transform.value = value.storage;
  }

  @override
  List<ConfigurationParameter> get parameters => [_transform];
}
