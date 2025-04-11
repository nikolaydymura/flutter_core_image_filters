part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure an unsharp mask filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [intensity] updates the `inputIntensity` value of filter.
///
/// See also:
///
///  * [CIUnsharpMask](https://developer.apple.com/documentation/coreimage/ciunsharpmask), which
///    defines the exact information for filter.
class CIUnsharpMaskConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final NumberParameter _intensity;

  /// Create a [CIUnsharpMaskConfiguration] with default values.
  CIUnsharpMaskConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        2.5,
        min: 0,
        max: 100,
      ),
      _intensity = SliderNSNumberParameter(
        'inputIntensity',
        'Intensity',
        0.5,
        min: 0,
        max: 1,
      ),
      super('CIUnsharpMask');

  /// The radius of the unsharp mask effect.
  ///
  /// Defaults to `2.5`.
  ///
  /// Range: `0.0` to `100.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The intensity of the effect.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `1.0`.
  set intensity(double value) {
    _intensity.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.sharpen,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _intensity];
}
