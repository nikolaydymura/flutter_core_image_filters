part of flutter_core_image_filters;

class CIPerspectiveTransformWithExtentConfiguration
    extends CIFilterConfiguration {
  final PointParameter _bottomLeft;
  final PointParameter _topRight;
  final PointParameter _bottomRight;
  final RectParameter _extent;
  final PointParameter _topLeft;

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
          const Rect.fromLTWH(
            0,
            0,
            300,
            300,
          ),
        ),
        _topLeft = CGPositionParameter(
          'inputTopLeft',
          'Top Left',
          const Point(118.0, 484.0),
        ),
        super('CIPerspectiveTransformWithExtent');

  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  set extent(Rect value) {
    _extent.value = value;
  }

  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
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
