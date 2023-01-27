part of flutter_core_image_filters;

class CIKeystoneCorrectionCombinedConfiguration extends CIFilterConfiguration {
  final PointParameter _topRight;
  final PointParameter _topLeft;
  final PointParameter _bottomLeft;
  final PointParameter _bottomRight;
  final NumberParameter _focalLength;

  CIKeystoneCorrectionCombinedConfiguration()
      : _topRight = CGPositionParameter(
          'inputTopRight',
          'Top Right',
          const Point(0.0, 0.0),
        ),
        _topLeft = CGPositionParameter(
          'inputTopLeft',
          'Top Left',
          const Point(0.0, 0.0),
        ),
        _bottomLeft = CGPositionParameter(
          'inputBottomLeft',
          'Bottom Left',
          const Point(0.0, 0.0),
        ),
        _bottomRight = CGPositionParameter(
          'inputBottomRight',
          'Bottom Right',
          const Point(0.0, 0.0),
        ),
        _focalLength = SliderNSNumberParameter(
          'inputFocalLength',
          'Focal Length',
          28,
        ),
        super('CIKeystoneCorrectionCombined');

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
  Iterable<CICategory> get categories => {
        CICategory.geometryAdjustment,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters =>
      [_topRight, _topLeft, _bottomLeft, _bottomRight, _focalLength];
}
