part of flutter_core_image_filters;

class CIPerspectiveCorrectionConfiguration extends CIFilterConfiguration {
  final PointParameter _bottomLeft;
  final PointParameter _topRight;
  final PointParameter _topLeft;
  final NumberParameter _crop;
  final PointParameter _bottomRight;

  CIPerspectiveCorrectionConfiguration()
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
        _topLeft = CGPositionParameter(
          'inputTopLeft',
          'Top Left',
          const Point(118.0, 484.0),
        ),
        _crop = SliderNSNumberParameter(
          'inputCrop',
          'Crop',
          28,
        ),
        _bottomRight = CGPositionParameter(
          'inputBottomRight',
          'Bottom Right',
          const Point(548.0, 140.0),
        ),
        super('CIPerspectiveCorrection');
  set bottomLeft(Point<double> value) {
    _bottomLeft.value = value;
  }

  set topRight(Point<double> value) {
    _topRight.value = value;
  }

  set topLeft(Point<double> value) {
    _topLeft.value = value;
  }

  set crop(double value) {
    _crop.value = value;
  }

  set bottomRight(Point<double> value) {
    _bottomRight.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_bottomLeft, _topRight, _topLeft, _crop, _bottomRight];
}
