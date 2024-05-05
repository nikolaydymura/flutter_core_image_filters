part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAffineClamp filter.
class CIAffineClampConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  CIAffineClampConfiguration()
      : _transform = CGAffineTransformParameter(
          'inputTransform',
          'Transform',
          const CGAffineTransform(),
        ),
        super('CIAffineClamp');

  /// The transform to apply to the image.
  set transform(CGAffineTransform value) {
    _transform.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.tileEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_transform];
}
