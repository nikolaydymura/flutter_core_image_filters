part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a lenticular halo generator filter.
///
/// * [haloRadius] updates the `inputHaloRadius` value of filter.
/// * [color] updates the `inputColor` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [striationContrast] updates the `inputStriationContrast` value of filter.
/// * [haloOverlap] updates the `inputHaloOverlap` value of filter.
/// * [time] updates the `inputTime` value of filter.
/// * [striationStrength] updates the `inputStriationStrength` value of filter.
/// * [haloWidth] updates the `inputHaloWidth` value of filter.
///
/// See also:
///
///  * [CILenticularHaloGenerator](https://developer.apple.com/documentation/coreimage/cilenticularhalogenerator), which
///    defines the exact information for filter.
class CILenticularHaloGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _haloRadius;
  final ColorParameter _color;
  final PointParameter _center;
  final NumberParameter _striationContrast;
  final NumberParameter _haloOverlap;
  final NumberParameter _time;
  final NumberParameter _striationStrength;
  final NumberParameter _haloWidth;

  /// Create a [CILenticularHaloGeneratorConfiguration] with default values.
  CILenticularHaloGeneratorConfiguration()
      : _haloRadius = SliderNSNumberParameter(
          'inputHaloRadius',
          'Halo Radius',
          70,
          min: 0,
          max: 1000,
        ),
        _color = CIColorParameter(
          'inputColor',
          'Color',
          const Color.fromRGBO(255, 229, 204, 1),
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _striationContrast = SliderNSNumberParameter(
          'inputStriationContrast',
          'Striation Contrast',
          1,
          min: 0,
          max: 5,
        ),
        _haloOverlap = SliderNSNumberParameter(
          'inputHaloOverlap',
          'Halo Overlap',
          0.77,
          min: 0,
          max: 1,
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
        _haloWidth = SliderNSNumberParameter(
          'inputHaloWidth',
          'Halo Width',
          87,
          min: 0,
          max: 300,
        ),
        super('CILenticularHaloGenerator');

  /// The radius of the halo.
  ///
  /// Defaults to `70.0`.
  ///
  /// Range: `0.0` to `1000.0`.
  set haloRadius(double value) {
    _haloRadius.value = value;
  }

  /// The color of the halo.
  ///
  /// Defaults to `Color.fromRGBO(255, 229, 204, 1)`.
  set color(Color value) {
    _color.value = value;
  }

  /// The x and y position to use as the center of the halo.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The contrast of the halo colors.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `5.0`.
  set striationContrast(double value) {
    _striationContrast.value = value;
  }

  /// The separation of colors in the halo.
  ///
  /// Defaults to `0.77`.
  ///
  /// Range: `0.0` to `1.0`.
  set haloOverlap(double value) {
    _haloOverlap.value = value;
  }

  /// The current time of the effect.
  ///
  /// Defaults to `0.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set time(double value) {
    _time.value = value;
  }

  /// The intensity of the halo colors.
  ///
  /// Defaults to `0.5`.
  ///
  /// Range: `0.0` to `3.0`.
  set striationStrength(double value) {
    _striationStrength.value = value;
  }

  /// The width of the halo, from its inner radius to its outer radius.
  ///
  /// Defaults to `87.0`.
  ///
  /// Range: `0.0` to `300.0`.
  set haloWidth(double value) {
    _haloWidth.value = value;
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
        _haloRadius,
        _color,
        _center,
        _striationContrast,
        _haloOverlap,
        _time,
        _striationStrength,
        _haloWidth,
        _haloRadius,
      ];

  @override
  bool get hasInputImage => false;
}
