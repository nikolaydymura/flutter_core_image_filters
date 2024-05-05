part of '../../flutter_core_image_filters.dart';

class CIPerspectiveTileConfiguration extends CIFilterConfiguration {
  final PointParameter _bottomLeft;
  final PointParameter _topLeft;
  final PointParameter _topRight;
  final PointParameter _bottomRight;

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

  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

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
  List<ConfigurationParameter> get parameters =>
      [_bottomLeft, _topRight, _topLeft, _bottomRight];
}
