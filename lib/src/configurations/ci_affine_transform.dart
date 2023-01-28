part of flutter_core_image_filters;

class CIAffineTransformConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  CIAffineTransformConfiguration()
      : _transform = CGAffineTransformParameter(
          'inputTransform',
          'Transform',
          const CGAffineTransform(),
        ),
        super('CIAffineTransform');

  set transform(CGAffineTransform value) {
    _transform.transform = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_transform];
}
