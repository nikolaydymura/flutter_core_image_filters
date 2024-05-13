part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a sunbeams generator filter.
///
/// * [center] updates the `inputCenter` value of filter.
/// * [striationContrast] updates the `inputStriationContrast` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [striationStrength] updates the `inputStriationStrength` value of filter.
/// * [maxStriationRadius] updates the `inputMaxStriationRadius` value of filter.
/// * [sunRadius] updates the `inputSunRadius` value of filter.
/// * [color] updates the `inputColor` value of filter.
///
/// See also:
///
///  * [CISunbeamsGenerator](https://developer.apple.com/documentation/coreimage/cisunbeamsgenerator), which
///    defines the exact information for filter.
class CISunbeamsGeneratorConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _striationContrast;
  final NumberParameter _time;
  final NumberParameter _striationStrength;
  final NumberParameter _maxStriationRadius;
  final NumberParameter _sunRadius;
  final ColorParameter _color;

  /// Create a [CISunbeamsGeneratorConfiguration] with default values.
  CISunbeamsGeneratorConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _striationContrast = SliderNSNumberParameter(
          'inputStriationContrast',
          'Striation Contrast',
          1.375,
          min: 0,
          max: 5,
        ),
        _time = SliderNSNumberParameter(
          'inputTime',
          'Time',
          0,
          min: 0,
          max: 1,
        ),
        _striationStrength = SliderNSNumberParameter(
          'inputStriationStrength',
          'Striation Strength',
          0.5,
          min: 0,
          max: 3,
        ),
        _maxStriationRadius = SliderNSNumberParameter(
          'inputMaxStriationRadius',
          'Maximum Striation Radius',
          2.58,
          min: 0,
          max: 10,
        ),
        _sunRadius = SliderNSNumberParameter(
          'inputSunRadius',
          'Sun Radius',
          40,
          min: 0,
          max: 800,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 127, 0, 1),
        ),
        super('CISunbeamsGenerator');

  /// The x and y position to use as the center of the sunbeam pattern.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The contrast of the sunbeams.
  ///
  /// Defaults to `1.375`.
  ///
  /// Range: `0.0` to `5.0`.
  set striationContrast(double value) {
    _striationContrast.value = value;
  }

  /// The duration of the effect.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The intensity of the sunbeams.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `3.0`.
  set striationStrength(double value) {
    _striationStrength.value = value;
  }

  /// The radius of the sunbeams.
  ///
  /// Defaults to `2.58`.
  ///
  /// Range: `0.0` to `10.0`.
  set maxStriationRadius(double value) {
    _maxStriationRadius.value = value;
  }

  /// The radius of the sun.
  ///
  /// Defaults to `40.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set sunRadius(double value) {
    _sunRadius.value = value;
  }

  /// The color of the sun.
  ///
  /// Defaults to `Color.fromRGBO(255, 127, 0, 1)`.
  set color(Color value) {
    _color.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.generator,
        CICategory.video,
        CICategory.stillImage,
        CICategory.highDynamicRange,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters => [
        _center,
        _striationContrast,
        _time,
        _striationStrength,
        _maxStriationRadius,
        _sunRadius,
        _color,
      ];

  @override
  bool get hasInputImage => false;
}
