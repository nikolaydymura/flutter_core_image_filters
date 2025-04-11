part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a spotlight filter.
///
/// * [lightPointsAt] updates the `inputLightPointsAt` value of filter.
/// * [color] updates the `inputColor` value of filter.
/// * [concentration] updates the `inputConcentration` value of filter.
/// * [brightness] updates the `inputBrightness` value of filter.
/// * [lightPosition] updates the `inputLightPosition` value of filter.
///
/// See also:
///
///  * [CISpotLight](https://developer.apple.com/documentation/coreimage/cispotlight), which
///    defines the exact information for filter.
class CISpotLightConfiguration extends CIFilterConfiguration {
  final VectorParameter _lightPointsAt;
  final ColorParameter _color;
  final NumberParameter _concentration;
  final NumberParameter _brightness;
  final VectorParameter _lightPosition;

  /// Create a [CISpotLightConfiguration] with default values.
  CISpotLightConfiguration()
    : _lightPointsAt = CIVectorParameter(
        'inputLightPointsAt',
        'Light Points At',
        const [200, 200, 0],
      ),
      _color = CIColorParameter(
        'inputColor',
        'Color',
        const Color.fromRGBO(255, 255, 255, 1),
      ),
      _concentration = SliderNSNumberParameter(
        'inputConcentration',
        'Concentration',
        0.1,
        min: 0.001,
        max: 1.5,
      ),
      _brightness = SliderNSNumberParameter(
        'inputBrightness',
        'Brightness',
        3,
        min: 0,
        max: 10,
      ),
      _lightPosition = CIVectorParameter(
        'inputLightPosition',
        'Light Position',
        [400, 600, 150],
      ),
      super('CISpotLight');

  /// The x and y position that the spotlight points at.
  ///
  /// Defaults to `[200, 200, 0]`.
  set lightPointsAt(List<double> value) {
    _lightPointsAt.value = value;
  }

  /// The color of the spotlight.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1)`.
  set color(Color value) {
    _color.value = value;
  }

  /// The size of the spotlight.
  ///
  /// Defaults to `0.1`.
  ///
  /// Range: `0.001` to `1.5`.
  set concentration(double value) {
    _concentration.value = value;
  }

  /// The brightness of the spotlight.
  ///
  /// Defaults to `3.0`.
  ///
  /// Range: `0.0` to `10.0`.
  set brightness(double value) {
    _brightness.value = value;
  }

  /// The x and y position of the spotlight.
  ///
  /// Defaults to `[400, 600, 150]`.
  set lightPosition(List<double> value) {
    _lightPosition.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.stylize,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _lightPointsAt,
    _color,
    _concentration,
    _brightness,
    _lightPosition,
  ];
}
