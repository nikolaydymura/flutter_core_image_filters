part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a stripes generator filter.
///
/// * [width] updates the `inputWidth` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [sharpness] updates the `inputSharpness` value of filter.
/// * [color0] updates the `inputColor0` value of filter.
/// * [color1] updates the `inputColor1` value of filter.
///
/// See also:
///
///  * [CIStripesGenerator](https://developer.apple.com/documentation/coreimage/cistripesgenerator), which
///    defines the exact information for filter.
class CIStripesGeneratorConfiguration extends CIFilterConfiguration {
  final NumberParameter _width;
  final PointParameter _center;
  final NumberParameter _sharpness;
  final ColorParameter _color0;
  final ColorParameter _color1;

  /// Create a [CIStripesGeneratorConfiguration] with default values.
  CIStripesGeneratorConfiguration()
    : _width = SliderNSNumberParameter(
        'inputWidth',
        'Width',
        80,
        min: 0,
        max: 800,
      ),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _sharpness = SliderNSNumberParameter(
        'inputSharpness',
        'Sharpness',
        1,
        min: 0,
        max: 1,
      ),
      _color0 = CIColorParameter(
        'inputColor0',
        'Color 1',
        const Color.fromRGBO(255, 255, 255, 1),
      ),
      _color1 = CIColorParameter(
        'inputColor1',
        'Color 2',
        const Color.fromRGBO(0, 0, 0, 1),
      ),
      super('CIStripesGenerator');

  /// The width of a stripe.
  ///
  /// Defaults to `80.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set width(double value) {
    _width.value = value;
  }

  /// The x and y position to use as the center of the stripe pattern.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The sharpness of the stripe pattern.
  ///
  /// Defaults to `1.0`.
  ///
  /// Range: `0.0` to `1.0`.
  set sharpness(double value) {
    _sharpness.value = value;
  }

  /// A color to use for the odd stripes.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1)`.
  set color0(Color value) {
    _color0.value = value;
  }

  /// A color to use for the even stripes.
  ///
  /// Defaults to `Color.fromRGBO(0, 0, 0, 1)`.
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
  List<ConfigurationParameter> get parameters => [
    _width,
    _center,
    _sharpness,
    _color0,
    _color1,
  ];

  @override
  bool get hasInputImage => false;
}
