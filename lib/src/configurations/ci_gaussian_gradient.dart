part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a Gaussian gradient filter.
///
/// * [radius] updates the `inputRadius` value of filter.
/// * [center] updates the `inputCenter` value of filter.
/// * [color1] updates the `inputColor1` value of filter.
/// * [color0] updates the `inputColor0` value of filter.
///
/// See also:
///
///  * [CIGaussianGradient](https://developer.apple.com/documentation/coreimage/cigaussiangradient), which
///    defines the exact information for filter.
class CIGaussianGradientConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;
  final ColorParameter _color1;
  final ColorParameter _color0;

  /// Create a [CIGaussianGradientConfiguration] with default values.
  CIGaussianGradientConfiguration()
    : _radius = SliderNSNumberParameter(
        'inputRadius',
        'Radius',
        300,
        min: 0,
        max: 800,
      ),
      _center = CGPositionParameter(
        'inputCenter',
        'Center',
        const Point(150.0, 150.0),
      ),
      _color1 = CIColorParameter(
        'inputColor1',
        'Color 2',
        const Color.fromRGBO(0, 0, 0, 0),
      ),
      _color0 = CIColorParameter(
        'inputColor0',
        'Color 1',
        const Color.fromRGBO(255, 255, 255, 1),
      ),
      super('CIGaussianGradient');

  /// The radius of the Gaussian distribution.
  ///
  /// Defaults to `300.0`.
  ///
  /// Range: `0.0` to `800.0`.
  set radius(double value) {
    _radius.value = value;
  }

  /// The center of the effect as x and y coordinates.
  ///
  /// Defaults to `Point(150.0, 150.0)`.
  set center(Point<double> value) {
    _center.value = value;
  }

  /// The second color to use in the gradient.
  ///
  /// Defaults to `Color.fromRGBO(0, 0, 0, 0)`.
  set color1(Color value) {
    _color1.value = value;
  }

  /// The first color to use in the gradient.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1)`.
  set color0(Color value) {
    _color0.value = value;
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
    _radius,
    _center,
    _color1,
    _color0,
  ];

  @override
  bool get hasInputImage => false;
}
