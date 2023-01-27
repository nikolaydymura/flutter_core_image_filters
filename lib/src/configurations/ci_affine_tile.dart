part of flutter_core_image_filters;

class CIAffineTileConfiguration extends CIFilterConfiguration {
  final VectorParameter _transform;

  CIAffineTileConfiguration()
      : _transform = CGAffineTransformParameter(
          'inputTransform',
          'Transform',
          const CGAffineTransform().storage,
        ),
        super('CIAffineTile');

  set transform(CGAffineTransform value) {
    _transform.value = value.storage;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.tileEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_transform];
}
