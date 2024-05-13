part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a tone curve filter.
///
/// * [point0] updates the `inputPoint0` value of filter.
/// * [point1] updates the `inputPoint1` value of filter.
/// * [point2] updates the `inputPoint2` value of filter.
/// * [point3] updates the `inputPoint3` value of filter.
/// * [point4] updates the `inputPoint4` value of filter.
///
/// See also:
///
///  * [CIToneCurve](https://developer.apple.com/documentation/coreimage/citonecurve), which
///    defines the exact information for filter.
class CIToneCurveConfiguration extends CIFilterConfiguration {
  final PointParameter _point0;
  final PointParameter _point1;
  final PointParameter _point2;
  final PointParameter _point3;
  final PointParameter _point4;

  /// Create a [CIToneCurveConfiguration] with default values.
  CIToneCurveConfiguration()
      : _point0 = CGPositionParameter(
          'inputPoint0',
          'Point 0',
          const Point(0.0, 0.0),
        ),
        _point1 = CGPositionParameter(
          'inputPoint1',
          'Point 1',
          const Point(0.25, 0.25),
        ),
        _point2 = CGPositionParameter(
          'inputPoint2',
          'Point 2',
          const Point(0.5, 0.5),
        ),
        _point3 = CGPositionParameter(
          'inputPoint3',
          'Point 3',
          const Point(0.75, 0.75),
        ),
        _point4 = CGPositionParameter(
          'inputPoint4',
          'Point 4',
          const Point(1.0, 1.0),
        ),
        super('CIToneCurve');

  /// A vector containing the position of the first point of the tone curve.
  ///
  /// Defaults to `Point(0.0, 0.0)`.
  set point0(Point<double> value) {
    _point0.value = value;
  }

  /// A vector containing the position of the second point of the tone curve.
  ///
  /// Defaults to `Point(0.25, 0.25)`.
  set point1(Point<double> value) {
    _point1.value = value;
  }

  /// A vector containing the position of the third point of the tone curve.
  ///
  /// Defaults to `Point(0.5, 0.5)`.
  set point2(Point<double> value) {
    _point2.value = value;
  }

  /// A vector containing the position of the fourth point of the tone curve.
  ///
  /// Defaults to `Point(0.75, 0.75)`.
  set point3(Point<double> value) {
    _point3.value = value;
  }

  /// A vector containing the position of the fifth point of the tone curve.
  ///
  /// Defaults to `Point(1.0, 1.0)`.
  set point4(Point<double> value) {
    _point4.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.colorAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.interlaced,
        CICategory.nonSquarePixels,
        CICategory.builtIn,
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_point0, _point1, _point2, _point3, _point4];
}
