part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a color controls filter.
///
/// * [brightness] updates the `inputBrightness` value of filter.
/// * [saturation] updates the `inputSaturation` value of filter.
/// * [contrast] updates the `inputContrast` value of filter.
///
/// See also:
///
///  * [CIColorControls](https://developer.apple.com/documentation/coreimage/cicolorcontrols), which
///    defines the exact information for filter.
class CIColorControlsConfiguration extends CIFilterConfiguration {
  final NumberParameter _brightness;
  final NumberParameter _saturation;
  final NumberParameter _contrast;

  /// Create a [CIColorControlsConfiguration] with default values.
  CIColorControlsConfiguration()
    : _brightness = SliderNSNumberParameter(
        'inputBrightness',
        'Brightness',
        0,
        min: -1,
        max: 1,
      ),
      _saturation = SliderNSNumberParameter(
        'inputSaturation',
        'Saturation',
        1,
        min: 0,
        max: 2,
      ),
      _contrast = SliderNSNumberParameter(
        'inputContrast',
        'Contrast',
        1,
        min: 0.0,
        max: 4,
      ),
      super('CIColorControls');

  /// The amount of brightness to apply.
  ///
  /// Defaults to `0.0`.
  ///
  /// This value ranges from `-1.0` to `1.0`.
  set brightness(double value) {
    _brightness.value = value;
  }

  /// The amount of saturation to apply.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `2.0`.
  set saturation(double value) {
    _saturation.value = value;
  }

  /// The amount of contrast to apply.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `4.0`.
  set contrast(double value) {
    _contrast.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.colorAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.interlaced,
    CICategory.nonSquarePixels,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _brightness,
    _saturation,
    _contrast,
  ];
}
