part of '../../flutter_core_image_filters.dart';

/// A configuration for a CIAffineTile filter.
class CIAffineTileConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  CIAffineTileConfiguration()
      : _transform = CGAffineTransformParameter(
          'inputTransform',
          'Transform',
          const CGAffineTransform(),
        ),
        super('CIAffineTile');

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
