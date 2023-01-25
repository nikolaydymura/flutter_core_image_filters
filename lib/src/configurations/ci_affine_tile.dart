part of flutter_core_image_filters;

class CIAffineTileConfiguration extends CIFilterConfiguration {
  final VectorParameter _transform;

  CIAffineTileConfiguration()
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
