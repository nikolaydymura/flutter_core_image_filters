part of flutter_core_image_filters;

class CIKeystoneCorrectionHorizontalConfiguration
    extends CIFilterConfiguration {
  final PointParameter _topRight;
  final PointParameter _topLeft;
  final PointParameter _bottomLeft;
  final PointParameter _bottomRight;
  final NumberParameter _focalLength;

  CIKeystoneCorrectionHorizontalConfiguration()
      : _topRight = CGPositionParameter(
          'inputTopRight',
          'TopRight',
          const Point(0.0, 0.0),
        ),
        _topLeft = CGPositionParameter(
          'inputTopLeft',
          'TopLeft',
          const Point(0.0, 0.0),
        ),
        _bottomLeft = CGPositionParameter(
          'inputBottomLeft',
          'BottomLeft',
          const Point(0.0, 0.0),
        ),
        _bottomRight = CGPositionParameter(
          'inputBottomRight',
          'BottomRight',
          const Point(0.0, 0.0),
        ),
        _focalLength = SliderNSNumberParameter(
          'inputFocalLength',
          'FocalLength',
          28,
        ),
        super('CIKeystoneCorrectionHorizontal');

  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  set focalLength(double value) {
    _focalLength.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_topRight, _topLeft, _bottomLeft, _bottomRight, _focalLength];
}
