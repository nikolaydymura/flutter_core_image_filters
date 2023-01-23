part of flutter_core_image_filters;

class CITriangleKaleidoscopeConfiguration extends CIFilterConfiguration {
  final NumberParameter _decay;
  final PointParameter _point;
  final NumberParameter _rotation;
  final NumberParameter _size;

  CITriangleKaleidoscopeConfiguration()
      : _decay = SliderNSNumberParameter(
          'inputDecay',
          'Decay',
          0.85,
          min: 0,
          max: 1,
        ),
        _point = CGPositionParameter(
          'inputPoint',
          'Point',
          const Point(150.0, 150.0),
        ),
        _rotation = SliderNSNumberParameter(
          'inputRotation',
          'Rotation',
          5.924285296593801,
          min: 0,
          max: 6.283185307179586,
        ),
        _size = SliderNSNumberParameter(
          'inputSize',
          'Size',
          700,
          min: 0,
          max: 1000,
        ),
        super('CITriangleKaleidoscope');
  set decay(double value) {
    _decay.value = value;
  }

  set point(Point<double> value) {
    _point.value = value;
  }

  set rotation(double value) {
    _rotation.value = value;
  }

  set size(double value) {
    _size.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters =>
      [_decay, _point, _rotation, _size];
}
