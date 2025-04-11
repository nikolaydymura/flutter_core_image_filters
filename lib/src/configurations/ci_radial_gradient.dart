part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a radial gradient filter.
///
/// * [radius1] updates the `inputRadius1` value of filter.
/// * [color0] updates the `inputColor0` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [radius0] updates the `inputRadius0` value of filter.
/// * [color1] updates the `inputColor1` value of filter.
///
/// See also:
///
///  * [CIRadialGradient](https://developer.apple.com/documentation/coreimage/ciradialgradient), which
///    defines the exact information for filter.
class CIRadialGradientConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius1;
  final ColorParameter _color0;
  final PointParameter _center;
  final NumberParameter _radius0;
  final ColorParameter _color1;

  /// Create a [CIRadialGradientConfiguration] with default values.
  CIRadialGradientConfiguration()
    : _radius1 = SliderNSNumberParameter(
        'inputRadius1',
        'Radius 2',
        100,
        min: 0,
        max: 800,
      ),
      _color0 = CIColorParameter(
        'inputColor0',
        'Color 1',
        const Color.fromRGBO(255, 255, 255, 1),
      ),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _radius0 = SliderNSNumberParameter(
        'inputRadius0',
        'Radius 1',
        5,
        min: 0,
        max: 800,
      ),
      _color1 = CIColorParameter(
        'inputColor1',
        'Color 2',
        const Color.fromRGBO(0, 0, 0, 1),
      ),
      super('CIRadialGradient');

  /// The radius of the ending circle to use in the gradient.
  ///
  /// Defaults to `100.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set radius1(double value) {
    _radius1.value = value;
  }

  /// The first color to use in the gradient.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1)`.
  set color0(Color value) {
    _color0.value = value;
  }

  /// The center of the effect as x and y coordinates.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The radius of the starting circle to use in the gradient.
  ///
  /// Defaults to `5.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set radius0(double value) {
    _radius0.value = value;
  }

  /// The second color to use in the gradient.
  ///
  /// Defaults to `Color.fromRGBO(0, 0, 0, 1)`.
  set color1(Color value) {
    _color1.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.gradient,
    CICategory.video,
    CICategory.stillImage,
    CICategory.highDynamicRange,
    CICategory.builtIn,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _radius1,
    _color0,
    _center,
    _radius0,
    _color1,
  ];

  @override
  bool get hasInputImage => false;
}
