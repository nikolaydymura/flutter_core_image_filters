part of flutter_core_image_filters;

class CILightTunnelConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;
  final NumberParameter _rotation;

  CILightTunnelConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          100,
          min: 1,
          max: 500,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _rotation = SliderNSNumberParameter(
          'inputRotation',
          'Rotation',
          100,
          min: 1,
          max: 500,
        ),
        super('CILightTunnel');

  set radius(double value) {
    _radius.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set rotation(double value) {
    _rotation.value = value;
  }

  @override
  List<ConfigurationParameter> get parameters => [_radius, _center, _rotation];
}
