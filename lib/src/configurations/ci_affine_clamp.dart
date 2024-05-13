part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an affine clamp filter.
///
/// * [transform] updates the `inputTransform` value of filter.
///
/// See also:
///
///  * [CIAffineClamp](https://developer.apple.com/documentation/coreimage/ciaffineclamp), which
///    defines the exact information for filter.
class CIAffineClampConfiguration extends CIFilterConfiguration {
  final CGAffineTransformParameter _transform;

  /// Create a [CIAffineClampConfiguration] with default values.
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
