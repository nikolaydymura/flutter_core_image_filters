part of flutter_core_image_filters;

class CIAffineClampConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  CIAffineClampConfiguration()
      : _transform = CGAffineTransformParameter(
          'inputTransform',
          'Transform',
          const CGAffineTransform(),
        ),
        super('CIAffineClamp');

  set transform(CGAffineTransform value) {
    _transform.transform = value;
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
