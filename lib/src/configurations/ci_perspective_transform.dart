part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a perspective transform filter.
///
/// * [topRight] updates the `inputTopRight` value of filter.
/// * [bottomLeft] updates the `inputBottomLeft` value of filter.
/// * [topLeft] updates the `inputTopLeft` value of filter.
/// * [bottomRight] updates the `inputBottomRight` value of filter.
///
/// See also:
///
///  * [CIPerspectiveTransform](https://developer.apple.com/documentation/coreimage/ciperspectivetransform), which
///    defines the exact information for filter.
class CIPerspectiveTransformConfiguration extends CIFilterConfiguration {
  final PointParameter _topRight;
  final PointParameter _bottomLeft;
  final PointParameter _topLeft;
  final PointParameter _bottomRight;

  /// Create a [CIPerspectiveTransformConfiguration] with default values.
  CIPerspectiveTransformConfiguration()
    : _topRight = CGPositionParameter(
        'inputTopRight',
        'Top Right',
        const Point(646.0, 507.0),
      ),
      _bottomLeft = CGPositionParameter(
        'inputBottomLeft',
        'Bottom Left',
        const Point(155.0, 153.0),
      ),
      _topLeft = CGPositionParameter(
        'inputTopLeft',
        'Top Left',
        const Point(118.0, 484.0),
      ),
      _bottomRight = CGPositionParameter(
        'inputBottomRight',
        'Bottom Right',
        const Point(548.0, 140.0),
      ),
      super('CIPerspectiveTransform');

  /// The top-right coordinate of a transform.
  ///
  /// Defaults to `Point(646.0, 507.0)`.
  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  /// The bottom-left coordinate of a transform.
  ///
  /// Defaults to `Point(155.0, 153.0)`.
  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  /// The top-left coordinate of a transform.
  ///
  /// Defaults to `Point(118.0, 484.0)`.
  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  /// The bottom-right coordinate of a transform.
  ///
  /// Defaults to `Point(548.0, 140.0)`.
  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.geometryAdjustment,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _topRight,
    _bottomLeft,
    _topLeft,
    _bottomRight,
  ];
}
