part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a disc blur filter.
///
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CIDiscBlur](https://developer.apple.com/documentation/coreimage/cidiscblur), which
///    defines the exact information for filter.
class CIDiscBlurConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;

  /// Create a [CIDiscBlurConfiguration] with default values.
  CIDiscBlurConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        8,
        min: 0,
        max: 100,
      ),
      super('CIDiscBlur');

  /// The radius of the blur, in pixels.
  ///
  /// Defaults to `8.0`.
  ///
  /// Range: `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.blur,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_radius];
}
