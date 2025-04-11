part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a flash transition filter.
///
/// * [color] updates the `inputColor` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [maxStriationRadius] updates the `inputMaxStriationRadius` value of filter.
/// * [extent] updates the `inputExtent` value of filter.
/// * [striationStrength] updates the `inputStriationStrength` value of filter.
/// * [fadeThreshold] updates the `inputFadeThreshold` value of filter.
/// * [striationContrast] updates the `inputStriationContrast` value of filter.
///
/// See also:
///
///  * [CIFlashTransition](https://developer.apple.com/documentation/coreimage/ciflashtransition), which
///    defines the exact information for filter.
class CIFlashTransitionConfiguration extends CIFilterConfiguration
    with TargetImageMixin {
  final ColorParameter _color;
  final NumberParameter _time;
  final PointParameter _center;
  final NumberParameter _maxStriationRadius;
  final RectParameter _extent;
  final NumberParameter _striationStrength;
  final NumberParameter _fadeThreshold;
  final NumberParameter _striationContrast;

  /// Create a [CIFlashTransitionConfiguration] with default values.
  CIFlashTransitionConfiguration()
    : _color = CIColorParameter(
        'inputColor',
        'Color',
        const Color.fromRGBO(255, 204, 153, 1.0),
      ),
      _time = SliderNSNumberParameter('inputTime', 'Time', 0, min: 0, max: 1),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _maxStriationRadius = SliderNSNumberParameter(
        'inputMaxStriationRadius',
        'Maximum Striation Radius',
        2.58,
        min: 0,
        max: 10,
      ),
      _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 300, 300),
      ),
      _striationStrength = SliderNSNumberParameter(
        'inputStriationStrength',
        'Striation Strength',
        0.5,
        min: 0,
        max: 3,
      ),
      _fadeThreshold = SliderNSNumberParameter(
        'inputFadeThreshold',
        'Fade Threshold',
        0.85,
        min: 0,
        max: 1,
      ),
      _striationContrast = SliderNSNumberParameter(
        'inputStriationContrast',
        'Striation Contrast',
        1.375,
        min: 0,
        max: 5,
      ),
      super('CIFlashTransition');

  /// The color of the light rays emanating from the flash.
  ///
  /// Defaults to `Color.fromRGBO(255, 204, 153, 1.0)`.
  set color(Color value) {
    _color.value = value;
  }

  /// The time.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`
  set time(double value) {
    _time.value = value;
  }

  /// The x and y position to use as the center of the effect.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The radius of the light rays emanating from the flash.
  ///
  /// Defaults to `2.58`.
  ///
  /// Range: `0.0` to `10.0`.
  set maxStriationRadius(double value) {
    _maxStriationRadius.value = value;
  }

  /// The extent of the flash.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 300, 300)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The strength of the light rays emanating from the flash.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `3.0`.
  set striationStrength(double value) {
    _striationStrength.value = value;
  }

  /// The amount of fade between the flash and the target image.
  ///
  /// Defaults to `0.85`.
  ///
  /// Range: `0.0` to `1.0`.
  set fadeThreshold(double value) {
    _fadeThreshold.value = value;
  }

  /// The contrast of the light rays emanating from the flash.
  ///
  /// Defaults to `1.375`.
  ///
  /// Range: `0.0` to `5.0`.
  set striationContrast(double value) {
    _striationContrast.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.transition,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _color,
    _time,
    _center,
    _maxStriationRadius,
    _extent,
    _striationStrength,
    _fadeThreshold,
    _striationContrast,
    _targetImage,
  ];
}
