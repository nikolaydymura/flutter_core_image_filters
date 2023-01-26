part of flutter_core_image_filters;

class CIBumpDistortionLinearConfiguration extends CIFilterConfiguration {
  final PointParameter _center;
  final NumberParameter _radius;
  final NumberParameter _scale;
  final NumberParameter _angle;

  CIBumpDistortionLinearConfiguration()
      : _center = CGPositionParameter(
          'inputCenter',
          'Center',
          const Point(150.0, 150.0),
        ),
        _radius = SliderNSNumberParameter(
          'inputRadius',
          'Radius',
          300,
          min: 0,
          max: 600,
        ),
        _scale = SliderNSNumberParameter(
          'inputScale',
          'Scale',
          0.5,
          min: 0,
          max: 1,
        ),
        _angle = SliderNSNumberParameter(
          'inputAngle',
          'Angle',
          0,
          min: 0,
          max: 6.283185307179586,
        ),
        super('CIBumpDistortionLinear');

  set center(Point<double> value) {
    _center.value = value;
  }

  set radius(double value) {
    _radius.value = value;
  }

  set scale(double value) {
    _scale.value = value;
  }

  set angle(double value) {
    _angle.value = value;
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
  List<ConfigurationParameter> get parameters =>
      [_radius, _scale, _center, _angle];
}
