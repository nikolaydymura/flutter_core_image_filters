part of flutter_core_image_filters;

class CICircleSplashDistortionConfiguration extends CIFilterConfiguration {
  final NumberParameter _radius;
  final PointParameter _center;

  CICircleSplashDistortionConfiguration()
      : _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          150,
          min: 0,
          max: 1000,
        ),
        _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        super('CICircleSplashDistortion');

  set radius(double value) {
    _radius.value = value;
  }

  set center(Point<double> value) {
    _center.value = value;
  }

  @override
  Iterable<CICategory> get categories => {
        CICategory.distortionEffect,
        CICategory.video,
        CICategory.stillImage,
        CICategory.builtIn,
        CICategory.highDynamicRange
      };

  @override
  List<ConfigurationParameter> get parameters => [_radius, _center];
}
