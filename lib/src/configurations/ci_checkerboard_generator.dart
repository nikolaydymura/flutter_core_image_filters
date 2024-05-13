part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a checkerboard generator filter.
///
/// * [sharpness] updates the `inputSharpness` value of filter.
/// * [color0] updates the `inputColor0` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [width] updates the `inputWidth` value of filter.
/// * [color1] updates the `inputColor1` value of filter.
///
/// See also:
///
///  * [CICheckerboardGenerator](https://developer.apple.com/documentation/coreimage/cicheckerboardgenerator), which
///    defines the exact information for filter.
class CICheckerboardGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _sharpness;
  final ColorParameter _color0;
  final PointParameter _center;
  final NumberParameter _width;
  final ColorParameter _color1;

  /// Create a [CICheckerboardGeneratorConfiguration] with default values.
  CICheckerboardGeneratorConfiguration()
      : _sharpness = SliderNSNumberParameter(
          'inputSharpness',
          'Sharpness',
          1,
          min: 0,
          max: 1,
        ),
        _color0 = CIColorParameter(
          'inputColor0',
          'Color 1',
          const Color.fromRGBO(255, 225, 225, 1.0),
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _width = SliderNSNumberParameter(
          'inputWidth',
          'Width',
          80,
          min: 0,
          max: 800,
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color 2',
          const Color.fromRGBO(0, 0, 0, 1.0),
        ),
        super('CICheckerboardGenerator');

  /// The sharpness of the edges in the pattern.
  ///
  /// Defaults to `1.0`.
  ///
  /// This value ranges from `0.0` to `1.0`.
  set sharpness(double value) {
    _sharpness.value = value;
  }

  /// A color to use for the first set of squares.
  ///
  /// Defaults to `Color.fromRGBO(255, 225, 225, 1.0)`.
  set color0(Color value) {
    _color0.value = value;
  }

  /// The center of the effect as x and y coordinates.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The width of the squares in the pattern.
  ///
  /// Defaults to `80.0`.
  ///
  /// This value ranges from `0.0` to `800.0`.
  set width(double value) {
    _width.value = value;
  }

  /// A color to use for the second set of squares.
  ///
  /// Defaults to `Color.fromRGBO(0, 0, 0, 1.0)`.
  set color1(Color value) {
    _color1.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_sharpness, _color0, _center, _width, _color1];

  @override
  bool get hasInputImage => false;
}
