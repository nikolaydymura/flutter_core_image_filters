part of flutter_core_image_filters;

class CIToneCurveConfiguration extends CIFilterConfiguration {
  final VectorParameter _point0;
  final VectorParameter _point1;
  final VectorParameter _point2;
  final VectorParameter _point3;
  final VectorParameter _point4;

  CIToneCurveConfiguration()
      : _point0 = CIVectorParameter(
          'inputPoint0',
          'Point0',
          [0, 0],
        ),
        _point1 = CIVectorParameter(
          'inputPoint1',
          'Point1',
          [0.25, 0.25],
        ),
        _point2 = CIVectorParameter(
          'inputPoint2',
          'Point2',
          [0.5, 0.5],
        ),
        _point3 = CIVectorParameter(
          'inputPoint3',
          'Point3',
          [0.75, 0.75],
        ),
        _point4 = CIVectorParameter(
          'inputPoint4',
          'Point4',
          [1, 1],
        ),
        super('CIToneCurve');

  set point0(List<double> value) {
    _point0.value = value;
  }

  set point1(List<double> value) {
    _point1.value = value;
  }

  set point2(List<double> value) {
    _point2.value = value;
  }

  set point3(List<double> value) {
    _point3.value = value;
  }

  set point4(List<double> value) {
    _point4.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_point0, _point1, _point2, _point3, _point4];
}
