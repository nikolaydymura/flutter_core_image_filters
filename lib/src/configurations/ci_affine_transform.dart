part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAffineTransform filter.
class CIAffineTransformConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  CIAffineTransformConfiguration()
    : _transform = CGAffineTransformParameter(
        'inputTransform',
        'Transform',
        const CGAffineTransform(),
      ),
      super('CIAffineTransform');

  /// The transform to apply to the image.
  set transform(CGAffineTransform value) {
    _transform.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.geometryAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_transform];
}
