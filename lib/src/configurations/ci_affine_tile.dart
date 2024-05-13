part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an affine tile filter.
///
/// * [transform] updates the `inputTransform` value of filter.
///
/// See also:
///
///  * [CIAffineTile](https://developer.apple.com/documentation/coreimage/ciaffinetile), which
///    defines the exact information for filter.
class CIAffineTileConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  /// Create a [CIAffineTileConfiguration] with default values.
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
