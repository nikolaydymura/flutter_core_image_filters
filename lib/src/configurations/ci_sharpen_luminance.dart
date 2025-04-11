part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a sharpen luminance filter.
///
/// * [sharpness] updates the `inputSharpness` value of filter.
/// * [radius] updates the `inputRadius` value of filter.
///
/// See also:
///
///  * [CISharpenLuminance](https://developer.apple.com/documentation/coreimage/cisharpenluminance), which
///    defines the exact information for filter.
class CISharpenLuminanceConfiguration extends CIFilterConfiguration {
  final NumberParameter _sharpness;
  final NumberParameter _radius;

  /// Create a [CISharpenLuminanceConfiguration] with default values.
  CISharpenLuminanceConfiguration()
    : _sharpness = SliderNSNumberParameter(
        'inputSharpness',
        'Sharpness',
        0.4,
        min: 0,
        max: 2,
      ),
      _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        1.69,
        min: 0,
        max: 20,
      ),
      super('CISharpenLuminance');

  /// The amount of sharpening to apply.
  ///
  /// Defaults to `0.4`.
  ///
  /// Range: `0.0` to `2.0`.
  set sharpness(double value) {
    _sharpness.value = value;
  }

  /// The distance from the center of the effect.
  ///
  /// Defaults to `1.69`.
  ///
  /// Range: `0.0` to `20.0`.
  set radius(double value) {
    _radius.value = value;
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
  List<ConfigurationParameter> get parameters => [_sharpness, _radius];
}
