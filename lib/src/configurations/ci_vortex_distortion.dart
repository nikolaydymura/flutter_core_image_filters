part of flutter_core_image_filters;

class CIVortexDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _angle;
  final PointParameter _center;
  final NumberParameter _radius;

  CIVortexDistortionConfiguration()
      : _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          56.54866776461628,
          min: -94.24777960769379,
          max: 94.24777960769379,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 800,
        ),
        super('CIVortexDistortion');

  set angle(double value) {
    _angle.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.distortionEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange,
      };

  @override
  List<ConfigurationParameter> get parameters => [_angle, _center, _radius];
}
