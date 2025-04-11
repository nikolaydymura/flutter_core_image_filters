part of '../../flutter_core_image_filters.dart';

/// The properties you use to configure a perspective tile filter.
///
/// * [bottomLeft] updates the `inputBottomLeft` value of filter.
/// * [topLeft] updates the `inputTopLeft` value of filter.
/// * [topRight] updates the `inputTopRight` value of filter.
/// * [bottomRight] updates the `inputBottomRight` value of filter.
///
/// See also:
///
///  * [CIPerspectiveTile](https://developer.apple.com/documentation/coreimage/ciperspectivetile), which
///    defines the exact information for filter.
class CIPerspectiveTileConfiguration extends CIFilterConfiguration {
  final PointParameter _bottomLeft;
  final PointParameter _topLeft;
  final PointParameter _topRight;
  final PointParameter _bottomRight;

  /// Create a [CIPerspectiveTileConfiguration] with default values.
  CIPerspectiveTileConfiguration()
    : _bottomLeft = CGPositionParameter(
        'inputBottomLeft',
        'Bottom Left',
        const Point(155.0, 153.0),
      ),
      _topLeft = CGPositionParameter(
        'inputTopLeft',
        'Top Left',
        const Point(118.0, 484.0),
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
      super('CIPerspectiveTile');

  /// The bottom-left coordinate of a tile.
  ///
  /// Defaults to `Point(155.0, 153.0)`.
  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  /// The top-right coordinate of a tile.
  ///
  /// Defaults to `Point(646.0, 507.0)`.
  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  /// The top-left coordinate of a tile.
  ///
  /// Defaults to `Point(118.0, 484.0)`.
  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  /// The bottom-right coordinate of a tile.
  ///
  /// Defaults to `Point(548.0, 140.0)`.
  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
    CICategory.tileEffect,
    CICategory.video,
    CICategory.stillImage,
    CICategory.builtIn,
    CICategory.highDynamicRange,
  };

  @override
  List<ConfigurationParameter> get parameters => [
    _bottomLeft,
    _topRight,
    _topLeft,
    _bottomRight,
  ];
}
