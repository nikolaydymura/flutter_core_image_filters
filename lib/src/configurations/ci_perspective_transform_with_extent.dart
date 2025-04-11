part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a perspective transform with extent filter.
///
/// * [bottomLeft] updates the `inputBottomLeft` value of filter.
/// * [topRight] updates the `inputTopRight` value of filter.
/// * [bottomRight] updates the `inputBottomRight` value of filter.
/// * [extent] updates the `inputExtent` value of filter.
/// * [topLeft] updates the `inputTopLeft` value of filter.
///
/// See also:
///
///  * [CIPerspectiveTransformWithExtent](https://developer.apple.com/documentation/coreimage/ciperspectivetransformwithextent), which
///    defines the exact information for filter.
class CIPerspectiveTransformWithExtentConfiguration
    extends CIFilterConfiguration {
  final PointParameter _bottomLeft;
  final PointParameter _topRight;
  final PointParameter _bottomRight;
  final RectParameter _extent;
  final PointParameter _topLeft;

  /// Create a [CIPerspectiveTransformWithExtentConfiguration] with default values.
  CIPerspectiveTransformWithExtentConfiguration()
    : _bottomLeft = CGPositionParameter(
        'inputBottomLeft',
        'Bottom Left',
        const Point(155.0, 153.0),
      ),
      _topRight = CGPositionParameter(
        'inputTopRight',
        'Top Right',
        const Point(646.0, 507.0),
      ),
      _bottomRight = CGPositionParameter(
        'inputBottomRight',
        'Bottom Right',
        const Point(548.0, 140.0),
      ),
      _extent = CGRectParameter(
        'inputExtent',
        'Extent',
        const Rect.fromLTWH(0, 0, 300, 300),
      ),
      _topLeft = CGPositionParameter(
        'inputTopLeft',
        'Top Left',
        const Point(118.0, 484.0),
      ),
      super('CIPerspectiveTransformWithExtent');

  /// The bottom-left coordinate of a transform with extent.
  ///
  /// Defaults to `Point(155.0, 153.0)`.
  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  /// The top-right coordinate of a transform with extent.
  ///
  /// Defaults to `Point(646.0, 507.0)`.
  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  /// The bottom-right coordinate of a transform with extent.
  ///
  /// Defaults to `Point(548.0, 140.0)`.
  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  /// A rectangle that defines the extent of the effect.
  ///
  /// Defaults to `Rect.fromLTWH(0, 0, 300, 300)`.
  set extent(Rect value) {
    _extent.value = value;
  }

  /// The top-left coordinate of a transform with extent.
  ///
  /// Defaults to `Point(118.0, 484.0)`.
  set topLeft(Point<double> value) {
    _topLeft.value = value;
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
    _bottomLeft,
    _topRight,
    _bottomRight,
    _extent,
    _topLeft,
  ];
}
