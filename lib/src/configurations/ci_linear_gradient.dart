part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a linear gradient filter.
///
/// * [color0] updates the `inputColor0` value of filter.
/// * [point1] updates the `inputPoint1` value of filter.
/// * [point0] updates the `inputPoint0` value of filter.
/// * [color1] updates the `inputColor1` value of filter.
///
/// See also:
///
///  * [CILinearGradient](https://developer.apple.com/documentation/coreimage/cilineargradient), which
///    defines the exact information for filter.
class CILinearGradientConfiguration extends CIFilterConfiguration {
  final ColorParameter _color0;
  final PointParameter _point1;
  final PointParameter _point0;
  final ColorParameter _color1;

  /// Create a [CILinearGradientConfiguration] with default values.
  CILinearGradientConfiguration()
      : _color0 = CIColorParameter(
          'inputColor0',
          'Color 1',
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        _point1 = CGPositionParameter(
          'inputPoint1',
          'Point 1',
          const Point(200.0, 200.0),
        ),
        _point0 = CGPositionParameter(
          'inputPoint0',
          'Point 0',
          const Point(0.0, 0.0),
        ),
        _color1 = CIColorParameter(
          'inputColor1',
          'Color 2',
          const Color.fromRGBO(0, 0, 0, 1),
        ),
        super('CILinearGradient');

  /// The first color to use in the gradient.
  ///
  /// Defaults to `Color.fromRGBO(255, 255, 255, 1)`.
  set color0(Color value) {
    _color0.value = value;
  }

  /// The ending position of the gradient.
  ///
  /// Defaults to `Point(200.0, 200.0)`.
  set point1(Point<double> value) {
    _point1.value = value;
  }

  /// The starting position of the gradient.
  ///
  /// Defaults to `Point(0.0, 0.0)`.
  set point0(Point<double> value) {
    _point0.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_color0, _point1, _point0, _color1];

  @override
  bool get hasInputImage => false;
}
