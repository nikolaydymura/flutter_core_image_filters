part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a Gaussian blur filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIGaussianBlur](https://developer.apple.com/documentation/coreimage/cigaussianblur), which
///    defines the exact information for filter.
class CIGaussianBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIGaussianBlurConfiguration] with default values.
  CIGaussianBlurConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        10,
        min: 0,
        max: 100,
      ),
      super('CIGaussianBlur');

  /// The radius of the blur, in pixels.
  ///
  /// Defaults to `10.0`.
  ///
  /// Range: `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.blur,
    CICategory.stillImage,
    CICategory.video,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
