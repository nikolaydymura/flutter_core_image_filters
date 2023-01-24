part of flutter_core_image_filters;

class CIPerspectiveTransformConfiguration extends CIFilterConfiguration {
  final PointParameter _topRight;
  final PointParameter _bottomLeft;
  final PointParameter _topLeft;
  final PointParameter _bottomRight;

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

  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_topRight, _bottomLeft, _topLeft, _bottomRight];
}
